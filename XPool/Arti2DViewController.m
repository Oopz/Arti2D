//
//  Arti2DViewController.m
//  CollectionViewTest
//
//  Created by Bill on 13/1/13.
//  Copyright (c) 2013 Bill. All rights reserved.
//

#import "Arti2DViewController.h"
#import "Arti2DButtonCell.h"
#import "Arti2DHeaderView.h"
#import "Arti2DPackViewController.h"
#import "Arti2DPack.h"

@interface Arti2DViewController () <UITextFieldDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) IBOutlet UIToolbar *toolbar;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *shareButton;
@property (nonatomic, weak) IBOutlet UITextField *textField;
@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *packs;

- (IBAction) shareButtonTapped:(id)sender;

@end

@implementation Arti2DViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_cork.png"]];
	
	/*
	UIImage *navBarImage = [[UIImage imageNamed:@"navbar.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(27, 27, 27, 27)];
	[self.toolbar setBackgroundImage:navBarImage forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
	 */
	
	UIImage *shareButtonImage = [[UIImage imageNamed:@"button.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(8, 8, 8, 8)];
	[self.shareButton setBackgroundImage:shareButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
	
	UIImage *textFieldImage = [[UIImage imageNamed:@"search_field.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
	[self.textField setBackground:textFieldImage];
	
	
	
	self.packs = [@[] mutableCopy];
	
	for(NSInteger i=0; i<5; i++) {
		Arti2DPack *pack = [[Arti2DPack alloc] initWithId:[NSString stringWithFormat:@"main pack %d", i]];
		[self.packs addObject:pack];
	}
	
	//[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"FlickrCell"];
	
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) shareButtonTapped:(id)sender {
	
}


#pragma mark - UICollectionView Datasource
// 1
- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//	NSString *searchTerm = self.searches[section];
//	return [self.searchResults[searchTerm] count];
	
	return [self.packs count];
}
// 2
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//	return [self.searches count];
	
	return 1;
}
// 3
- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	Arti2DButtonCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ButtonCell" forIndexPath:indexPath];
	//cell.backgroundColor = [UIColor whiteColor];
	
	Arti2DPack *pack = self.packs[indexPath.row];
	cell.pack=pack;
	
	return cell;
}
// 4
- (UICollectionReusableView *) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
	
	Arti2DHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
	
//	NSString *tmp = [NSString stringWithFormat:@"Header %d", [indexPath row]];
//	[headerView setHeaderText:tmp];
	[headerView setHeaderText:@"Type"];
	
	//return [[UICollectionReusableView alloc] init];
	return headerView;
}


#pragma mark - UICollectionViewDelegate
- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
	// TODO: Select Item
	
	[self performSegueWithIdentifier:@"ShowAvailPacks" sender:self.packs[indexPath.row]];
	[self.collectionView deselectItemAtIndexPath:indexPath animated:YES];
}

- (void) collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
	// TODO: Deselect Item
	
}


#pragma mark - UICollectionViewDelegateFlowLayout
// 1
- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	//NSString *searchTearm = self.searches[indexPath.section];
	//void *photo = self.searchResults[searchTearm][indexPath.row];
	
	// 2
	CGSize retval=CGSizeMake(108, 108);
	retval.height += 16;
	retval.width += 8;
	return retval;
}

// 3
- (UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
	return UIEdgeInsetsMake(20, 20, 20, 20);
}



#pragma mark - UITextFieldDelegate methods
- (BOOL) textFieldShouldReturn:(UITextField *)textField {
	// 1
	[self.collectionView reloadData];
	
	return YES;
}



#pragma mark - Segue
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	
	if([segue.identifier isEqualToString:@"ShowAvailPacks"]) {
		Arti2DPackViewController *packViewController = segue.destinationViewController;
		packViewController.parentPack = sender; // sender
		
		NSLog(@"go into main pack %@", sender);
	}
}



#pragma mark - Supported Interface Orientations
- (NSUInteger) supportedInterfaceOrientations {
	return UIInterfaceOrientationMaskPortrait;
}

@end






















