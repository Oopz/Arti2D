//
//  Arti2DTestViewController.m
//  CollectionViewTest
//
//  Created by Bill on 15/1/13.
//  Copyright (c) 2013 Bill. All rights reserved.
//

#import "Arti2DTestViewController.h"
#import "Arti2DPack.h"
#import "Arti2DMode.h"
#import <QuartzCore/QuartzCore.h>

@interface Arti2DTestViewController () <UIWebViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic) BOOL started;
@property (nonatomic) NSTimeInterval timestamp;
@property (nonatomic) NSTimeInterval elapsed;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic) NSInteger current;
@property (nonatomic, strong) NSMutableArray *subjects;
@end

@implementation Arti2DTestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	
	[self.optionView setHidden:YES];
	
	self.started = NO;
	
	[self.startButton setEnabled:YES];
	
	self.optionView.layer.borderWidth = 1;
	self.optionView.layer.cornerRadius = 2;
	self.optionView.layer.borderColor = [[UIColor grayColor] CGColor];
	
	self.counterButton.title = @"";
		
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Setup
- (void) setupTopics: (NSMutableArray *)topics {
	self.topics = [@[] mutableCopy];
	
	for(Arti2DPack *pack in topics) {
		[self.topics addObject:pack];
	}
	
}

- (void) setupMode:(Arti2DMode *)mode {
	self.mode = mode;
}



#pragma mark - UITableView Datasource
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	//UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OptionCell"];

	cell.textLabel.text=[NSString stringWithFormat:@"A. Option - %d", indexPath.row];
	cell.detailTextLabel.text = [NSString stringWithFormat:@"description - %d", indexPath.row];
	
	return cell;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	return 5;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	cell.accessoryType = UITableViewCellAccessoryCheckmark;
	
}

- (void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	cell.accessoryType = UITableViewCellAccessoryNone;
	
}

- (void) willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	
	if(toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
	   toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
		
		[self.optionView setHidden:YES];
		//self.webView.frame = self.view.frame;
		
	}else{
		[self.optionView setHidden:NO];
	}
	
}

- (void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
	
	UIInterfaceOrientation toOrientation = self.interfaceOrientation;
	
	if(toOrientation == UIInterfaceOrientationLandscapeLeft ||
	   toOrientation == UIInterfaceOrientationLandscapeRight) {
		
		[self.optionView setHidden:YES];
		self.webView.frame = self.view.frame;
		//[self.webView setBounds:CGRectMake(0, 0, 480, 220)];
	}else{
		[self.optionView setHidden:NO];
	}
	
}




#pragma mark - IBActions
- (void) backButtonTapped:(id)sender {
	[self testEnd];
	
	[self.navigationController popViewControllerAnimated:YES];
	
}

- (void) startButtonTapped:(id)sender {
	
	if(!self.started) {
		NSLog(@"start");
		
		/*
		NSLog(@"setting up topics (%d)", [self.topics count]);
		NSMutableString *tmp = [NSMutableString stringWithString:@"it's including "];
		
		[tmp appendFormat:@"<p>Mode: %@</p>", self.mode.title];		
		
		[tmp appendFormat:@"<ul>"];
		for(Arti2DPack *pack in self.topics) {
			[tmp appendFormat:@"<li style='color:blue;'>%@</li>", pack.packid];
		}
		[tmp appendFormat:@"</ul>"];
		
		[self.webView loadHTMLString:tmp baseURL:[NSURL URLWithString:@"http://203.166.164.7:8080/Enterprise"]];
		 */		
		
		[self testBegin];
		
	}else if([self testNext]){
		// continue ...
		
	}else{
		//NSLog(@"Test is under performing...");
		[self testSubmit];
	}
}

- (void) preparePaper {
	
	self.counterButton.title = [NSString stringWithFormat: @"%d / %d", self.current+1, self.subjects.count];
	
	NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"template" ofType:@"html" inDirectory:nil];

	NSString *htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
	
	NSString *path = [[NSBundle mainBundle] bundlePath];
	NSURL *baseURL = [NSURL fileURLWithPath:path];
	
	[self.webView loadHTMLString:htmlString baseURL:baseURL];
	
}

#pragma UIWebView Delegate
- (void) webViewDidFinishLoad:(UIWebView *)webView {
		
	[self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat: @"Arti2D.ShowQuest(\"%@\")", @"<b>Ni Ma B</b>"]];
	
	
}






- (void) startTimer {
	
	[self.startButton setTitle:[NSString stringWithFormat:@"Next - %d:%02d", self.mode.duration / 60, self.mode.duration % 60]];
	
	self.timestamp = [[NSDate date] timeIntervalSince1970];
	
	// make a new timer and fire count
	NSLog(@"Create a new timer.");
	NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(timerAttack) userInfo:nil repeats:YES];
	self.timer = timer;
	[self.timer fire];
	
}

- (void) timerAttack {	
	NSTimeInterval intv = [[NSDate date] timeIntervalSince1970];
	self.elapsed = intv - self.timestamp;
	
	NSInteger rest = self.mode.duration - self.elapsed;
	
	if(rest <= 0) {
		[self testSubmit];
		
		
	}else{		
		[self.startButton setTitle:[NSString stringWithFormat:@"Next - %d:%02d", rest / 60, rest % 60]];
		
		//NSLog(@"Elapsed: %d s", (int)(self.elapsed));
	}
	
}


- (void) testEnd {
	// invalidate timer
	NSLog(@"Test End. Invalidate timer.");
	[self.timer invalidate];
	
	
	NSInteger rest = self.mode.duration - self.elapsed;
	[self.startButton setTitle:[NSString stringWithFormat:@"Test Over - %d:%02d", rest / 60, rest % 60]];
	
	self.started = NO;
	[self.startButton setEnabled:NO];
}

- (void) testSubmit {
	[self testEnd];
	
	// TODO: conclusion for test
	
	
}

- (void) testBegin {
	
	self.current = 0;
	self.elapsed = 0;
	self.started = YES;
	
	self.subjects = [@[] mutableCopy];
	// TODO: set up subjects form topics
	for(NSInteger i=0; i<self.mode.amount; i++) {
		[self.subjects addObject:@"123abc"];
	}
	
	[self.optionView setHidden:NO];
	
	[self startTimer];
	
	[self preparePaper];
}

- (BOOL) testNext {
	if(++self.current >= [self.subjects count]) {
		return NO;
	}else{
		// TODO: set up next paper
		[self preparePaper];
		
		return YES;
	}
}

#pragma mark - UINavigationController SupportedInterfaceOrientations
- (NSUInteger) supportedInterfaceOrientations {
	if(self.started) {
		return UIInterfaceOrientationMaskAll;
	}else{
		return UIInterfaceOrientationMaskPortrait;
	}
}



@end
