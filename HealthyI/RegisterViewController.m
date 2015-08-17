//
//  RegisterViewController.m
//  HealthyI
//
//  Created by 李鹏辉 on 15/8/15.
//  Copyright (c) 2015年 com.code. All rights reserved.
//

#import "RegisterViewController.h"
#define kAlphaNum @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
@interface RegisterViewController ()
{
    @private
    UIImageView *navBarHairlineImageView;
    @private
    UITextField *nicknameText;
    @private
    UITextField *usernameText;
    @private
    UITextField *passwordText;
    @private
    UITextField *passWordText2;
    @private
    UIScrollView *scroll;
    @private
    UIImageView *userProfileView;
}
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    
    

    
    scroll = [[UIScrollView alloc]init];
    
    scroll.frame = self.view.bounds;
    
#pragma mark 屏幕尺寸
    CGRect rect = [[UIScreen mainScreen] bounds];
#pragma mark 头像
    UIImage *userProfile = [UIImage imageNamed:@"Avatar"];
    userProfileView = [[UIImageView alloc]initWithImage:userProfile];
    userProfileView.center = CGPointMake(rect.size.width * 0.5, 80);
    userProfileView.bounds = CGRectMake(0, 0, 100, 100);
    userProfileView.layer.cornerRadius = userProfileView.frame.size.height * 0.5;
    userProfileView.clipsToBounds = YES;
    [scroll addSubview:userProfileView];
#pragma mark 头像加号
    UIButton *userAddProfileButton = [[UIButton alloc]init];
    UIImage *userAddProfile = [UIImage imageNamed:@"add"];
    userAddProfileButton.bounds = CGRectMake(0, 0, userAddProfile.size.width, userAddProfile.size.height);
    userAddProfileButton.center = CGPointMake(userProfileView.frame.origin.x + userProfileView.frame.size.width - userAddProfileButton.frame.size.width * 0.5, userProfileView.frame.origin.y + userAddProfileButton.frame.size.height * 0.5);
    [userAddProfileButton setImage:userAddProfile forState:UIControlStateNormal];
    [userAddProfileButton addTarget:self action:@selector(addProfile) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:userAddProfileButton];
#pragma mark 昵称
    UILabel *nicknameLabel = [[UILabel alloc]initWithFrame:CGRectMake(rect.size.width * 0.1, userProfileView.frame.origin.y + userProfileView.frame.size.height + 20, rect.size.width * 0.8, 20)];
    nicknameLabel.text = @"昵称";
    nicknameLabel.textColor = [UIColor grayColor];
    nicknameLabel.adjustsFontSizeToFitWidth = YES;
    nicknameLabel.font = [UIFont systemFontOfSize:12];
    nicknameLabel.minimumScaleFactor = 6;
    [scroll addSubview:nicknameLabel];
    
    nicknameText = [[UITextField alloc] initWithFrame:CGRectMake(rect.size.width * 0.1, nicknameLabel.frame.origin.y + nicknameLabel.frame.size.height + 10, rect.size.width * 0.8, 20)];
    nicknameText.adjustsFontSizeToFitWidth = YES;
    nicknameText.font = [UIFont systemFontOfSize:12];
    nicknameText.contentScaleFactor = 6;
    nicknameText.placeholder = @"请输入昵称";
    nicknameText.keyboardAppearance = UIKeyboardAppearanceDark;
    nicknameText.keyboardType = UIKeyboardTypeASCIICapable;
    [nicknameText setReturnKeyType:UIReturnKeyNext];
    nicknameText.delegate = self;
    nicknameText.tag = 1;
    [scroll addSubview:nicknameText];
    
#pragma mark 昵称下面的线
    UIView *underNickNameLine = [[UIView alloc]initWithFrame:CGRectMake(rect.size.width * 0.1, nicknameText.frame.origin.y + nicknameText.frame.size.height + 10, rect.size.width * 0.8, 1)];
    underNickNameLine.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1];
    [scroll addSubview:underNickNameLine];
    
#pragma mark 用户名
    
    UILabel *usernameLabel = [[UILabel alloc]initWithFrame:CGRectMake(rect.size.width * 0.1, underNickNameLine.frame.origin.y + underNickNameLine.frame.size.height + 20, rect.size.width * 0.8, 20)];
    usernameLabel.text = @"用户名";
    usernameLabel.textColor = [UIColor grayColor];
    usernameLabel.adjustsFontSizeToFitWidth = YES;
    usernameLabel.font = [UIFont systemFontOfSize:12];
    usernameLabel.minimumScaleFactor = 6;
    [scroll addSubview:usernameLabel];
    
    usernameText = [[UITextField alloc] initWithFrame:CGRectMake(rect.size.width * 0.1, usernameLabel.frame.origin.y + usernameLabel.frame.size.height + 10, rect.size.width * 0.8, 20)];
    usernameText.adjustsFontSizeToFitWidth = YES;
    usernameText.font = [UIFont systemFontOfSize:12];
    usernameText.contentScaleFactor = 6;
    usernameText.placeholder = @"请输入用户名";
    usernameText.keyboardAppearance = UIKeyboardAppearanceDark;
    usernameText.keyboardType = UIKeyboardTypeASCIICapable;
    [usernameText setReturnKeyType:UIReturnKeyNext];
    usernameText.delegate = self;
    usernameText.tag = 2;
    [scroll addSubview:usernameText];
    
#pragma mark 用户名下面的线
    UIView *underUserNameLine = [[UIView alloc]initWithFrame:CGRectMake(rect.size.width * 0.1, usernameText.frame.origin.y + usernameText.frame.size.height + 10, rect.size.width * 0.8, 1)];
    underUserNameLine.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1];
    [scroll addSubview:underUserNameLine];
    
#pragma mark 密码
    UILabel *passwordLabel = [[UILabel alloc]initWithFrame:CGRectMake(rect.size.width * 0.1, underUserNameLine.frame.origin.y + underUserNameLine.frame.size.height + 20, rect.size.width * 0.8, 20)];
    passwordLabel.text = @"密码";
    passwordLabel.textColor = [UIColor grayColor];
    passwordLabel.adjustsFontSizeToFitWidth = YES;
    passwordLabel.font = [UIFont systemFontOfSize:12];
    passwordLabel.minimumScaleFactor = 6;
    [scroll addSubview:passwordLabel];
    
    passwordText = [[UITextField alloc] initWithFrame:CGRectMake(rect.size.width * 0.1, passwordLabel.frame.origin.y + passwordLabel.frame.size.height + 10, rect.size.width * 0.8, 20)];
    passwordText.adjustsFontSizeToFitWidth = YES;
    passwordText.font = [UIFont systemFontOfSize:12];
    passwordText.contentScaleFactor = 6;
    passwordText.placeholder = @"请输入密码";
    passwordText.keyboardAppearance = UIKeyboardAppearanceDark;
    passwordText.keyboardType = UIKeyboardTypeASCIICapable;
    [passwordText setReturnKeyType:UIReturnKeyNext];
    passwordText.delegate = self;
    passwordText.tag = 3;
    [scroll addSubview:passwordText];
    
    
#pragma mark 密码下面的线
    UIView *underPassWordLine = [[UIView alloc]initWithFrame:CGRectMake(rect.size.width * 0.1, passwordText.frame.origin.y + passwordText.frame.size.height + 10, rect.size.width * 0.8, 1)];
    underPassWordLine.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1];
    [scroll addSubview:underPassWordLine];
    
#pragma mark 确认密码
    UILabel *passwordLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(rect.size.width * 0.1, underPassWordLine.frame.origin.y + underPassWordLine.frame.size.height + 20, rect.size.width * 0.8, 20)];
    passwordLabel2.text = @"密码确认";
    passwordLabel2.textColor = [UIColor grayColor];
    passwordLabel2.adjustsFontSizeToFitWidth = YES;
    passwordLabel2.font = [UIFont systemFontOfSize:12];
    passwordLabel2.minimumScaleFactor = 6;
    [scroll addSubview:passwordLabel2];
    
    passWordText2 = [[UITextField alloc] initWithFrame:CGRectMake(rect.size.width * 0.1, passwordLabel2.frame.origin.y + passwordLabel2.frame.size.height + 10, rect.size.width * 0.8, 20)];
    passWordText2.adjustsFontSizeToFitWidth = YES;
    passWordText2.font = [UIFont systemFontOfSize:12];
    passWordText2.contentScaleFactor = 6;
    passWordText2.placeholder = @"再次输入密码";
    passWordText2.keyboardAppearance = UIKeyboardAppearanceDark;
    passWordText2.keyboardType = UIKeyboardTypeASCIICapable;
    [passWordText2 setReturnKeyType:UIReturnKeyJoin];

    passWordText2.delegate = self;
    passWordText2.tag = 4;
    [scroll addSubview:passWordText2];
    
#pragma mark 确认密码下面的线
    UIView *underPassWord2Line = [[UIView alloc]initWithFrame:CGRectMake(rect.size.width * 0.1, passWordText2.frame.origin.y + passWordText2.frame.size.height + 10, rect.size.width * 0.8, 1)];
    underPassWord2Line.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1];
    [scroll addSubview:underPassWord2Line];
    
#pragma mark 注册按钮
    UIButton *registButton = [[UIButton alloc]initWithFrame:CGRectMake(rect.size.width * 0.1, underPassWord2Line.frame.origin.y + underPassWord2Line.frame.size.height + 20, rect.size.width * 0.8, 40)];
    [registButton setTitle:@"完成" forState:UIControlStateNormal];
    registButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [registButton setBackgroundColor:[UIColor colorWithRed:70/255.0 green:204/255.0 blue:186/255.0 alpha:1]];
    [registButton addTarget:self action:@selector(regist) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:registButton];
    
    scroll.contentSize = CGSizeMake(rect.size.width, registButton.frame.origin.y + registButton.frame.size.height + 30);
    [self.view addSubview:scroll];
    
}

-(void)viewWillAppear:(BOOL)animated{

    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    self.navigationController.navigationBarHidden = false;
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:70/255.0 green:204/255.0 blue:186/255.0 alpha:0.1]];

//    self.navigationController.navigationBar.backgroundColor = [[UIColor orangeColor]colorWithAlphaComponent:1];
//    [self.navigationItem setTitle:@"注册"];
//    UILabel *label = [[UILabel alloc]init];
//    label.frame = CGRectMake(20, 0, 480, 44);
//    label.text = @"注册";
//    label.textColor = [UIColor whiteColor];
//    self.navigationItem.titleView = label;

    
    UIBarButtonItem *releaseButon=[[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(regist)];
     self.navigationItem.rightBarButtonItem=releaseButon;

    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

    
    navBarHairlineImageView.hidden = YES;
    
    self.navigationController.navigationBar.translucent = true;
    
    CATransition *animation = [CATransition animation];
    [animation setDuration:0.3];
    animation.type = kCATransitionPush;
    [animation setSubtype: kCATransitionFromRight];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    
    [self.navigationController.view.layer addAnimation:animation forKey:nil];

}

- (void)viewWillDisappear:(BOOL)animated {

    CATransition *animation = [CATransition animation];
    [animation setDuration:0.3];
    animation.type = kCATransitionPush;
    [animation setSubtype: kCATransitionFromLeft];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    
    [self.navigationController.view.layer addAnimation:animation forKey:nil];

    navBarHairlineImageView.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)regist {
    NSLog(@"我要完成注册了");
}

- (void)addProfile{
    UIActionSheet *sheet;
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        
    {
        sheet  = [[UIActionSheet alloc] initWithTitle:@"选择" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"拍照",@"从相册选择", nil];
        
    }
    
    else {
        
        sheet = [[UIActionSheet alloc] initWithTitle:@"选择" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"从相册选择", nil];
        
    }
    
    sheet.tag = 255;
    
    [sheet showInView:self.view];
    
}

-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag == 255) {
        
        NSUInteger sourceType = 0;
        
        // 判断是否支持相机
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            switch (buttonIndex) {
                case 0:
                    // 取消
                    return;
                case 1:
                    // 相机
                    sourceType = UIImagePickerControllerSourceTypeCamera;
                    break;
                    
                case 2:
                    // 相册
                    sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                    break;
            }
        }
        else {
            if (buttonIndex == 0) {
                
                return;
            } else {
                sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            }
        }
       
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        
        imagePickerController.delegate = self;
        
        imagePickerController.allowsEditing = YES;
        
        imagePickerController.sourceType = sourceType;
        
        [self presentViewController:imagePickerController animated:YES completion:^{}];
    }
}

#pragma mark - image picker delegte
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    /* 此处info 有六个值
     * UIImagePickerControllerMediaType; // an NSString UTTypeImage)
     * UIImagePickerControllerOriginalImage;  // a UIImage 原始图片
     * UIImagePickerControllerEditedImage;    // a UIImage 裁剪后图片
     * UIImagePickerControllerCropRect;       // an NSValue (CGRect)
     * UIImagePickerControllerMediaURL;       // an NSURL
     * UIImagePickerControllerReferenceURL    // an NSURL that references an asset in the AssetsLibrary framework
     * UIImagePickerControllerMediaMetadata    // an NSDictionary containing metadata from a captured photo
     */
    // 保存图片至本地，方法见下文
    [self saveImage:image withName:@"currentImage.png"];
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"currentImage.png"];
    
    UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
    
//    isFullScreen = NO;
    [userProfileView setImage:savedImage];
    
    userProfileView.tag = 100;
    
}

#pragma mark - 保存图片至沙盒
- (void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName
{
    
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.5);
    // 获取沙盒目录
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
    // 将图片写入文件
    
    [imageData writeToFile:fullPath atomically:NO];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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
            [usernameText becomeFirstResponder];
            break;
        case 2:
            [passwordText becomeFirstResponder];
            break;
        case 3:
            [passWordText2 becomeFirstResponder];
            break;
        case 4:
            [self regist];
            break;
        default:
            break;
    }
    
    return YES;
}

#pragma mark 开始输入
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    CGFloat offset = scroll.frame.size.height - (textField.frame.origin.y + textField.frame.size.height + 216 + 120);
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
    canChange = [string isEqualToString:filtered];
    return canChange;
}

-(BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item {
    NSLog(@"BACK");
    return NO;
}

@end
