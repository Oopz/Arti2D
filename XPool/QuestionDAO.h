//
//  QuestionDAO.h
//  DBController
//
//  Created by Sijin He on 20/01/2013.
//  Copyright (c) 2013 Sijin He. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface QuestionDAO : NSObject{
    sqlite3 *db;
}

- (NSMutableArray *) getQuestionsList;

@end
