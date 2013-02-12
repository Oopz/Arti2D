//
//  Arti2DButtonCell.h
//  CollectionViewTest
//
//  Created by Bill on 14/1/13.
//  Copyright (c) 2013 Bill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class Arti2DPack;

@interface Arti2DButtonCell : UICollectionViewCell
@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) IBOutlet UILabel *label;
@property (nonatomic, strong) Arti2DPack *pack;
@end
