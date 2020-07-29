//
//  DIYCalendarCell.m
//  FSCalendar
//
//  Created by dingwenchao on 02/11/2016.
//  Copyright © 2016 Wenchao Ding. All rights reserved.
//

#import "DIYCalendarCell.h"
#import "FSCalendarExtensions.h"
#import "FSCalendarAppearance.h"
#import "NSDate+Lunar.h"

@implementation DIYCalendarCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *circleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"circle"]];
        [self.contentView insertSubview:circleImageView atIndex:0];
        self.circleImageView = circleImageView;
        
        CAShapeLayer *selectionLayer = [[CAShapeLayer alloc] init];
        selectionLayer.fillColor = [UIColor blackColor].CGColor;
        selectionLayer.actions = @{@"hidden":[NSNull null]}; 
        [self.contentView.layer insertSublayer:selectionLayer below:self.titleLabel.layer];
        self.selectionLayer = selectionLayer;
        
        self.shapeLayer.hidden = YES;
        self.backgroundView = [[UIView alloc] initWithFrame:self.bounds];
        self.backgroundView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.1];
        
        UILabel *chineseText = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 12, CGRectGetWidth(self.frame), 12)];
        self.chineseLabel = chineseText;
        self.chineseLabel.font = [UIFont systemFontOfSize:12.0f];
        self.chineseLabel.textColor = [self preferredTitleSelectionColor];
        self.chineseLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.chineseLabel];
        
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.backgroundView.frame = CGRectInset(self.bounds, 1, 1);
    self.circleImageView.frame = self.backgroundView.frame;
    self.selectionLayer.frame = self.bounds;
    self.chineseLabel.text = [self.date lunar_day_chinese];
    if (self.selectionType == SelectionTypeMiddle) {
        
        self.selectionLayer.path = [UIBezierPath bezierPathWithRect:self.selectionLayer.bounds].CGPath;
        
    } else if (self.selectionType == SelectionTypeLeftBorder) {
        
        self.selectionLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.selectionLayer.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerBottomLeft cornerRadii:CGSizeMake(self.selectionLayer.fs_width/2, self.selectionLayer.fs_width/2)].CGPath;
        
    } else if (self.selectionType == SelectionTypeRightBorder) {
        
        self.selectionLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.selectionLayer.bounds byRoundingCorners:UIRectCornerTopRight|UIRectCornerBottomRight cornerRadii:CGSizeMake(self.selectionLayer.fs_width/2, self.selectionLayer.fs_width/2)].CGPath;
        
    } else if (self.selectionType == SelectionTypeSingle) {
        
        CGFloat diameter = MIN(self.selectionLayer.fs_height, self.selectionLayer.fs_width);
        self.selectionLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.contentView.fs_width/2-diameter/2, self.contentView.fs_height/2-diameter/2, diameter, diameter)].CGPath;
        
    }
}

- (void)configureAppearance
{
    [super configureAppearance];
    // Override the build-in appearance configuration
    if (self.isPlaceholder) {
        self.titleLabel.textColor = [UIColor lightGrayColor];
    }
    self.eventIndicator.hidden = YES;
    self.chineseLabel.textColor = self.colorForCellFill;
}

- (void)setSelectionType:(SelectionType)selectionType
{
    if (_selectionType != selectionType) {
        _selectionType = selectionType;
        [self setNeedsLayout];
    }
}

- (UIColor *)colorForCellFill{
    if (self.selected) {
        return [UIColor whiteColor];
    }
    return [UIColor blackColor];
}

@end
