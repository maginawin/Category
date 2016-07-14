//
//  NSDate+MW.h
//  Category_OC
//
//  Created by wangwendong on 16/7/14.
//  Copyright © 2016年 maginawin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (MW)

#pragma mark - Integer

- (NSInteger)year;

- (NSInteger)month;

- (NSInteger)day;

- (NSInteger)hour;

- (NSInteger)minute;

- (NSInteger)second;

/// Day in week
- (NSInteger)weekday;

/// Week in month = ceil(day/7)
- (NSInteger)weekdayOrdinal;

#pragma mark - String

- (NSString *)hhmm;

- (NSString *)hhmmss;

- (NSString *)yyyyMMddWithSeparator:(NSString *)separator;

- (NSString *)yyyyMMddWithDateSeparator:(NSString *)dateSeparator;

@end
