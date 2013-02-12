//
//  Arti2DTestViewController.h
//  CollectionViewTest
//
//  Created by Bill on 15/1/13.
//  Copyright (c) 2013 Bill. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Arti2DMode;

@interface Arti2DTestViewController : UIViewController
@property (nonatomic, weak) IBOutlet UIWebView *webView;
@property (nonatomic, weak) IBOutlet UITableView *optionView;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *startButton;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *counterButton;
@property (nonatomic, strong) NSMutableArray *topics;
@property (nonatomic, strong) Arti2DMode *mode;

- (IBAction) backButtonTapped:(id)sender;
- (IBAction) startButtonTapped:(id)sender;

//- (void) modeSelected: (NSString *) mode;

- (void) setupTopics: (NSMutableArray *) topics;
- (void) setupMode: (Arti2DMode *) mode;
@end
