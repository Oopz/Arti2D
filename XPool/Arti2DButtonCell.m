//
//  Arti2DButtonCell.m
//  CollectionViewTest
//
//  Created by Bill on 14/1/13.
//  Copyright (c) 2013 Bill. All rights reserved.
//

#import "Arti2DButtonCell.h"
#import "Arti2DPack.h"



@implementation Arti2DButtonCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
		//[self setPhoto:@"search_text.png"];
		UIView *bgView = [[UIView alloc] initWithFrame:self.backgroundView.frame];
		bgView.backgroundColor = [UIColor orangeColor];
		//bgView.layer.borderColor = [[UIColor whiteColor] CGColor];
		//bgView.layer.borderWidth = 4;
		self.selectedBackgroundView=bgView;
		
		
    }
    return self;
}

- (void) setPack:(Arti2DPack *)pack {
	if(_pack != pack) {
		_pack = pack;
	}
	
	self.imageView.image = _pack.thumbnail;
	self.label.text = _pack.name;
	
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
