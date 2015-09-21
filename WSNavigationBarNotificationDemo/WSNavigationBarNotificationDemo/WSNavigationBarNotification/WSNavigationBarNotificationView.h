//
//  WSNavigationBarNotificationView.h
//
//
//  Created by WannaSleep on 15/9/19.
//  Copyright (c) 2015年 WannaSleep. All rights reserved.
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
