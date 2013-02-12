//
//  Arti2DPack.h
//  CollectionViewTest
//
//  Created by Bill on 14/1/13.
//  Copyright (c) 2013 Bill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Arti2DPack : NSObject
@property (nonatomic, strong) UIImage *thumbnail;
@property (nonatomic, strong) NSString *packid;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSMutableArray *children;


- (id) initWithId: (NSString *) pid;

@end
