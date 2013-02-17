//
//  QuestionList.h
//  DBController
//
//  Created by Sijin He on 20/01/2013.
//  Copyright (c) 2013 Sijin He. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionList : NSObject{
    NSInteger indexId;
    NSString *setId;
    UIImage *content;
    NSString *question;
    NSString *number;
    NSString *option1;
    NSString *option2;
    NSString *option3;
    NSString *option4;
    NSString *option5;
    NSString *option6;
    NSString *option7;
    NSString *option8;
    NSString *option9;
    NSString *option10;
    NSString *answer;
    NSString *type;
    NSString *resource;
}

@property (nonatomic, assign) NSInteger indexId;
@property (nonatomic,retain) NSString *setId;
@property (nonatomic, retain) UIImage *content;
@property (nonatomic, retain) NSString *question;
@property (nonatomic, retain) NSString *number;
@property (nonatomic, retain) NSString *option1;
@property (nonatomic, retain) NSString *option2;
@property (nonatomic, retain) NSString *option3;
@property (nonatomic, retain) NSString *option4;
@property (nonatomic, retain) NSString *option5;
@property (nonatomic, retain) NSString *option6;
@property (nonatomic, retain) NSString *option7;
@property (nonatomic, retain) NSString *option8;
@property (nonatomic, retain) NSString *option9;
@property (nonatomic, retain) NSString *option10;
@property (nonatomic, retain) NSString *answer;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSString *resource;

@end
