
#import "ZhiBanLoginViewController.h"
#import "XiaDanWebAPI.h"
#import "ScreenHelper.h"
#import "NullValueHelper.h"
#import "AlertHelper.h"
#import "AppDelegate.h"
#import "User.h"
#import "CompanyModel.h"
#define  kTextH 50
#define kSetColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define kUSERNAME @"username"
#define kPASSWORD @"password"
@interface ZhiBanLoginViewController ()<UITextFieldDelegate,UIAlertViewDelegate>
{
    UITextField *_userName;
    UITextField *_password;
    BOOL isEdit;
    UIButton *savaPw;
    UIImageView *remImage;
    MBProgressHUD *hud;
    NSString *versionStr;
    NSString *versionShortStr;
    NSString *appUrl;
    BOOL isappstore;
}
@property (strong, nonatomic) NSArray * TextArr;

@end

@implementation ZhiBanLoginViewController

- (void)viewDidLoad
{
  
    [super viewDidLoad];
    CGRect  viewRect = CGRectMake(0, 0,[ScreenHelper SCREEN_WIDTH], [ScreenHelper SCREEN_HEIGHT]);
    self.view.bounds=viewRect;
    self.view.backgroundColor=[UIColor whiteColor];
    
  //  versionStr =[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
   versionShortStr =[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    
    [self createSubview];
    _userName.text=[[NSUserDefaults standardUserDefaults]objectForKey:kUSERNAME];
    _password.text=[[NSUserDefaults standardUserDefaults]objectForKey:kPASSWORD];
}

//-(void)viewDidAppear:(BOOL)animated{
//    [XiaDanWebAPI getVersionSuecss:^(NSDictionary *dic) {
//        [AlertHelper hideAllHUDsForView:self.view];
//        NSArray *array = dic[@"results"];
//        NSDictionary *dict = [array lastObject];
//        // NSLog(@"当前版本为：%@", dict[@"version"]);
//        NSString *str=dict[@"version"];
//        appUrl=dict[@"artistViewUrl"];
//        if (![str isEqualToString:versionShortStr])  {
//            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"有可用的更新！" message:[[NSString alloc] initWithFormat:@"检测到新版本 v%@",str] delegate:self cancelButtonTitle:@"不" otherButtonTitles:@"现在升级", nil];
//            [alert show];
//        }
//        else
//        {
//            [AlertHelper singleMBHUDShow:@"已是最新版本" ForView:self.view AndDelayHid:1];
//            
//        }
//        
//    } fail:^{
//        [AlertHelper hideAllHUDsForView:self.view];
//        [AlertHelper singleMBHUDShow:@"网络请求数据失败" ForView:self.view AndDelayHid:1];
//    }];
//
//    
//}
//-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
//    if (buttonIndex ==1) {
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appUrl]];
//    }
//}
//初始化登录界面
-(void)createSubview
{
    //视图背景
    UIImageView *b=[[UIImageView alloc]init];
    b.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    b.image=[UIImage imageNamed:@"denglubeijing-1242w2208h@3x.jpg"];
    [self.view addSubview:b];
    
    
    UIImageView *b1=[[UIImageView alloc]init];
    b1.frame=CGRectMake(50, 100, self.view.frame.size.width-100, 140);
    b1.image=[UIImage imageNamed:@"logo.png"];
    [self.view addSubview:b1];
    
//    CGRect labvtFrame1=CGRectMake(40, 140, [ScreenHelper SCREEN_WIDTH]-80, 49);
//    UILabel *labVT1=[[UILabel alloc ] initWithFrame:labvtFrame1];
//    labVT1.backgroundColor = [UIColor clearColor];
//    labVT1.textAlignment=NSTextAlignmentCenter;
//   labVT1.textColor=[UIColor colorWithRed:233/255.0 green:80/255.0 blue:94/255.0 alpha:1];
//    labVT1.font =  [UIFont fontWithName:@"Arial" size:60.0f];
//    labVT1.text=@"旭阳纸业";
//    [self.view addSubview:labVT1];
    

    CGRect labvtFrame=CGRectMake(40, 49, [ScreenHelper SCREEN_WIDTH]-80, 49);
    UILabel *labVT=[[UILabel alloc ] initWithFrame:labvtFrame];
    labVT.backgroundColor = [UIColor clearColor];
    labVT.textAlignment=NSTextAlignmentRight;
    labVT.textColor=[UIColor lightGrayColor];
    labVT.font =  [UIFont fontWithName:@"Arial" size:12.0f];
    labVT.text=[NSString stringWithFormat:@"v%@",versionShortStr];
    [self.view addSubview:labVT];
    
    CGFloat iconX=20;
    CGFloat iconWH=20;
    CGFloat y;
    if ( self.view.bounds.size.height==480)
    {
        y=70;
    }
    else
    {
        y=134;
    }
    CGFloat w=self.view.frame.size.width;
    
    //登陆框背景
    UIImageView *back=[[UIImageView alloc]init];
    back.frame=CGRectMake(18, y+129.5, w-36, 110);
    back.image=[UIImage imageNamed:@"denglukuan.png"];
    [self.view addSubview:back];
    //用户框
//    UIView *view1=[[UIView alloc]init];
//    view1.backgroundColor=[UIColor clearColor];;
//    view1.frame=CGRectMake(25, y+20, w-50, kTextH);
//    [self.view addSubview:view1];
//    
    //用户名前面的icon
//    UIImageView *userIcon=[[UIImageView alloc]init];
//    userIcon.backgroundColor=[UIColor whiteColor];
//    userIcon.frame=CGRectMake(5, 15, iconWH, iconWH);
//    userIcon.image=[UIImage imageNamed:@"user.png"];
//    [view1 addSubview:userIcon];
    
    _userName=[[UITextField alloc]init];
    _userName.autocapitalizationType=UITextAutocapitalizationTypeNone;
    _userName.placeholder=@"用户名";
    _userName.textColor=[UIColor colorWithRed:177/255.0 green:143/255.0 blue:129/255.0 alpha:1];
    _userName.frame=CGRectMake(25, y+129, w-50-iconWH, kTextH);
    _userName.delegate=self;
    [self.view addSubview:_userName];
    
    //用户名前面的icon
        UIImageView *userIcon=[[UIImageView alloc]init];
    
        userIcon.frame=CGRectMake(CGRectGetMaxX(_userName.frame), y+129+18, iconWH, iconWH);
        userIcon.image=[UIImage imageNamed:@"user.png"];
        [self.view addSubview:userIcon];

    UIView *vi1=[[UIView alloc]init];
    vi1.backgroundColor=[UIColor whiteColor];;
    vi1.frame=CGRectMake(25, CGRectGetMaxY(_userName.frame)+5, w-50, 1);
    [self.view addSubview:vi1];
    
    //密码框
//    UIView *view2=[[UIView alloc]init];
//    view2.backgroundColor=[UIColor whiteColor];;
//    view2.frame=CGRectMake(25, CGRectGetMaxY(view1.frame)+5, w-50+iconWH, 1);
//    [self.view addSubview:view2];
    
    
    _password=[[UITextField alloc]init];
    _password.autocapitalizationType=UITextAutocapitalizationTypeNone;
    _password.placeholder=@"密码";
    _password.secureTextEntry=YES;
    _password.frame=CGRectMake(25, CGRectGetMaxY(vi1.frame)+5, w-50-iconWH,  kTextH);
    _password.delegate=self;
    _password.textColor=[UIColor colorWithRed:177/255.0 green:143/255.0 blue:129/255.0 alpha:1];
    [self.view addSubview:_password];
    
    //    //密码前面的icon
        UIImageView *pwIcon=[[UIImageView alloc]init];
        pwIcon.frame=CGRectMake(CGRectGetMaxX(_password.frame),  CGRectGetMaxY(vi1.frame)+10, iconWH, iconWH);
        pwIcon.image=[UIImage imageNamed:@"lock.png"];
        [self.view addSubview:pwIcon];

    //记住密码button
    savaPw=[UIButton buttonWithType:UIButtonTypeCustom];
    savaPw.frame=CGRectMake(0, CGRectGetMaxY(back.frame)+31, self.view.frame.size.width/3, 25);
    savaPw.showsTouchWhenHighlighted = NO;
    savaPw.selected=[[NSUserDefaults standardUserDefaults]boolForKey:@"savepw"];
    [savaPw addTarget:self action:@selector(savePassword:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:savaPw];
    
    remImage=[[UIImageView alloc]initWithFrame:CGRectMake(iconX,5, iconWH, iconWH)];
    if (savaPw.selected)
    {
        remImage.image=[UIImage imageNamed:@"remBtn.png"];
    }
    else
    {
        remImage.image=[UIImage imageNamed:@"unRemBtn.png"];
    }
    [savaPw addSubview:remImage];
    
    
    UILabel *savetext=[[UILabel alloc]init];
    savetext.text=@"记住密码";
    savetext.textColor=[UIColor colorWithRed:126/255.0 green:121/255.0 blue:152/255.0 alpha:1];
    savetext.frame=CGRectMake(CGRectGetMaxX(remImage.frame)+15,3, w/3, 25);
    [savaPw addSubview:savetext];
    
//    UIButton * reitBtn=[UIButton buttonWithType:UIButtonTypeCustom];
//    reitBtn.frame=CGRectMake(self.view.frame.size.width-18-55-55, CGRectGetMaxY(back.frame)+34,55, 25);
//  //  [reitBtn setBackgroundColor:[UIColor redColor]];
//    [reitBtn.titleLabel setTextAlignment:NSTextAlignmentRight];
//    reitBtn.titleLabel.font=[UIFont systemFontOfSize:12];
//    [reitBtn setTitleColor:[UIColor colorWithRed:126/255.0 green:121/255.0 blue:152/255.0 alpha:1] forState:UIControlStateNormal];
//    [reitBtn setTitle:@"立即注册" forState:UIControlStateNormal];
//    [reitBtn addTarget:self action:@selector(regitPress) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:reitBtn];
//    
//
//    
//    
//    UIButton * forgetBtn=[UIButton buttonWithType:UIButtonTypeCustom];
//    forgetBtn.frame=CGRectMake(self.view.frame.size.width-18-55, CGRectGetMaxY(back.frame)+34,55, 25);
//    [forgetBtn.titleLabel setTextAlignment:NSTextAlignmentRight];
//  // [forgetBtn setBackgroundColor:[UIColor redColor]];
//     forgetBtn.titleLabel.font=[UIFont systemFontOfSize:12];
//    [forgetBtn setTitleColor:[UIColor colorWithRed:126/255.0 green:121/255.0 blue:152/255.0 alpha:1] forState:UIControlStateNormal];
//    [forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
//    [forgetBtn addTarget:self action:@selector(forgetPassword) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:forgetBtn];
//
//    UILabel *linetext=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(reitBtn.frame),CGRectGetMaxY(back.frame)+42,1, 10)];
//    linetext.backgroundColor=[UIColor colorWithRed:126/255.0 green:121/255.0 blue:152/255.0 alpha:1];
//    [self.view addSubview:linetext];
    
    //登陆按钮
    UIButton *login=[UIButton buttonWithType:UIButtonTypeCustom];
    login.frame=CGRectMake(25, CGRectGetMaxY(savaPw.frame)+38, self.view.frame.size.width-50, kTextH-8);
    [login addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [login setTitleColor :[UIColor whiteColor ] forState:UIControlStateNormal];
    [login setTitle:@"登录" forState:UIControlStateNormal];
    [login setBackgroundImage:[UIImage imageNamed:@"loginBtn11.png"] forState:UIControlStateNormal];
    [self.view addSubview:login];

    
    _TextArr=[NSArray arrayWithObjects:_userName,_password, nil];
}
-(void)regitPress
{


}
-(void)forgetPassword
{


}

//保存密码130
-(void)savePassword:(UIButton *)sender
{
    sender.selected=!sender.selected;
    remImage.image=(!sender.selected)?[UIImage imageNamed:@"unRemBtn.png"]:[UIImage imageNamed:@"remBtn.png"];
    [[NSUserDefaults standardUserDefaults]setBool:sender.selected forKey:@"savepw"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
-(void)endHUD{
    hud.hidden = YES;
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"请检查您的网络" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
    [alert show];
}
//登陆
-(void)login
{
    isEdit=NO;
    [self.view endEditing:YES];
    
    if ([NullValueHelper textViewAndtextFeildNotNullOrNull:_TextArr])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示！" message:@"请输入完整信息" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        [AlertHelper MBHUDShow:@"登录中..." ForView:self.view AndDelayHid:30];
        [XiaDanWebAPI loginWithUser:_userName.text Cmgt_Pwd:_password.text Suecss:^(NSArray *userInfo)
         {
            // NSLog(@"QQQQQ %@",userInfo);
             [AlertHelper hideAllHUDsForView:self.view];
      
             NSDictionary *userDic=nil;
             if (userInfo) {
                 userDic=(NSDictionary*)userInfo[0];
             }
             NSString *str=[NSString stringWithFormat:@"%@",userDic[@"bool"]];
             if ([str isEqualToString:@"0"])
             {
                 UIAlertView *   alert=[[UIAlertView alloc]initWithTitle:@"提示！" message:userDic[@"reason"]  delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                 [alert show];
             }
           else  if ([[userDic objectForKey:@"bool"]isEqualToString:@"1"])
             {
                User *user = [User standartUserInfo];
                user.Cmgt_Id=userDic[@"Cmgt_Id"];
                user.Cmgt_CmpNm=userDic[@"Cmgt_CmpNm"];
                 user.Cmgt_PMobile=userDic[@"Cmgt_PMobile"];
                 user.Cmgt_PNm=userDic[@"Cmgt_PNm"];
                 user.Cmgt_PTel=userDic[@"Cmgt_PTel"];
                user.Cmgt_CmpNmAbbreviation=userDic[@"Cmgt_CmpNmAbbreviation"];
                 user.Cmgt_CustomerCode=userDic[@"Cmgt_CustomerCode"];
                 user.IsSinglePlant=userDic[@"IsSinglePlant"];
                 if ([user.IsSinglePlant isEqualToString:@"1"]) {
                     CompanyModel *model=[[CompanyModel alloc]initWithDic:userDic[@"JoinComp"][0]];
                     user.model=model;
                     
                 }
                 [[NSUserDefaults standardUserDefaults] setObject:_userName.text forKey:kUSERNAME];
                 if (savaPw.selected)
                 {
                     [[NSUserDefaults standardUserDefaults ]setObject:_password.text forKey:kPASSWORD];
                     [[NSUserDefaults standardUserDefaults]synchronize];
                 }else
                 {
                     [[NSUserDefaults standardUserDefaults]removeObjectForKey:kPASSWORD];
                     [[NSUserDefaults standardUserDefaults]synchronize];
                 }
         
                 UIStoryboard *s = [UIStoryboard storyboardWithName:@"XiaDan" bundle:[NSBundle mainBundle]];
                 UIViewController *changyongController = [s instantiateViewControllerWithIdentifier:@"XiaDan"];
                 
               [self presentViewController:changyongController animated:YES completion:nil];

              
             }
             else
             {
                 
                 UIAlertView *   alert=[[UIAlertView alloc]initWithTitle:@"提示！" message:@"网络错误" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                 [alert show];
                 

                 
             }

         
         
         } fail:^(){
             [MBProgressHUD hideHUDForView:self.view animated:YES];
             UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"请检查您的网络" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
             [alert show];
         
         }];

    }
}
- (void)setTags:(NSMutableSet **)tags addTag:(NSString *)tag {
    //  if ([tag isEqualToString:@""]) {
    // }
    [*tags addObject:tag];
}
- (void)analyseInput:(NSString **)alias tags:(NSSet **)tags {
    // alias analyse
    if (![*alias length]) {
        // ignore alias
        *alias = nil;
    }
    // tags analyse
    if (![*tags count]) {
        *tags = nil;
    } else {
        __block int emptyStringCount = 0;
        [*tags enumerateObjectsUsingBlock:^(NSString *tag, BOOL *stop) {
            if ([tag isEqualToString:@""]) {
                emptyStringCount++;
            } else {
                emptyStringCount = 0;
                *stop = YES;
            }
        }];
        if (emptyStringCount == [*tags count]) {
            *tags = nil;
        }
    }
}
- (void)tagsAliasCallback:(int)iResCode
                     tags:(NSSet *)tags
                    alias:(NSString *)alias {
    NSString *callbackString =[NSString stringWithFormat:@"%d, \ntags: %@, \nalias: %@\n", iResCode,[self logSet:tags], alias];
    //    if ([_callBackTextView.text isEqualToString:@"服务器返回结果"]) {
    //        _callBackTextView.text = callbackString;
    //    } else {
    //        _callBackTextView.text = [NSString
    //                                  stringWithFormat:@"%@\n%@", callbackString, _callBackTextView.text];
    //    }
  //  NSLog(@"TagsAlias回调:%@", callbackString);
}
- (NSString *)logSet:(NSSet *)dic {
    if (![dic count]) {
        return nil;
    }
    NSString *tempStr1 =
    [[dic description] stringByReplacingOccurrencesOfString:@"\\u"
                                                 withString:@"\\U"];
    NSString *tempStr2 =
    [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 =
    [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString *str =
    [NSPropertyListSerialization propertyListFromData:tempData
                                     mutabilityOption:NSPropertyListImmutable
                                               format:NULL
                                     errorDescription:NULL];
    return str;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame=self.view.frame;
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    if (!isEdit)
    {
        frame.origin.y-= window.frame.size.height==568?130:158;
        [UIView animateWithDuration:0.5f animations:^{
            self.view.frame=frame;
        }];
    }
    isEdit=YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    CGRect frame=self.view.frame;
    if (!isEdit) {
        frame.origin.y=0;
        [UIView animateWithDuration:0.5f animations:^{
            self.view.frame=frame;
        }];
    }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    isEdit=NO;
    [self.view endEditing:YES];
}
@end
