//
//  NSDate+Calculation.m
//  FSCalendarExample
//
//  Created by sunxuzhu on 2020/7/28.
//  Copyright © 2020 wenchaoios. All rights reserved.
//

#import "NSDate+Calculation.h"
@implementation NSDate (Calculation)

- (NSDate *)calculate:(NSCalendarUnit)unit value:(NSInteger)value{
    NSCalendar* c = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    return [c dateByAddingUnit:unit value:value toDate:self options:NSCalendarMatchStrictly];
}

- (NSDate *)lunar_calculate:(NSCalendarUnit)unit value:(NSInteger)value{
    NSCalendar* c = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierChinese];
    return [c dateByAddingUnit:unit value:value toDate:self options:NSCalendarMatchStrictly];
}

- (NSInteger)calculateFromDate:(NSDate *)date unit:(NSCalendarUnit)unit{
    NSCalendar* c = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents* dc = [c components:unit fromDate:date toDate:self options:NSCalendarWrapComponents];
    return [dc valueForComponent:unit];
}
@end
