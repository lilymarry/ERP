//
//  ChangPwdViewController.m
//  OA_Box
//
//  Created by imac-1 on 2016/10/25.
//  Copyright © 2016年 魏艳丽. All rights reserved.
//

#import "ChangPwdViewController.h"
#import "XiaDanWebAPI.h"
#import "User.h"
#import "ZhiBanLoginViewController.h"
#import "AlertHelper.h"
@interface ChangPwdViewController ()
@property (weak, nonatomic) IBOutlet UITextField *mPassword;
@property (weak, nonatomic) IBOutlet UITextField *mPassword2;
@property (weak, nonatomic) IBOutlet UITextField *mPassword3;
@end

@implementation ChangPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
- (IBAction)btnPress:(id)sender {
    
    [AlertHelper MBHUDShow:@"修改中..." ForView:self.view AndDelayHid:30];
    if (!_mPassword.text || _mPassword.text.length == 0) {
   
          [AlertHelper hideAllHUDsForView:self.view];
        [AlertHelper singleMBHUDShow:@"请填写旧密码" ForView:self.view AndDelayHid:1];

        return;
    }
    if (!_mPassword2.text || _mPassword2.text.length == 0) {
     
         [AlertHelper hideAllHUDsForView:self.view];
         [AlertHelper singleMBHUDShow:@"请填写新密码" ForView:self.view AndDelayHid:1];
        return;
    }
  if (!_mPassword3.text || _mPassword3.text.length == 0 || ![_mPassword3.text isEqualToString:_mPassword2.text]) {
        [AlertHelper hideAllHUDsForView:self.view];
      [AlertHelper singleMBHUDShow:@"两次输入密码不一致" ForView:self.view AndDelayHid:1];
             return;
    }
    NSDictionary * param = @{@"method":@"UpClient",@"Cmgt_Id":[User standartUserInfo].Cmgt_Id ,@"Cmgt_Pwd":_mPassword2.text};
    
    [  XiaDanWebAPI modifCompanyWithCmgt_IdDic:param Suecss:^(NSArray *arr) {
       // NSLog(@"@@@ %@",arr);
          [AlertHelper hideAllHUDsForView:self.view];
        if ([[arr[0] objectForKey:@"bool"] isEqualToString:@"1"]) {
            
            [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"password"];
            [[NSUserDefaults standardUserDefaults]synchronize];

            UIStoryboard *s = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            UIViewController *changyongController = [s instantiateViewControllerWithIdentifier:@"ZhiBanLogin"];
             [AlertHelper singleMBHUDShow:@"修改成功" ForView:self.view AndDelayHid:1];
            [self presentViewController:changyongController animated:YES completion:nil];
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
