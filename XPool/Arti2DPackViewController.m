//
//  Arti2DPackViewController.m
//  CollectionViewTest
//
//  Created by Bill on 14/1/13.
//  Copyright (c) 2013 Bill. All rights reserved.
//

#import "Arti2DPackViewController.h"
#import "Arti2DButtonCell.h"
#import "Arti2DHeaderView.h"
#import "Arti2DPack.h"
#import "Arti2DTestViewController.h"
#import "Arti2DMode.h"

@interface Arti2DPackViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic, weak) IBOutlet UIPickerView *modePickerView;

@property (nonatomic, strong) NSMutableArray *selectedPacks;
@property (nonatomic, strong) Arti2DMode *selectedMode;
@property (nonatomic, strong) NSMutableArray *availPacks;
@property (nonatomic, strong) NSMutableArray *testModes;

- (IBAction) done:(id)sender;

- (IBAction) backButtonTapped:(id)sender;
- (IBAction) startButtonTapped:(id)sender;
- (IBAction) allButtonTapped:(id)sender;

@end

@implementation Arti2DPackViewController

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
	
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_cork.png"]];
	
	self.selectedPacks = [@[] mutableCopy];
	
	self.availPacks = [@[] mutableCopy];
	for(NSInteger i=0; i<20; i++) {
		Arti2DPack *pack = [[Arti2DPack alloc] initWithId:[NSString stringWithFormat:@"sub pack %d", i]];
		[self.availPacks addObject:pack];
	}
		
	[self.collectionView setAllowsMultipleSelection:YES];
	
	
	
	
	// mode init
	self.testModes = [@[] mutableCopy];
	Arti2DMode *mode = [[Arti2DMode alloc] initWithTitle:@"20 Subs / 20 Mins" duration:20*60 amount:20];
	[self.testModes addObject:mode];
	mode = [[Arti2DMode alloc] initWithTitle:@"30 Subs / 30 Mins" duration:30*60 amount:30];
	[self.testModes addObject:mode];
	
	// select default mode
	[self pickerView:self.modePickerView didSelectRow:0 inComponent:0];
	
	//NSLog(@"default selected: %d", [self.modePickerView selectedRowInComponent:0]);
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - IBActions
- (IBAction) done:(id)sender {
	
}

- (IBAction) backButtonTapped:(id)sender {
	NSLog(@"tapped back...");
	
	if(self.modePickerView.hidden) {
		[self.navigationController popViewControllerAnimated:YES];		
	}else{
		[self.modePickerView setHidden:YES];
	}
}

- (IBAction) startButtonTapped:(id)sender {
	NSLog(@"tapped start...");
	
	if(self.modePickerView.hidden) {
		[self.modePickerView setHidden:NO];
	}else{
		[self.modePickerView setHidden:YES];
		[self performSegueWithIdentifier:@"PrepareTest" sender:self.selectedPacks];
	}
	
}

- (IBAction) allButtonTapped:(id)sender {
	[self.selectedPacks removeAllObjects]; // clear all first
	
	for(NSInteger i=0; i<[self.availPacks count]; i++) {
		NSIndexPath *idx = [NSIndexPath indexPathForItem:i inSection:0];
		[self.collectionView selectItemAtIndexPath:idx animated:YES scrollPosition:UICollectionViewScrollPositionBottom];
		[self collectionView:self.collectionView didSelectItemAtIndexPath:idx];
	}
	
}


#pragma mark - UIPickerView Datasource
- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	
	return 1;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	
	return self.testModes.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	
	return [self.testModes[row] title];
}

#pragma mark - UIPickerView Delegate
- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	
	//NSLog(@"selecting mode %d....", row);
	
	self.selectedMode = self.testModes[row];
}



#pragma mark - UICollectionView Delegate
- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	Arti2DButtonCell *buttonCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PackButtonCell" forIndexPath:indexPath];
	
	Arti2DPack *pack = self.availPacks[indexPath.row];
	buttonCell.pack = pack;
	
	return buttonCell;
	
}

- (UICollectionReusableView *) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
	
	Arti2DHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"PackHeaderView" forIndexPath:indexPath];
	
	Arti2DPack *pack = self.parentPack;
	NSString *text = [NSString stringWithFormat:@"Packs of %@", pack.packid];
	[headerView setHeaderText:text];
	
	return headerView;
	
}



#pragma mark - UICollectionView DataSource
- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	
	return [self.availPacks count];
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
	
	return 1;
}






#pragma mark - UICollectionView Delegate
- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
	
//	NSLog(@"select %d", indexPath.row);
	
	[self.selectedPacks addObject:self.availPacks[indexPath.row]];
	
}

- (void) collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
//	NSInteger idx=[self.selectedPacks indexOfObject:[NSString stringWithFormat:@"%d", indexPath.row]];
	
//	NSLog(@"deselect %d", indexPath.row);
	
	[self.selectedPacks removeObject:self.availPacks[indexPath.row]];
	
}







#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	CGSize retval=CGSizeMake(64, 64);
	retval.height += 16;
	retval.width += 8;
	return retval;
}

- (UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
	
	return UIEdgeInsetsMake(20, 20, 20, 20);
}



- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if([segue.identifier isEqualToString:@"PrepareTest"]) {
		Arti2DTestViewController *testView = segue.destinationViewController;
		
		//[testView.topics removeAllObjects];
		for(Arti2DPack *pack in sender) {
			//[testView.topics addObject:pack];
		}
		
		[testView setupMode:self.selectedMode];
		[testView setupTopics:sender];
		
		NSLog(@"Test start (%@)...", testView);
	}
}


#pragma mark - Supported Interface Orientations
- (NSUInteger) supportedInterfaceOrientations {
	return UIInterfaceOrientationMaskPortrait;
}

@end




