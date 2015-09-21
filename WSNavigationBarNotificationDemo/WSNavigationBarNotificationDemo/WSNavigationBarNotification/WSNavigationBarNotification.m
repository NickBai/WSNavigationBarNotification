//
//  WSNavigationBarNotification.m
//
//
//  Created by WannaSleep on 15/9/19.
//  Copyright (c) 2015年 WannaSleep. All rights reserved.
//

#import "WSNavigationBarNotification.h"
#import "UIView+HitView.h"

@interface WSNavigationBarNotification ()

@property (nonatomic, strong) WSNavigationBarNotificationView *notifierView;

@end

@implementation WSNavigationBarNotification

+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    static WSNavigationBarNotification *notifier;
    dispatch_once(&onceToken, ^ {
        notifier = [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        notifier.windowLevel = UIWindowLevelStatusBar + 1.0;
        notifier.backgroundColor = [UIColor clearColor];
        notifier.userInteractionEnabled = YES;
        notifier.rootWindow = [[[UIApplication sharedApplication] delegate] window];
        
    });
    return notifier;
}

+ (void)showNotification:(NSString *)text dismiss:(NSTimeInterval)interval tapCallBack:(TapNotificaitonViewCallBack)callBack{
    [WSNavigationBarNotification showNotification:text AppName:nil AppIcon:nil dismiss:interval tapCallBack:callBack];
}

+ (void)showNotification:(NSString *)text AppName:(NSString *)name AppIcon:(UIImage *)icon dismiss:(NSTimeInterval)interval tapCallBack:(TapNotificaitonViewCallBack)callBack{
    WSNavigationBarNotification *notification = [WSNavigationBarNotification shareInstance];
    notification.notifierView = [[WSNavigationBarNotificationView alloc] initWithNibName:@"WSNavigationBarNotificationView" bundle:nil];
    WSNavigationBarNotificationView *notificationView = notification.notifierView;
    notificationView.notification = text;
    notificationView.appName = name;
    notificationView.appIconImg = icon;
    __block WSNavigationBarNotificationView *blockNotificationView  = notificationView;
    notificationView.tapCallBack = ^(){
        callBack(blockNotificationView);
    };
    notification.rootViewController = notificationView;
    [notification makeKeyAndVisible];
    [notification performSelector:@selector(dismiss) withObject:nil afterDelay:interval];
}

- (void)dismiss{
    [[NSRunLoop currentRunLoop] cancelPerformSelector:@selector(dismiss) target:self argument:nil];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(dismiss) object:nil];
    [UIView animateWithDuration:.5 animations:^{
        [[WSNavigationBarNotification shareInstance].notifierView dismissContainerView];
    } completion:^(BOOL finished) {
        self.hidden = YES;
        [self.rootWindow makeKeyAndVisible];
        [self removeFromSuperview];
    }];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    WSNavigationBarNotificationView *notificationView = (WSNavigationBarNotificationView*)[WSNavigationBarNotification shareInstance].rootViewController;
    if (point.y <= CGRectGetHeight([notificationView userInteractionArea])) {
       return [self overlapHitTest:point withEvent:event];
    }else {
       return [self.rootWindow hitTest:point withEvent:event];
    }
    return self;
}

@end
