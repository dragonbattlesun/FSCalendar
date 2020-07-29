//
//  NSDate+Calculation.h
//  FSCalendarExample
//
//  Created by sunxuzhu on 2020/7/28.
//  Copyright © 2020 wenchaoios. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Calculation)
/**
 公历计算固定日期差的日期

 @param unit 计算单位
 @param value 差值
 @return 公历日期
 */
- (NSDate*)calculate:(NSCalendarUnit)unit value:(NSInteger)value;

/**
 农历计算固定日期差的日期
 
 @param unit 计算单位
 @param value 差值
 @return 公历日期
 */
- (NSDate*)lunar_calculate:(NSCalendarUnit)unit value:(NSInteger)value;

- (NSInteger)calculateFromDate:(NSDate*)date unit:(NSCalendarUnit)unit;


@end

NS_ASSUME_NONNULL_END
