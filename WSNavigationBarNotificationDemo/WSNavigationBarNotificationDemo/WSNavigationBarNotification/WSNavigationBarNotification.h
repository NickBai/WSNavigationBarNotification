//
//  WSNavigationBarNotification.h
//
//
//  Created by WannaSleep on 15/9/19.
//  Copyright (c) 2015年 WannaSleep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WSNavigationBarNotificationView.h"

typedef void(^TapNotificaitonViewCallBack)(WSNavigationBarNotificationView *notifierView);

@interface WSNavigationBarNotification : UIWindow

@property (nonatomic, strong) UIWindow  *rootWindow;

+ (void)showNotification:(NSString *)text dismiss:(NSTimeInterval)interval tapCallBack:(TapNotificaitonViewCallBack)callBack;

+ (void)showNotification:(NSString *)text AppName:(NSString *)name AppIcon:(UIImage *)icon dismiss:(NSTimeInterval)interval tapCallBack:(TapNotificaitonViewCallBack)callBack;

@end
