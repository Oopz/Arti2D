//
//  QuestionDAO.m
//  DBController
//
//  Created by Sijin He on 20/01/2013.
//  Copyright (c) 2013 Sijin He. All rights reserved.
//

#import "QuestionDAO.h"
#import "QuestionList.h"

@implementation QuestionDAO
- (NSMutableArray *) getQuestionsList{
    NSMutableArray *wineArray = [[NSMutableArray alloc] init];
    @try {
        NSFileManager *fileMgr = [NSFileManager defaultManager];
        NSString *dbPath = [[[NSBundle mainBundle] resourcePath ]stringByAppendingPathComponent:@"db.sqlite"];
        BOOL success = [fileMgr fileExistsAtPath:dbPath];
        if(!success)
        {
            NSLog(@"Cannot locate database file '%@'.", dbPath);
        }
        if(!(sqlite3_open([dbPath UTF8String], &db) == SQLITE_OK))
        {
            NSLog(@"An error has occured.");
        }
        const char *sql = "SELECT id, setid, content, question, number, option1, option2, option3, option4, option5, option6, option7, option8, option9, option10, answer, type, resource FROM questionbank";
        sqlite3_stmt *sqlStatement;
        if(sqlite3_prepare(db, sql, -1, &sqlStatement, NULL) != SQLITE_OK)
        {
            NSLog(@"Problem with prepare statement");
        }
        
        //
        while (sqlite3_step(sqlStatement)==SQLITE_ROW) {
            QuestionList *MyWine = [[QuestionList alloc]init];
            MyWine.indexId = sqlite3_column_int(sqlStatement, 0);
            MyWine.setId = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement,1)];
            const char *raw = sqlite3_column_blob(sqlStatement, 2);
            int rawLen = sqlite3_column_bytes(sqlStatement, 2);
            NSData *data = [NSData dataWithBytes:raw length:rawLen];
            MyWine.content = [[UIImage alloc] initWithData:data];
            MyWine.question = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 3)];
            MyWine.number = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 4)];
            MyWine.option1 = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 5)];
            MyWine.option2 = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 6)];
            MyWine.option3 = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 7)];
            MyWine.option4 = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 8)];
            MyWine.option5 = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 9)];
            MyWine.option6 = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 10)];
            MyWine.option7 = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 11)];
            MyWine.option8 = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 12)];
            MyWine.option9 = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 13)];
            MyWine.option10 = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 14)];
            MyWine.answer = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 15)];
            MyWine.type = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 16)];
            MyWine.resource = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 17)];
            [wineArray addObject:MyWine];
        }
    }
    @catch (NSException *exception) {
        NSLog(@"An exception occured: %@", [exception reason]);
    }
    @finally {
        return wineArray;
    }
    
    
}
@end
