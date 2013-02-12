//
//  Arti2DPack.m
//  CollectionViewTest
//
//  Created by Bill on 14/1/13.
//  Copyright (c) 2013 Bill. All rights reserved.
//

#import "Arti2DPack.h"

@implementation Arti2DPack

- (id)init
{
    self = [super init];
    if (self) {
        //UIImage *image = [UIImage imageNamed:@"search_field.png"];
		UIImage *image = [[UIImage imageNamed:@"search_field.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(27, 27, 27, 27)];
		self.thumbnail = image;
		
		
		self.children = [@[] mutableCopy];
		
		/*
		dispatch_async(dispatch_get_main_queue(), ^{
			
		});
		*/
    }
    return self;
}

- (id) initWithId:(NSString *)pid {
	self = [self init];
	
	if(self) {
		self.packid = pid;
		self.name = pid;
	}
	
	return self;
}

@end
