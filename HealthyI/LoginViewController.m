//
//  LoginViewController.m
//  HealthyI
//
//  Created by 李鹏辉 on 15/8/15.
//  Copyright (c) 2015年 com.code. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "AFNetworkReachabilityManager.h"
#define kAlphaNum @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
@interface LoginViewController ()
{
    @private
    UITextField *passwordText;
    @private
    UITextField *usernameText;
}
@end

@implementation LoginViewController

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    // 检测网络连接的单例,网络变化时的回调方法
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"%ld", (long)status);
    }];

    
#pragma mark 屏幕尺寸
    CGRect rect = [[UIScreen mainScreen] bounds];
    
#pragma mark logo图
    UIImage *appIcon = [UIImage imageNamed:@"Logo"];
    UIImageView *appIconView = [[UIImageView alloc]initWithImage:appIcon];
    appIconView.center = CGPointMake(rect.size.width * 0.5, appIconView.frame.size.height);
    [self.view addSubview:appIconView];
    
    
#pragma mark 注册
    UIButton *registButton = [[UIButton alloc]initWithFrame:CGRectMake(rect.size.width * 0.1, rect.size.height - 40, rect.size.width * 0.8, 20)];
    [registButton setTitle:@"注册" forState:UIControlStateNormal];

    registButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [registButton setTitleColor:[UIColor colorWithRed:70/255.0 green:204/255.0 blue:186/255.0 alpha:1] forState:UIControlStateNormal];
    [self.view addSubview:registButton];
    [registButton addTarget:self action:@selector(register) forControlEvents:UIControlEventTouchUpInside];


#pragma mark 登陆按钮
    UIButton *loginButton = [[UIButton alloc]initWithFrame:CGRectMake(rect.size.width * 0.1, registButton.frame.origin.y - registButton.frame.size.height - 40, rect.size.width * 0.8, 40)];
    [loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    loginButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [loginButton setBackgroundColor:[UIColor colorWithRed:70/255.0 green:204/255.0 blue:186/255.0 alpha:1]];
    [loginButton setBackgroundColor:[UIColor colorWithRed:70/255.0 green:210/255.1 blue:186/255.0 alpha:1]];
    [self.view addSubview:loginButton];
    
    
    
#pragma mark 密码下面的线
    UIView *underPasswordLine = [[UIView alloc]initWithFrame:CGRectMake(rect.size.width * 0.1, loginButton.frame.origin.y - 20 - 1, rect.size.width * 0.8, 1)];
    underPasswordLine.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1];
    [self.view addSubview:underPasswordLine];
    
#pragma mark 密码
    passwordText = [[UITextField alloc] initWithFrame:CGRectMake(rect.size.width * 0.1, underPasswordLine.frame.origin.y - 10 - 20, rect.size.width * 0.8, 20)];
    passwordText.adjustsFontSizeToFitWidth = YES;
    passwordText.font = [UIFont systemFontOfSize:12];
    passwordText.contentScaleFactor = 6;
    passwordText.placeholder = @"请输入密码";
    passwordText.keyboardAppearance = UIKeyboardAppearanceDark;
    [passwordText setReturnKeyType:UIReturnKeyJoin];
    passwordText.delegate = self;
    passwordText.tag = 2;
    [passwordText setSecureTextEntry:YES];
    [self.view addSubview:passwordText];
    

    UILabel *passwordLabel = [[UILabel alloc]initWithFrame:CGRectMake(rect.size.width * 0.1,  passwordText.frame.origin.y -  10 - 20, rect.size.width * 0.8, 20)];
    passwordLabel.text = @"密码";
    passwordLabel.textColor = [UIColor grayColor];
    passwordLabel.adjustsFontSizeToFitWidth = YES;
    passwordLabel.font = [UIFont systemFontOfSize:12];
    passwordLabel.minimumScaleFactor = 6;
    [self.view addSubview:passwordLabel];
    
#pragma mark 用户名下面的分割线
    UIView *underUsernameLine = [[UIView alloc]initWithFrame:CGRectMake(rect.size.width * 0.1, passwordLabel.frame.origin.y - passwordLabel.frame.size.height - 10 - 1, rect.size.width * 0.8, 1)];
    underUsernameLine.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1];
    [self.view addSubview:underUsernameLine];
    
    
#pragma mark 用户名
    usernameText = [[UITextField alloc] initWithFrame:CGRectMake(rect.size.width * 0.1, underUsernameLine.frame.origin.y - 20 - 10, rect.size.width * 0.8, 20)];
    usernameText.adjustsFontSizeToFitWidth = YES;
    usernameText.font = [UIFont systemFontOfSize:12];
    usernameText.contentScaleFactor = 6;
    usernameText.placeholder = @"请输入用户名";
    usernameText.keyboardAppearance = UIKeyboardAppearanceDark;
    usernameText.keyboardType = UIKeyboardTypeASCIICapable;
    [usernameText setReturnKeyType:UIReturnKeyNext];
    usernameText.delegate = self;
    usernameText.tag = 1;
    [self.view addSubview:usernameText];
    
    UILabel *usernameLabel = [[UILabel alloc]initWithFrame:CGRectMake(rect.size.width * 0.1, usernameText.frame.origin.y - 20 - 10, rect.size.width * 0.8, 20)];
    usernameLabel.text = @"用户名";
    usernameLabel.textColor = [UIColor grayColor];
    usernameLabel.adjustsFontSizeToFitWidth = YES;
    usernameLabel.font = [UIFont systemFontOfSize:12];
    usernameLabel.minimumScaleFactor = 6;
    [self.view addSubview:usernameLabel];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark UITextField 协议方法

#pragma mark 触摸视图
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma mark 键盘return
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];

    switch (textField.tag) {
        case 1:
            NSLog(@"我要输入密码了");
            [passwordText becomeFirstResponder];
            break;
        case 2:
            NSLog(@"我要登陆了");
            break;
        default:
            break;
    }
    
    return YES;
}

#pragma mark 开始输入
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    CGFloat offset = self.view.frame.size.height - (textField.frame.origin.y + textField.frame.size.height + 216 + 50);
    if (offset <= 0) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = self.view.frame;
            frame.origin.y = offset;
            self.view.frame = frame;
        }];
    }
    return YES;
}

#pragma mark 结束输入
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = self.view.frame;
        frame.origin.y = 0.0;
        self.view.frame = frame;
        }];
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSCharacterSet *cs;
    cs = [[NSCharacterSet characterSetWithCharactersInString:kAlphaNum] invertedSet];
    
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""]; //按cs分离出数组,数组按@""分离出字符串
    BOOL canChange = NO;
    switch (textField.tag) {
        case 1:
            canChange = [string isEqualToString:filtered];
            NSLog(@"用户名输入的值为%@-验证结果%d", string, canChange);
            break;
        case 2:
            canChange = [string isEqualToString:filtered];
            NSLog(@"密码输入的值为%@-验证结果%d", string, canChange);
        default:
            break;
    }
    return canChange;
}


/*
#pragma mark - Navigationg

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)register{
    NSLog(@"我要注册");
    RegisterViewController *registerViewController = [[RegisterViewController alloc]init];
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
    backItem.title=@"登陆";
    backItem.tintColor=[UIColor whiteColor];
    self.navigationItem.backBarButtonItem = backItem;
    
//    CATransition* transition = [CATransition animation];
//    transition.type = kCATransitionPush;//可更改为其他方式
//    transition.subtype = kCATransitionFromRight;//可更改为其他方式
//    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];


    [self.navigationController pushViewController:registerViewController animated:NO];
    

}

//#pragma CATransition动画实现
//- (void) transitionWithType:(NSString *) type WithSubtype:(NSString *) subtype ForView : (UIView *) view
//{
//    //创建CATransition对象
//    CATransition *animation = [CATransition animation];
//
//    //设置运动时间
//    animation.duration = 2;
//    //设置运动type
//    animation.type = type;
//    if (subtype != nil) {
//        //设置子类
//        animation.subtype = subtype;
//    }
//
//    //设置运动速度
//    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
//    [view.layer addAnimation:animation forKey:@"animation"];
//}

@end
