//
//  Arti2DNavigationController.m
//  CollectionViewTest
//
//  Created by Bill on 14/1/13.
//  Copyright (c) 2013 Bill. All rights reserved.
//

#import "Arti2DNavigationController.h"

@interface Arti2DNavigationController ()

@end

@implementation Arti2DNavigationController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSUInteger) supportedInterfaceOrientations {
	NSUInteger orients=[self.visibleViewController supportedInterfaceOrientations];
	
	return 0==orients ? UIInterfaceOrientationMaskAll : orients;
}


@end
