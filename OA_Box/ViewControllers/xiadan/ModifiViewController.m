//
//  ModifiViewController.m
//  OA_Box
//
//  Created by imac-1 on 2016/10/25.
//  Copyright © 2016年 魏艳丽. All rights reserved.
//

#import "ModifiViewController.h"
#import "XiaDanWebAPI.h"
#import "User.h"
#import "AlertHelper.h"
@interface ModifiViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tex_modifi;

@end

@implementation ModifiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tex_modifi.text= _textContent;
    int i =[_type intValue];
    switch (i) {
        case 1:
            self.navigationItem.title=@"修改客户简称";
            break;
        case 2:
            self.navigationItem.title=@"修改客户名称";
            break;
        case 3:
            self.navigationItem.title=@"修改联系人";
            break;
        case 4:
            self.navigationItem.title=@"修改电话";
            break;
        case 5:
            self.navigationItem.title=@"修改手机号";
            break;
        default:
            break;
    }

    // Do any additional setup after loading the view.
}
- (IBAction)modifiPress:(id)sender {
  
    int i =[_type intValue];
    NSString *str;
    switch (i) {
        case 1:
        str=@"Cmgt_CmpNmAbbreviation";
            break;
        case 2:
        str=@"Cmgt_CmpNm";
            break;
        case 3:
        str=@"Cmgt_PNm";
            break;
        case 4:
        str=@"Cmgt_PTel";
            break;
        case 5:
        str=@"Cmgt_PMobile";
            break;
        default:
            break;
    }
    
    NSDictionary * param = @{@"method":@"UpClient",@"Cmgt_Id":[User standartUserInfo].Cmgt_Id ,str:_tex_modifi.text};
      [AlertHelper MBHUDShow:@"修改中..." ForView:self.view AndDelayHid:30];
  [  XiaDanWebAPI modifCompanyWithCmgt_IdDic:param Suecss:^(NSArray *arr) {
    //  NSLog(@"@@@ %@",arr);
      if ([[arr[0] objectForKey:@"bool"] isEqualToString:@"1"]) {
          [self initData];
          
        
      }
      else
      {
          [AlertHelper singleMBHUDShow:@"网络错误" ForView:self.view AndDelayHid:1];
      }
  } fail:^{
      [AlertHelper hideAllHUDsForView:self.view];
      [AlertHelper singleMBHUDShow:@"网络请求数据失败" ForView:self.view AndDelayHid:1];
  }];
    
    
}
-(void)initData
{
   NSString *  userName=[[NSUserDefaults standardUserDefaults]objectForKey:@"username"];
   NSString *  password=[[NSUserDefaults standardUserDefaults]objectForKey:@"password"];
    if (password.length==0) {
        UIStoryboard *s = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        UIViewController *changyongController = [s instantiateViewControllerWithIdentifier:@"ZhiBanLogin"];
     
        [self presentViewController:changyongController animated:YES completion:nil];
    }
    else
    {
    [XiaDanWebAPI loginWithUser:userName Cmgt_Pwd:password Suecss:^(NSArray *userInfo)
     {
        [AlertHelper hideAllHUDsForView:self.view];
         
         NSDictionary *userDic=nil;
         if (userInfo) {
             userDic=(NSDictionary*)userInfo[0];
         }
         
         if ([[userDic objectForKey:@"boo1"]isEqualToString:@"0"])
         {
             UIAlertView *   alert=[[UIAlertView alloc]initWithTitle:@"提示！" message:userDic[@"reason"]  delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
             [alert show];
         }
         else  if ([[userDic objectForKey:@"bool"]isEqualToString:@"1"])
         {
            [AlertHelper singleMBHUDShow:@"修改成功" ForView:self.view AndDelayHid:1];
             User *user = [User standartUserInfo];
             user.Cmgt_Id=userDic[@"Cmgt_Id"];
             user.Cmgt_CmpNm=userDic[@"Cmgt_CmpNm"];
             user.Cmgt_PMobile=userDic[@"Cmgt_PMobile"];
             user.Cmgt_PNm=userDic[@"Cmgt_PNm"];
             user.Cmgt_PTel=userDic[@"Cmgt_PTel"];
             user.Cmgt_CmpNmAbbreviation=userDic[@"Cmgt_CmpNmAbbreviation"];
            [self.navigationController popViewControllerAnimated: YES];
         
             
         }
         else
         {
             
             UIAlertView *   alert=[[UIAlertView alloc]initWithTitle:@"提示！" message:@"网络错误" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
             [alert show];
             
             
             
         }
         
         
         
     } fail:^(){
        // [MBProgressHUD hideHUDForView:self.view animated:YES];
         UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"请检查您的网络" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
         [alert show];
         
     }];

    }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
