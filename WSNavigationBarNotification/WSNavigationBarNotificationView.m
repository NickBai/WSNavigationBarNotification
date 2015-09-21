//
//  WSNavigationBarNotificationView.m
//
//
//  Created by Nick Bai on 15/9/19.
//  Copyright (c) 2015年 Nick Bai. All rights reserved.
//

#import "WSNavigationBarNotificationView.h"

@interface WSNavigationBarNotificationView ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UILabel *appNameLB;
@property (weak, nonatomic) IBOutlet UILabel *notificationTextLB;
@property (weak, nonatomic) IBOutlet UIImageView *appIconImageView;
@end

@implementation WSNavigationBarNotificationView


- (void)initUI{
    self.containerView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapFun)];
    [self.containerView addGestureRecognizer:tap];
    
    if (self.appIconImg) {
        [self.appIconImageView setImage:self.appIconImg];
    }else{
        NSString *iconName = [[NSBundle mainBundle] infoDictionary][@"CFBundleIcons"][@"CFBundlePrimaryIcon"][@"CFBundleIconFiles"][0];
        UIImage *appIcon = [UIImage imageNamed:iconName];
        [self.appIconImageView setImage:appIcon];
    }
    
    if (self.appName.length > 0) {
        self.appNameLB.text = self.appName;
    }else {
        NSString *dispalyName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
        NSString *bundleName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
        self.appNameLB.text = (dispalyName.length>0 || bundleName.length>0)?dispalyName.length>0?dispalyName:bundleName:@"";
    }
    
    self.notificationTextLB.numberOfLines = 0;
    self.notificationTextLB.text = self.notification;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tapFun{
    self.tapCallBack();
}

- (void)dismissContainerView{
   self.containerView.transform = CGAffineTransformMakeTranslation(0, -self.containerView.frame.size.height);
}

- (CGRect)userInteractionArea{
    return self.containerView.frame;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
