//
//  AppDelegate.h
//  HealthyI
//
//  Created by 李鹏辉 on 15/8/15.
//  Copyright (c) 2015年 com.code. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) LoginViewController *loginViewController;

@property (strong, nonatomic) UINavigationController *navController;
@end

