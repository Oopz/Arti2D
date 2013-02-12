//
//  Arti2DMode.m
//  CollectionViewTest
//
//  Created by Bill on 15/1/13.
//  Copyright (c) 2013 Bill. All rights reserved.
//

#import "Arti2DMode.h"

@implementation Arti2DMode

- (id) initWithTitle:(NSString *)title duration:(NSInteger)duration amount:(NSInteger)amount {
	
	self = [super init];
	if(self) {
		self.title = title;
		self.duration = duration;
		self.amount = amount;
	}
	return self;
}


@end
