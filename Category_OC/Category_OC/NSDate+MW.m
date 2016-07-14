//
//  NSDate+MW.m
//  Category_OC
//
//  Created by wangwendong on 16/7/14.
//  Copyright © 2016年 maginawin. All rights reserved.
//

#import "NSDate+MW.h"

@implementation NSDate (MW)

#pragma mark - Integer

- (NSInteger)year {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [gregorian component:NSCalendarUnitYear fromDate:self];
}

- (NSInteger)month {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [gregorian component:NSCalendarUnitMonth fromDate:self];
}

- (NSInteger)day {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [gregorian component:NSCalendarUnitDay fromDate:self];
}

- (NSInteger)hour {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [gregorian component:NSCalendarUnitHour fromDate:self];
}

- (NSInteger)minute {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [gregorian component:NSCalendarUnitMinute fromDate:self];
}

- (NSInteger)second {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [gregorian component:NSCalendarUnitSecond fromDate:self];
}

- (NSInteger)weekday {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [gregorian component:NSCalendarUnitWeekday fromDate:self];
}

- (NSInteger)weekdayOrdinal {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [gregorian component:NSCalendarUnitWeekdayOrdinal fromDate:self];
}

#pragma mark - String

- (NSString *)hhmm {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [gregorian components:NSCalendarUnitHour | NSCalendarUnitMinute fromDate:self];
    NSInteger hour = comps.hour;
    NSInteger minute = comps.minute;
    return [NSString stringWithFormat:@"%02d:%02d", (int)hour, (int)minute];
}

- (NSString *)hhmmss {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [gregorian components:NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:self];
    NSInteger hour = comps.hour;
    NSInteger minute = comps.minute;
    NSInteger second = comps.second;
    return [NSString stringWithFormat:@"%02d:%02d:%02d", (int)hour, (int)minute, (int)second];
}

- (NSString *)yyyyMMddWithSeparator:(NSString *)separator {
    if (!separator) {
        separator = @"";
    }
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [gregorian components:NSCalendarUnitYear | NSCalendarUnitDay | NSCalendarUnitMonth fromDate:self];
    NSInteger year = comps.year;
    NSInteger month = comps.month;
    NSInteger day = comps.day;
    return [NSString stringWithFormat:@"%d%@%d%@%d", (int)year, separator, (int)month, separator, (int)day];
}

- (NSString *)yyyyMMddWithDateSeparator:(NSString *)dateSeparator {
    if (!dateSeparator) {
        dateSeparator = @"";
    }
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [gregorian components:NSCalendarUnitYear | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:self];
    NSInteger year = comps.year;
    NSInteger month = comps.month;
    NSInteger day = comps.day;
    NSInteger hour = comps.hour;
    NSInteger minute = comps.minute;
    NSInteger second = comps.second;
    
    return [NSString stringWithFormat:@"%d%@%d%@%d %02d:%02d:%02d", (int)year, dateSeparator, (int)month, dateSeparator, (int)day, (int)hour, (int)minute, (int)second];
}

@end
