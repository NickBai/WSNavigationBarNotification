//
//  UIView+HitView.m
//  Created by Lion
//

#import "UIView+HitView.h"

@implementation UIView (HitView)

- (UIView *)overlapHitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (!self.userInteractionEnabled || [self isHidden] || self.alpha == 0)
        return nil;
    UIView *hitView = self;
    if (![self pointInside:point withEvent:event]) {
        if (self.clipsToBounds) return nil;
        else hitView = nil;
    }
    for (UIView *subview in [self.subviews reverseObjectEnumerator]) {
        CGPoint insideSubview = [self convertPoint:point toView:subview];
        UIView *sview = [subview overlapHitTest:insideSubview withEvent:event];
        if (sview) return sview;
    }
    return hitView;
}

@end
