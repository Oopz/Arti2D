//
//  Arti2DHeaderView.m
//  CollectionViewTest
//
//  Created by Bill on 14/1/13.
//  Copyright (c) 2013 Bill. All rights reserved.
//

#import "Arti2DHeaderView.h"

@interface Arti2DHeaderView()
@property (weak) IBOutlet UIImageView *backgroundImageView;
@property (weak) IBOutlet UILabel *textLabel;
@end

@implementation Arti2DHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
	
	self.backgroundColor = [UIColor whiteColor];
	
    return self;
}

- (void) setHeaderText:(NSString *)text {
	UIImage *image=[[UIImage imageNamed:@"header_bg.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(68, 68, 68, 68) resizingMode:UIImageResizingModeStretch];
	
//	static int a = 0;
//	a++;
//	self.textLabel.text = [NSString stringWithFormat:@"%@ %d", text, a];
	
	self.textLabel.text = text;
	self.backgroundImageView.image = image;
	self.backgroundImageView.center = self.center;
	
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
