//
//  WSNavigationBarNotificationView.h
//
//
//  Created by Nick Bai on 15/9/19.
//  Copyright (c) 2015年 Nick Bai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TapCallBackFunc)();

@interface WSNavigationBarNotificationView : UIViewController

@property (nonatomic, assign, readonly) CGRect   userInteractionArea;
@property (nonatomic, copy) NSString  *appName;
@property (nonatomic, copy) NSString  *notification;
@property (nonatomic, strong) UIImage *appIconImg;
@property (nonatomic, copy) TapCallBackFunc   tapCallBack;

- (void)dismissContainerView;

@end
