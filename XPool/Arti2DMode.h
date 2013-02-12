//
//  Arti2DMode.h
//  CollectionViewTest
//
//  Created by Bill on 15/1/13.
//  Copyright (c) 2013 Bill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Arti2DMode : NSObject
@property (nonatomic) NSString *title;
@property (nonatomic) NSInteger duration;
@property (nonatomic) NSInteger amount;
@property (nonatomic) NSString *description; // optional - display who have applied this test mode and so on...

- (id) initWithTitle: (NSString *)title duration: (NSInteger)duration amount: (NSInteger) amount;
@end
