//
//  UserCompanyViewController.m
//  OA_Box
//
//  Created by imac-1 on 2016/10/25.
//  Copyright © 2016年 魏艳丽. All rights reserved.
//

#import "UserCompanyViewController.h"
#import "ModifiViewController.h"
#import "User.h"
#import "ScreenHelper.h"
#import "XiaDanWebAPI.h"
#import "URL.h"
#import "AlertHelper.h"
@interface UserCompanyViewController ()
{
    NSString *versionUrl;
    NSString *versionShortStr;
}
@property (weak, nonatomic) IBOutlet UILabel *lab_Cmgt_CmpNmAbbreviation;
@property (weak, nonatomic) IBOutlet UILabel *lab_Cmgt_CmpNm;
@property (weak, nonatomic) IBOutlet UILabel *lab_Cmgt_PNm;
@property (weak, nonatomic) IBOutlet UILabel *lab_Cmgt_PTel;
@property (weak, nonatomic) IBOutlet UILabel *lab_Cmgt_PMobile;
@property (weak, nonatomic) IBOutlet UILabel *lab_Version;

@end

@implementation UserCompanyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setBounces:NO];
 //   [[UIApplication sharedApplication] setStatusBarHidden:TRUE];
    
    UIImageView *imaView=[[UIImageView alloc]initWithFrame:CGRectMake(0, -20, [ScreenHelper SCREEN_WIDTH], 267)];
    imaView.image=[UIImage imageNamed:@"i_01.jpg"];
     [self.view  addSubview:imaView];
    
    UIImageView *imaView1=[[UIImageView alloc]initWithFrame:CGRectMake(([ScreenHelper SCREEN_WIDTH]-83)/2, 62, 83, 83)];
    imaView1.image=[UIImage imageNamed:@"i_03.png"];
    [self.view  addSubview:imaView1];
   
    NSString *str  =[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
     _lab_Version.text=[NSString stringWithFormat:@"当前版本：%@",str];

}
//- (BOOL)prefersStatusBarHidden
//
//{
//    return YES;//隐藏为YES，显示为NO
//    
//}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self initData];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}
-(NSString *)buttonTag:(int)tag
{
    switch (tag) {
        case 1:
           return _lab_Cmgt_CmpNmAbbreviation.text;
            break;
        case 2:
            return _lab_Cmgt_CmpNm.text;
            break;
        case 3:
            return _lab_Cmgt_PNm.text;
            break;
        case 4:
            return _lab_Cmgt_PTel.text;
            break;
        case 5:
            return _lab_Cmgt_PMobile.text;
            break;
     
        default:
            break;
    }

    return nil;

}

- (IBAction)btnPress:(id)sender {
    
    UIButton *but=(UIButton *)sender;
    int i =(int) but.tag-1000;
    
    if (i==6||i==1||i==2) {
//        [AlertHelper MBHUDShow:@"检测中..." ForView:self.view AndDelayHid:30];
//        [XiaDanWebAPI getVersionSuecss:^(NSDictionary *dic) {
//             [AlertHelper hideAllHUDsForView:self.view];
//            NSArray *array = dic[@"results"];
//            NSDictionary *dict = [array lastObject];
//           // NSLog(@"当前版本为：%@", dict[@"version"]);
//            NSString *str=dict[@"version"];
//            versionUrl=dict[@"artistViewUrl"];
//            if (![str isEqualToString:_lab_Version.text])  {
//                                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"有可用的更新！" message:[[NSString alloc] initWithFormat:@"检测到新版本 v%@",str] delegate:self cancelButtonTitle:@"不" otherButtonTitles:@"现在升级", nil];
//                                [alert show];
//                            }
//            else
//            {
//                  [AlertHelper singleMBHUDShow:@"已是最新版本" ForView:self.view AndDelayHid:1];
//               
//            }
//            
//        } fail:^{
//            [AlertHelper hideAllHUDsForView:self.view];
//            [AlertHelper singleMBHUDShow:@"网络请求数据失败" ForView:self.view AndDelayHid:1];
//        }];
        
    }
    else
    {
    NSString *type=[NSString stringWithFormat:@"%d",i];
    
 
    UIStoryboard *s = [UIStoryboard storyboardWithName:@"XiaDan" bundle:[NSBundle mainBundle]];
    ModifiViewController *changyongController = [s instantiateViewControllerWithIdentifier:@"Modifi"];
   
    changyongController.type=type;
    changyongController.textContent= [self buttonTag:i];
    [self.navigationController pushViewController:changyongController animated:YES];
    }
    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex ==1) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:versionUrl]];
    }
}

-(void)initData
{
    
    _lab_Cmgt_PNm.text=[User standartUserInfo].Cmgt_PNm;
    _lab_Cmgt_PTel.text=[User standartUserInfo].Cmgt_PTel;
    _lab_Cmgt_CmpNm.text=[User standartUserInfo].Cmgt_CmpNm;
    _lab_Cmgt_PMobile.text=[User standartUserInfo].Cmgt_PMobile;
    _lab_Cmgt_CmpNmAbbreviation.text=[User standartUserInfo].Cmgt_CmpNmAbbreviation;
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
