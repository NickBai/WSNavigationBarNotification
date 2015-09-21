//
//  UIView+HitView.m
//  Created by Lion
//

#import <UIKit/UIKit.h>

@interface UIView (HitView)

- (UIView *)overlapHitTest:(CGPoint)point withEvent:(UIEvent *)event;

@end
