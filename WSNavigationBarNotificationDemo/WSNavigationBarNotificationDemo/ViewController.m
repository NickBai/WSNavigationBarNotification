//
//  ViewController.m
//  WSNavigationBarNotificationDemo
//
//  Created by on 15/9/21.
//  Copyright (c) 2015年 WannaSleep. All rights reserved.
//

#import "ViewController.h"
#import "WSNavigationBarNotification.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)notificationBtnClick:(id)sender {
    [WSNavigationBarNotification showNotification:@"hello" dismiss:1.5 tapCallBack:^(WSNavigationBarNotificationView *notifierView) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:notifierView.notification delegate:nil cancelButtonTitle:@"Cancle" otherButtonTitles:nil, nil];
        [alert show];
    }];
    
}
@end
