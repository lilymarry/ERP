//
//  MainViewController.m
//  OA_Box
//
//  Created by imac-1 on 2016/10/20.
//  Copyright © 2016年 魏艳丽. All rights reserved.
//

#import "MainViewController.h"
#import "ScreenHelper.h"
#import "DingDaListViewController.h"
#import "GCPagingView.h"
#import "XiaDanWebAPI.h"
#import "BannerModel.h"
#import "BannerView.h"
#import "HuoDongViewController.h"
#import "User.h"
#import "UIView+Badge.h"
#import "AddDinDanViewController.h"
#import "GoodListViewController.h"
#import "CaiZhiModel.h"
#pragma clang diagnostic pop
@interface MainViewController ()<GCPagingViewDelegate>
{
   GCPagingView *pageView;
   NSMutableArray *bannerArray;
    UIButton*rightButton;
    UILabel * nameLab;

}
@end

@implementation MainViewController
- (void)dealloc{
    [pageView stopAutoScroll];
    pageView = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    NSString *docPath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
//    NSString *path=[docPath stringByAppendingPathComponent:@"person.text"];
//    
//    NSArray *arr2 = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
//    
//    if (arr2.count==0) {
//        
//        
//        BOOL success =  [NSKeyedArchiver archiveRootObject:[self setZhiLeiMode] toFile:path];
//        if (success) {
//        //    NSLog(@"归档成功");
//        }
//        
//
//    }
    
    
     rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,30,30)];
    [rightButton setImage:[UIImage imageNamed:@"shopicon.png"]forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(shopPress:)forControlEvents:UIControlEventTouchUpInside];
    nameLab=[[UILabel alloc]initWithFrame:CGRectMake(15, 0, 20, 20)];
    nameLab.layer.masksToBounds = YES;
    nameLab.layer.cornerRadius = 20*0.5;
    nameLab.backgroundColor=[UIColor whiteColor];
    nameLab.textColor=[UIColor redColor];
    nameLab.text=@"99+";
    nameLab.textAlignment=NSTextAlignmentCenter;
    nameLab.font=[UIFont systemFontOfSize:10];
    [rightButton addSubview:nameLab];
    
    UIBarButtonItem*rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];

    self.navigationItem.rightBarButtonItem= rightItem;
    
    bannerArray = [[NSMutableArray alloc]init];

    self.navigationItem.title=[User standartUserInfo].Cmgt_CmpNmAbbreviation;

    
//    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [ScreenHelper SCREEN_WIDTH], 64)];
//    view.backgroundColor=[UIColor colorWithRed:230/255.0 green:54/255.0 blue:66/255.0 alpha:1];
//    
//    [self.view addSubview:view];
//    
//    UILabel *savetext=[[UILabel alloc]init];
//    savetext.text=@"协旭科技";
//    savetext.textColor=[UIColor whiteColor];
//    savetext.frame=CGRectMake(20,18, [ScreenHelper SCREEN_WIDTH]-40 , 28);
//    savetext.font=[UIFont systemFontOfSize:10];
//    savetext.textAlignment=NSTextAlignmentCenter;
//    [view addSubview:savetext];
    
   

//    UIImageView *  bannerIV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, [ScreenHelper SCREEN_WIDTH], y)];
//    bannerIV.image=[UIImage imageNamed:@"index_02.jpg"];
//   [self.view addSubview:bannerIV];
   

    
    CGFloat y;
    
    if ([ScreenHelper SCREEN_HEIGHT] ==480)
    {
        y=120;
    }
    else
    {
        y=220;
    }
    
    pageView = [[GCPagingView alloc]initWithFrame:CGRectMake(0, 64, [ScreenHelper SCREEN_WIDTH] , y)];
    pageView.delegate = self;
    [self.view addSubview:pageView];
    
    [XiaDanWebAPI GetDataFromMainViewSuecss:^(NSArray * arr) {
      //  NSLog(@"WWWW _ %@" ,arr);
        [bannerArray removeAllObjects];
        NSArray *ar=arr[0][@"Banner"];
        for (NSDictionary *dic in ar ) {
            BannerModel *model=[[BannerModel alloc]initWithDic:dic];
            [bannerArray addObject:model];
        }
        [pageView reloadData];
        
        
    } fail:^{
        
    }];
   NSArray *imaArr=[NSArray arrayWithObjects:@"index_03.jpg",@"index_05.jpg",@"index_07.jpg",@"index_14.jpg",@"index_12.jpg",@"index_13.jpg", nil];
   
    double iconw=[ScreenHelper SCREEN_WIDTH]/3-7;
    double iconh=([ScreenHelper SCREEN_HEIGHT]-y-64-64)/2;
    double iconww=[ScreenHelper SCREEN_WIDTH]/3-7;
    
    for (int i=0; i<imaArr.count; i++) {
      
        int row=i/3;//行号
        
        int loc=i%3;//列号
        
        CGFloat appviewx=5+(5+iconw)*loc;
     
        CGFloat appviewy=5+(5+iconh)*row;
        
        UIButton* button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        button.userInteractionEnabled = YES;
      
        button.frame = CGRectMake(appviewx, appviewy+y+64,iconww, iconh);

       
       
        [button setBackgroundImage:[UIImage imageNamed:imaArr[i]] forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
     
        [self.view addSubview:button];
        

    }


}
-(void)viewWillAppear:(BOOL)animated
{
//    CGFloat y;
//    
//    if ([ScreenHelper SCREEN_HEIGHT] ==480)
//    {
//        y=120;
//    }
//    else
//    {
//        y=220;
//    }
//    pageView = [[GCPagingView alloc]initWithFrame:CGRectMake(0, 64, [ScreenHelper SCREEN_WIDTH] , y)];
//    pageView.delegate = self;
//    [self.view addSubview:pageView];
//    
//    [XiaDanWebAPI GetDataFromMainViewSuecss:^(NSArray * arr) {
//        NSLog(@"WWWW _ %@" ,arr);
//        [bannerArray removeAllObjects];
//        NSArray *ar=arr[0][@"Banner"];
//        for (NSDictionary *dic in ar ) {
//            BannerModel *model=[[BannerModel alloc]initWithDic:dic];
//            [bannerArray addObject:model];
//        }
//        [pageView reloadData];
//        
//        
//    } fail:^{
//        
//    }];
    [XiaDanWebAPI tempPaperBoardCountWithCmgt_Id:[User standartUserInfo].Cmgt_Id Suecss:^(NSArray *arr) {
        //    rightButton.badge.badgeValue=[[arr[0]objectForKey:@"count"] intValue];
        if ([[arr[0]objectForKey:@"count"] intValue]>=100) {
            nameLab.text=@"99+";
            
                }
        else
        {
            nameLab.text=[NSString stringWithFormat:@"%@",[arr[0]objectForKey:@"count"]] ;
        }
        
    } fail:^{
        
    }];
}
-(void)viewDidAppear:(BOOL)animated
{
//    CGFloat y;
//
//    if ([ScreenHelper SCREEN_HEIGHT] ==480)
//    {
//        y=120;
//    }
//    else
//    {
//        y=220;
//    }
//    pageView = [[GCPagingView alloc]initWithFrame:CGRectMake(0, 64, [ScreenHelper SCREEN_WIDTH] , y)];
//    pageView.delegate = self;
//    [self.view addSubview:pageView];
//    
//    [XiaDanWebAPI GetDataFromMainViewSuecss:^(NSArray * arr) {
//        NSLog(@"WWWW _ %@" ,arr);
//        [bannerArray removeAllObjects];
//        NSArray *ar=arr[0][@"Banner"];
//        for (NSDictionary *dic in ar ) {
//            BannerModel *model=[[BannerModel alloc]initWithDic:dic];
//            [bannerArray addObject:model];
//        }
//        [pageView reloadData];
//        
//        
//    } fail:^{
//        
//    }];

    
//    [XiaDanWebAPI tempPaperBoardCountWithCmgt_Id:[User standartUserInfo].Cmgt_Id Suecss:^(NSArray *arr) {
//      //    rightButton.badge.badgeValue=[[arr[0]objectForKey:@"count"] intValue];
//        if ([[arr[0]objectForKey:@"count"] intValue]>=100) {
//             nameLab.text=@"99+";
//            
//        }
//        else
//        {
//        nameLab.text=[NSString stringWithFormat:@"%@",[arr[0]objectForKey:@"count"]] ;
//        }
//        
//    } fail:^{
//        
//    }];
}

-(void)btnPress:(id)sender
{
    UIButton *but=(UIButton *)sender;
    switch (but.tag) {
        case 0:
        {
        
            if ([[User standartUserInfo].IsSinglePlant isEqualToString:@"1"]) {
                UIStoryboard *s = [UIStoryboard storyboardWithName:@"AddDingdan" bundle:[NSBundle mainBundle]];
                AddDinDanViewController *changyongController = [s instantiateViewControllerWithIdentifier:@"AddDinDan"];
                changyongController.model=[User standartUserInfo].model;
                changyongController.state=@"0";
                [self.navigationController pushViewController:changyongController animated:YES];

                
            }

            else
            {
            UIStoryboard *s = [UIStoryboard storyboardWithName:@"XiaDan" bundle:[NSBundle mainBundle]];
            UIViewController *changyongController = [s instantiateViewControllerWithIdentifier:@"SelectCom"];
            [self.navigationController pushViewController:changyongController animated:YES];
            }

        }
            
            break;
        case 1:
        {
          
            UIStoryboard *s = [UIStoryboard storyboardWithName:@"XiaDan" bundle:[NSBundle mainBundle]];
            DingDaListViewController *changyongController = [s instantiateViewControllerWithIdentifier:@"DingDaList"];
            changyongController.dingDanState=@"1,2,3,4,5";
            changyongController.type=@"2";
            [self.navigationController pushViewController:changyongController animated:YES];
        
        
        }
            break;
        case 2:
        {
        
            UIStoryboard *s = [UIStoryboard storyboardWithName:@"XiaDan" bundle:[NSBundle mainBundle]];
            DingDaListViewController *changyongController = [s instantiateViewControllerWithIdentifier:@"DingDaList"];
            changyongController.dingDanState=@"1,2,3,4,5,6,7";
            changyongController.type=@"2";
            [self.navigationController pushViewController:changyongController animated:YES];
         
        
        }
            break;
        case 3:
        {
            
            UIStoryboard *s = [UIStoryboard storyboardWithName:@"XiaDan" bundle:[NSBundle mainBundle]];
            DingDaListViewController *changyongController = [s instantiateViewControllerWithIdentifier:@"DingDaList"];
            changyongController.dingDanState=@"7";
            changyongController.type=@"2";
            [self.navigationController pushViewController:changyongController animated:YES];
            
            
        }
            break;
        case 4:
        {
          
            UIStoryboard *s = [UIStoryboard storyboardWithName:@"XiaDan" bundle:[NSBundle mainBundle]];
            DingDaListViewController *changyongController = [s instantiateViewControllerWithIdentifier:@"DingDaList"];
            changyongController.dingDanState=@"5";
             changyongController.type=@"2";
            [self.navigationController pushViewController:changyongController animated:YES];
            
        }
            break;
        case 5:
        {
       //     NSLog(@"jdjjjdjj");
//            UIStoryboard *s = [UIStoryboard storyboardWithName:@"XiaDan" bundle:[NSBundle mainBundle]];
//            GoodListViewController *changyongController = [s instantiateViewControllerWithIdentifier:@"GoodList"];
//         //   HuoDongViewController *changyongController = [s instantiateViewControllerWithIdentifier:@"HuoDong"];
//            UINavigationController *na=  (UINavigationController *)  [self.tabBarController.viewControllers objectAtIndex:1];
//            changyongController=  na.viewControllers[0];
//            changyongController.dingDanState=@"1,2,3,4,5,6,7";
//            changyongController.type=@"3";
            
           // changyongController.urlStr=@"http://zhiyebz.com/m-wap/";
            
            UIStoryboard *s = [UIStoryboard storyboardWithName:@"XiaDan" bundle:[NSBundle mainBundle]];
            HuoDongViewController *changyongController = [s instantiateViewControllerWithIdentifier:@"HuoDong"];
            // UINavigationController *na=  (UINavigationController *)  [self.tabBarController.viewControllers objectAtIndex:1];
            //   changyongController=  na.viewControllers[0];
            
           changyongController.urlStr=@"http://zhiyebz.com/m-wap/";
            
            [self.navigationController pushViewController:changyongController animated:YES];
        
        }
            break;

             default:
            break;
    }


}
- (IBAction)shopPress:(id)sender {
    
//    UIStoryboard *s = [UIStoryboard storyboardWithName:@"XiaDan" bundle:[NSBundle mainBundle]];
//    GoodListViewController *changyongController = [s instantiateViewControllerWithIdentifier:@"GoodList"];
//   // changyongController.dingDanState=@"1,2,3,4,5,6,7";
//   // changyongController.type=@"3";
//    [self.navigationController pushViewController:changyongController animated:YES];
    
       self.tabBarController.selectedIndex = 1;
}


#pragma -mark GCPagingViewDelegate
- (NSInteger)numberOfPagesInPagingView:(GCPagingView*)pagingView{
    return bannerArray.count;
}
- (UIView*)GCPagingView:(GCPagingView*)pagingView viewAtIndex:(NSInteger)index{
    
    BannerView *view = (BannerView *)[pagingView dequeueReusablePage];
    if (view == nil) {
        view = [[BannerView alloc] initWithFrame:pagingView.bounds];
        view.delegate = self;
        view.OnClick = @selector(OnBannerClick:);
    }
    BannerModel *info = [bannerArray objectAtIndex:index];
    [view LoadContent:info];
    return view;
}
- (void)OnBannerClick:(BannerView *)sender{
    BannerModel *model = sender.mInfo;
    UIStoryboard *s = [UIStoryboard storyboardWithName:@"XiaDan" bundle:[NSBundle mainBundle]];
    HuoDongViewController *changyongController = [s instantiateViewControllerWithIdentifier:@"HuoDong"];
   // UINavigationController *na=  (UINavigationController *)  [self.tabBarController.viewControllers objectAtIndex:1];
 //   changyongController=  na.viewControllers[0];
    
    changyongController.urlStr=model.BA_Url;
    
    [self.navigationController pushViewController:changyongController animated:YES];
   
  //  self.tabBarController.selectedIndex = 1;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidDisappear:(BOOL)animated
{


}
-(NSArray *)setZhiLeiMode
{
    
    CaiZhiModel * codeBean1 = [[CaiZhiModel alloc]init];
    codeBean1.idstr=@"1";
    codeBean1.PB_Id=@"";
    codeBean1.PB_Nm=@"三层B楞";
    codeBean1.PB_TypId=@"0";
    codeBean1.PB_TypNm=@"";
    codeBean1.PB_I_PeId=@"0";
    codeBean1.PB_I_PeNm=@"";
    codeBean1.PB_I_Way=@"MIAN";
    codeBean1.PB_II_PeId=@"2";
    codeBean1.PB_II_PeNm=@"B楞";
    codeBean1.PB_II_Way=@"LENG";
    codeBean1.PB_III_PeId=@"0";
    codeBean1.PB_III_PeNm=@"";
    codeBean1.PB_III_Way=@"LI";
    codeBean1.PB_IV_PeId=@"0";
    codeBean1.PB_IV_PeNm=@"";
    codeBean1.PB_IV_Way=@"";
    codeBean1.PB_V_PeId=@"0";
    codeBean1.PB_V_PeNm=@"";
    codeBean1.PB_V_Way=@"";
    codeBean1.PB_VI_PeId=@"0";
    codeBean1.PB_VI_PeNm=@"";
    codeBean1.PB_VI_Way=@"";
    codeBean1.PB_VII_PeId=@"0";
    codeBean1.PB_VII_PeNm=@"";
    codeBean1.PB_VII_Way=@"";
    codeBean1.PB_Work_Price=@"0";
    codeBean1.PB_SHORT_LX=@"B";
    codeBean1.PBDO_I_PmId=@"23";
    codeBean1.PBDO_I_PmNm=@"N";
    codeBean1.PBDO_I_PmCode=@"N";
    codeBean1.PBDO_II_PmId=@"3";
    codeBean1.PBDO_II_PmNm=@"3";
    codeBean1.PBDO_II_PmCode=@"3";
    codeBean1.PBDO_III_PmId=@"23";
    codeBean1.PBDO_III_PmNm=@"N";
    codeBean1.PBDO_III_PmCode=@"N";
    codeBean1.PBDO_IV_PmId=@"";
    codeBean1.PBDO_IV_PmNm=@"";
    codeBean1.PBDO_IV_PmCode=@"";
    codeBean1.PBDO_V_PmId=@"";
    codeBean1.PBDO_V_PmNm=@"";
    codeBean1.PBDO_V_PmCode=@"";
    codeBean1.PBDO_VI_PmId=@"";
    codeBean1.PBDO_VI_PmNm=@"";
    codeBean1.PBDO_VI_PmCode=@"";
    codeBean1.PBDO_VII_PmId=@"";
    codeBean1.PBDO_VII_PmNm=@"";
    codeBean1.PBDO_VII_PmCode=@"";
    codeBean1.zhilei=@"N3N(B)";
    CaiZhiModel * codeBean2 = [[CaiZhiModel alloc]init];
    codeBean2.idstr=@"2";
    codeBean2.PB_Id=@"";
    codeBean2.PB_Nm=@"三层B楞";
    codeBean2.PB_TypId=@"0";
    codeBean2.PB_TypNm=@"";
    codeBean2.PB_I_PeId=@"0";
    codeBean2.PB_I_PeNm=@"";
    codeBean2.PB_I_Way=@"MIAN";
    codeBean2.PB_II_PeId=@"2";
    codeBean2.PB_II_PeNm=@"B楞";
    codeBean2.PB_II_Way=@"LENG";
    codeBean2.PB_III_PeId=@"0";
    codeBean2.PB_III_PeNm=@"";
    codeBean2.PB_III_Way=@"LI";
    codeBean2.PB_IV_PeId=@"0";
    codeBean2.PB_IV_PeNm=@"";
    codeBean2.PB_IV_Way=@"";
    codeBean2.PB_V_PeId=@"0";
    codeBean2.PB_V_PeNm=@"";
    codeBean2.PB_V_Way=@"";
    codeBean2.PB_VI_PeId=@"0";
    codeBean2.PB_VI_PeNm=@"";
    codeBean2.PB_VI_Way=@"";
    codeBean2.PB_VII_PeId=@"0";
    codeBean2.PB_VII_PeNm=@"";
    codeBean2.PB_VII_Way=@"";
    codeBean2.PB_Work_Price=@"0";
    codeBean2.PB_SHORT_LX=@"B";
    codeBean2.PBDO_I_PmId=@"22";
    codeBean2.PBDO_I_PmNm=@"M";
    codeBean2.PBDO_I_PmCode=@"M";
    codeBean2.PBDO_II_PmId=@"4";
    codeBean2.PBDO_II_PmNm=@"4";
    codeBean2.PBDO_II_PmCode=@"4";
    codeBean2.PBDO_III_PmId=@"22";
    codeBean2.PBDO_III_PmNm=@"M";
    codeBean2.PBDO_III_PmCode=@"M";
    codeBean2.PBDO_IV_PmId=@"";
    codeBean2.PBDO_IV_PmNm=@"";
    codeBean2.PBDO_IV_PmCode=@"";
    codeBean2.PBDO_V_PmId=@"";
    codeBean2.PBDO_V_PmNm=@"";
    codeBean2.PBDO_V_PmCode=@"";
    codeBean2.PBDO_VI_PmId=@"";
    codeBean2.PBDO_VI_PmNm=@"";
    codeBean2.PBDO_VI_PmCode=@"";
    codeBean2.PBDO_VII_PmId=@"";
    codeBean2.PBDO_VII_PmNm=@"";
    codeBean2.PBDO_VII_PmCode=@"";
    codeBean2.zhilei=@"M4M(B)";
    CaiZhiModel * codeBean3 = [[CaiZhiModel alloc]init];
    codeBean3.idstr=@"3";
    codeBean3.PB_Id=@"";
    codeBean3.PB_Nm=@"三层A楞";
    codeBean3.PB_TypId=@"0";
    codeBean3.PB_TypNm=@"";
    codeBean3.PB_I_PeId=@"0";
    codeBean3.PB_I_PeNm=@"";
    codeBean3.PB_I_Way=@"MIAN";
    codeBean3.PB_II_PeId=@"1";
    codeBean3.PB_II_PeNm=@"A楞";
    codeBean3.PB_II_Way=@"LENG";
    codeBean3.PB_III_PeId=@"0";
    codeBean3.PB_III_PeNm=@"";
    codeBean3.PB_III_Way=@"LI";
    codeBean3.PB_IV_PeId=@"0";
    codeBean3.PB_IV_PeNm=@"";
    codeBean3.PB_IV_Way=@"";
    codeBean3.PB_V_PeId=@"0";
    codeBean3.PB_V_PeNm=@"";
    codeBean3.PB_V_Way=@"";
    codeBean3.PB_VI_PeId=@"0";
    codeBean3.PB_VI_PeNm=@"";
    codeBean3.PB_VI_Way=@"";
    codeBean3.PB_VII_PeId=@"0";
    codeBean3.PB_VII_PeNm=@"";
    codeBean3.PB_VII_Way=@"";
    codeBean3.PB_Work_Price=@"0";
    codeBean3.PB_SHORT_LX=@"A";
    codeBean3.PBDO_I_PmId=@"22";
    codeBean3.PBDO_I_PmNm=@"M";
    codeBean3.PBDO_I_PmCode=@"M";
    codeBean3.PBDO_II_PmId=@"4";
    codeBean3.PBDO_II_PmNm=@"4";
    codeBean3.PBDO_II_PmCode=@"4";
    codeBean3.PBDO_III_PmId=@"22";
    codeBean3.PBDO_III_PmNm=@"M";
    codeBean3.PBDO_III_PmCode=@"M";
    codeBean3.PBDO_IV_PmId=@"";
    codeBean3.PBDO_IV_PmNm=@"";
    codeBean3.PBDO_IV_PmCode=@"";
    codeBean3.PBDO_V_PmId=@"";
    codeBean3.PBDO_V_PmNm=@"";
    codeBean3.PBDO_V_PmCode=@"";
    codeBean3.PBDO_VI_PmId=@"";
    codeBean3.PBDO_VI_PmNm=@"";
    codeBean3.PBDO_VI_PmCode=@"";
    codeBean3.PBDO_VII_PmId=@"";
    codeBean3.PBDO_VII_PmNm=@"";
    codeBean3.PBDO_VII_PmCode=@"";
    codeBean3.zhilei=@"M4M(A)";
    CaiZhiModel * codeBean4 = [[CaiZhiModel alloc]init];
    codeBean4.idstr=@"4";
    codeBean4.PB_Id=@"";
    codeBean4.PB_Nm=@"三层B楞";
    codeBean4.PB_TypId=@"0";
    codeBean4.PB_TypNm=@"";
    codeBean4.PB_I_PeId=@"0";
    codeBean4.PB_I_PeNm=@"";
    codeBean4.PB_I_Way=@"MIAN";
    codeBean4.PB_II_PeId=@"2";
    codeBean4.PB_II_PeNm=@"B楞";
    codeBean4.PB_II_Way=@"LENG";
    codeBean4.PB_III_PeId=@"0";
    codeBean4.PB_III_PeNm=@"";
    codeBean4.PB_III_Way=@"LI";
    codeBean4.PB_IV_PeId=@"0";
    codeBean4.PB_IV_PeNm=@"";
    codeBean4.PB_IV_Way=@"";
    codeBean4.PB_V_PeId=@"0";
    codeBean4.PB_V_PeNm=@"";
    codeBean4.PB_V_Way=@"";
    codeBean4.PB_VI_PeId=@"0";
    codeBean4.PB_VI_PeNm=@"";
    codeBean4.PB_VI_Way=@"";
    codeBean4.PB_VII_PeId=@"0";
    codeBean4.PB_VII_PeNm=@"";
    codeBean4.PB_VII_Way=@"";
    codeBean4.PB_Work_Price=@"0";
    codeBean4.PB_SHORT_LX=@"B";
    codeBean4.PBDO_I_PmId=@"27";
    codeBean4.PBDO_I_PmNm=@"R";
    codeBean4.PBDO_I_PmCode=@"R";
    codeBean4.PBDO_II_PmId=@"6";
    codeBean4.PBDO_II_PmNm=@"6";
    codeBean4.PBDO_II_PmCode=@"6";
    codeBean4.PBDO_III_PmId=@"22";
    codeBean4.PBDO_III_PmNm=@"M";
    codeBean4.PBDO_III_PmCode=@"M";
    codeBean4.PBDO_IV_PmId=@"";
    codeBean4.PBDO_IV_PmNm=@"";
    codeBean4.PBDO_IV_PmCode=@"";
    codeBean4.PBDO_V_PmId=@"";
    codeBean4.PBDO_V_PmNm=@"";
    codeBean4.PBDO_V_PmCode=@"";
    codeBean4.PBDO_VI_PmId=@"";
    codeBean4.PBDO_VI_PmNm=@"";
    codeBean4.PBDO_VI_PmCode=@"";
    codeBean4.PBDO_VII_PmId=@"";
    codeBean4.PBDO_VII_PmNm=@"";
    codeBean4.PBDO_VII_PmCode=@"";
    codeBean4.zhilei=@"R6M(B)";
    CaiZhiModel * codeBean5 = [[CaiZhiModel alloc]init];
    codeBean5.idstr=@"5";
    codeBean5.PB_Id=@"";
    codeBean5.PB_Nm=@"三层A楞";
    codeBean5.PB_TypId=@"0";
    codeBean5.PB_TypNm=@"";
    codeBean5.PB_I_PeId=@"0";
    codeBean5.PB_I_PeNm=@"";
    codeBean5.PB_I_Way=@"MIAN";
    codeBean5.PB_II_PeId=@"1";
    codeBean5.PB_II_PeNm=@"A楞";
    codeBean5.PB_II_Way=@"LENG";
    codeBean5.PB_III_PeId=@"0";
    codeBean5.PB_III_PeNm=@"";
    codeBean5.PB_III_Way=@"LI";
    codeBean5.PB_IV_PeId=@"0";
    codeBean5.PB_IV_PeNm=@"";
    codeBean5.PB_IV_Way=@"";
    codeBean5.PB_V_PeId=@"0";
    codeBean5.PB_V_PeNm=@"";
    codeBean5.PB_V_Way=@"";
    codeBean5.PB_VI_PeId=@"0";
    codeBean5.PB_VI_PeNm=@"";
    codeBean5.PB_VI_Way=@"";
    codeBean5.PB_VII_PeId=@"0";
    codeBean5.PB_VII_PeNm=@"";
    codeBean5.PB_VII_Way=@"";
    codeBean5.PB_Work_Price=@"0";
    codeBean5.PB_SHORT_LX=@"A";
    codeBean5.PBDO_I_PmId=@"27";
    codeBean5.PBDO_I_PmNm=@"R";
    codeBean5.PBDO_I_PmCode=@"R";
    codeBean5.PBDO_II_PmId=@"6";
    codeBean5.PBDO_II_PmNm=@"6";
    codeBean5.PBDO_II_PmCode=@"6";
    codeBean5.PBDO_III_PmId=@"22";
    codeBean5.PBDO_III_PmNm=@"M";
    codeBean5.PBDO_III_PmCode=@"M";
    codeBean5.PBDO_IV_PmId=@"";
    codeBean5.PBDO_IV_PmNm=@"";
    codeBean5.PBDO_IV_PmCode=@"";
    codeBean5.PBDO_V_PmId=@"";
    codeBean5.PBDO_V_PmNm=@"";
    codeBean5.PBDO_V_PmCode=@"";
    codeBean5.PBDO_VI_PmId=@"";
    codeBean5.PBDO_VI_PmNm=@"";
    codeBean5.PBDO_VI_PmCode=@"";
    codeBean5.PBDO_VII_PmId=@"";
    codeBean5.PBDO_VII_PmNm=@"";
    codeBean5.PBDO_VII_PmCode=@"";
    codeBean5.zhilei=@"R6M(A)";
    CaiZhiModel* codeBean6 = [[CaiZhiModel alloc]init];
    codeBean6.idstr=@"6";
    codeBean6.PB_Id=@"";
    codeBean6.PB_Nm=@"三层B楞";
    codeBean6.PB_TypId=@"0";
    codeBean6.PB_TypNm=@"";
    codeBean6.PB_I_PeId=@"0";
    codeBean6.PB_I_PeNm=@"";
    codeBean6.PB_I_Way=@"MIAN";
    codeBean6.PB_II_PeId=@"2";
    codeBean6.PB_II_PeNm=@"B楞";
    codeBean6.PB_II_Way=@"LENG";
    codeBean6.PB_III_PeId=@"0";
    codeBean6.PB_III_PeNm=@"";
    codeBean6.PB_III_Way=@"LI";
    codeBean6.PB_IV_PeId=@"0";
    codeBean6.PB_IV_PeNm=@"";
    codeBean6.PB_IV_Way=@"";
    codeBean6.PB_V_PeId=@"0";
    codeBean6.PB_V_PeNm=@"";
    codeBean6.PB_V_Way=@"";
    codeBean6.PB_VI_PeId=@"0";
    codeBean6.PB_VI_PeNm=@"";
    codeBean6.PB_VI_Way=@"";
    codeBean6.PB_VII_PeId=@"0";
    codeBean6.PB_VII_PeNm=@"";
    codeBean6.PB_VII_Way=@"";
    codeBean6.PB_Work_Price=@"0";
    codeBean6.PB_SHORT_LX=@"B";
    codeBean6.PBDO_I_PmId=@"33";
    codeBean6.PBDO_I_PmNm=@"X";
    codeBean6.PBDO_I_PmCode=@"X";
    codeBean6.PBDO_II_PmId=@"6";
    codeBean6.PBDO_II_PmNm=@"6";
    codeBean6.PBDO_II_PmCode=@"6";
    codeBean6.PBDO_III_PmId=@"27";
    codeBean6.PBDO_III_PmNm=@"R";
    codeBean6.PBDO_III_PmCode=@"R";
    codeBean6.PBDO_IV_PmId=@"";
    codeBean6.PBDO_IV_PmNm=@"";
    codeBean6.PBDO_IV_PmCode=@"";
    codeBean6.PBDO_V_PmId=@"";
    codeBean6.PBDO_V_PmNm=@"";
    codeBean6.PBDO_V_PmCode=@"";
    codeBean6.PBDO_VI_PmId=@"";
    codeBean6.PBDO_VI_PmNm=@"";
    codeBean6.PBDO_VI_PmCode=@"";
    codeBean6.PBDO_VII_PmId=@"";
    codeBean6.PBDO_VII_PmNm=@"";
    codeBean6.PBDO_VII_PmCode=@"";
    codeBean6.zhilei=@"X6R(B)";
    CaiZhiModel * codeBean7 = [[CaiZhiModel alloc]init];
    codeBean7.idstr=@"7";
    codeBean7.PB_Id=@"";
    codeBean7.PB_Nm=@"三层A楞";
    codeBean7.PB_TypId=@"0";
    codeBean7.PB_TypNm=@"";
    codeBean7.PB_I_PeId=@"0";
    codeBean7.PB_I_PeNm=@"";
    codeBean7.PB_I_Way=@"MIAN";
    codeBean7.PB_II_PeId=@"1";
    codeBean7.PB_II_PeNm=@"A楞";
    codeBean7.PB_II_Way=@"LENG";
    codeBean7.PB_III_PeId=@"0";
    codeBean7.PB_III_PeNm=@"";
    codeBean7.PB_III_Way=@"LI";
    codeBean7.PB_IV_PeId=@"0";
    codeBean7.PB_IV_PeNm=@"";
    codeBean7.PB_IV_Way=@"";
    codeBean7.PB_V_PeId=@"0";
    codeBean7.PB_V_PeNm=@"";
    codeBean7.PB_V_Way=@"";
    codeBean7.PB_VI_PeId=@"0";
    codeBean7.PB_VI_PeNm=@"";
    codeBean7.PB_VI_Way=@"";
    codeBean7.PB_VII_PeId=@"0";
    codeBean7.PB_VII_PeNm=@"";
    codeBean7.PB_VII_Way=@"";
    codeBean7.PB_Work_Price=@"0";
    codeBean7.PB_SHORT_LX=@"A";
    codeBean7.PBDO_I_PmId=@"33";
    codeBean7.PBDO_I_PmNm=@"X";
    codeBean7.PBDO_I_PmCode=@"X";
    codeBean7.PBDO_II_PmId=@"6";
    codeBean7.PBDO_II_PmNm=@"6";
    codeBean7.PBDO_II_PmCode=@"6";
    codeBean7.PBDO_III_PmId=@"27";
    codeBean7.PBDO_III_PmNm=@"R";
    codeBean7.PBDO_III_PmCode=@"R";
    codeBean7.PBDO_IV_PmId=@"";
    codeBean7.PBDO_IV_PmNm=@"";
    codeBean7.PBDO_IV_PmCode=@"";
    codeBean7.PBDO_V_PmId=@"";
    codeBean7.PBDO_V_PmNm=@"";
    codeBean7.PBDO_V_PmCode=@"";
    codeBean7.PBDO_VI_PmId=@"";
    codeBean7.PBDO_VI_PmNm=@"";
    codeBean7.PBDO_VI_PmCode=@"";
    codeBean7.PBDO_VII_PmId=@"";
    codeBean7.PBDO_VII_PmNm=@"";
    codeBean7.PBDO_VII_PmCode=@"";
    codeBean7.zhilei=@"X6R(A)";
    CaiZhiModel * codeBean8 = [[CaiZhiModel alloc]init];
    codeBean8.idstr=@"8";
    codeBean8.PB_Id=@"";
    codeBean8.PB_Nm=@"五层BA楞";
    codeBean8.PB_TypId=@"0";
    codeBean8.PB_TypNm=@"";
    codeBean8.PB_I_PeId=@"0";
    codeBean8.PB_I_PeNm=@"";
    codeBean8.PB_I_Way=@"MIAN";
    codeBean8.PB_II_PeId=@"2";
    codeBean8.PB_II_PeNm=@"B楞";
    codeBean8.PB_II_Way=@"LENG";
    codeBean8.PB_III_PeId=@"0";
    codeBean8.PB_III_PeNm=@"";
    codeBean8.PB_III_Way=@"XIN";
    codeBean8.PB_IV_PeId=@"1";
    codeBean8.PB_IV_PeNm=@"A楞";
    codeBean8.PB_IV_Way=@"LENG";
    codeBean8.PB_V_PeId=@"0";
    codeBean8.PB_V_PeNm=@"";
    codeBean8.PB_V_Way=@"LI";
    codeBean8.PB_VI_PeId=@"0";
    codeBean8.PB_VI_PeNm=@"";
    codeBean8.PB_VI_Way=@"";
    codeBean8.PB_VII_PeId=@"0";
    codeBean8.PB_VII_PeNm=@"";
    codeBean8.PB_VII_Way=@"";
    codeBean8.PB_Work_Price=@"0";
    codeBean8.PB_SHORT_LX=@"BA";
    codeBean8.PBDO_I_PmId=@"22";
    codeBean8.PBDO_I_PmNm=@"M";
    codeBean8.PBDO_I_PmCode=@"M";
    codeBean8.PBDO_II_PmId=@"3";
    codeBean8.PBDO_II_PmNm=@"3";
    codeBean8.PBDO_II_PmCode=@"3";
    codeBean8.PBDO_III_PmId=@"1";
    codeBean8.PBDO_III_PmNm=@"1";
    codeBean8.PBDO_III_PmCode=@"1";
    codeBean8.PBDO_IV_PmId=@"4";
    codeBean8.PBDO_IV_PmNm=@"4";
    codeBean8.PBDO_IV_PmCode=@"4";
    codeBean8.PBDO_V_PmId=@"23";
    codeBean8.PBDO_V_PmNm=@"N";
    codeBean8.PBDO_V_PmCode=@"N";
    codeBean8.PBDO_VI_PmId=@"";
    codeBean8.PBDO_VI_PmNm=@"";
    codeBean8.PBDO_VI_PmCode=@"";
    codeBean8.PBDO_VII_PmId=@"";
    codeBean8.PBDO_VII_PmNm=@"";
    codeBean8.PBDO_VII_PmCode=@"";
    codeBean8.zhilei=@"M314N(BA)";
    CaiZhiModel * codeBean9 = [[CaiZhiModel alloc]init];
    codeBean9.idstr=@"9";
    codeBean9.PB_Id=@"";
    codeBean9.PB_Nm=@"五层BA楞";
    codeBean9.PB_TypId=@"0";
    codeBean9.PB_TypNm=@"";
    codeBean9.PB_I_PeId=@"0";
    codeBean9.PB_I_PeNm=@"";
    codeBean9.PB_I_Way=@"MIAN";
    codeBean9.PB_II_PeId=@"2";
    codeBean9.PB_II_PeNm=@"B楞";
    codeBean9.PB_II_Way=@"LENG";
    codeBean9.PB_III_PeId=@"0";
    codeBean9.PB_III_PeNm=@"";
    codeBean9.PB_III_Way=@"XIN";
    codeBean9.PB_IV_PeId=@"1";
    codeBean9.PB_IV_PeNm=@"A楞";
    codeBean9.PB_IV_Way=@"LENG";
    codeBean9.PB_V_PeId=@"0";
    codeBean9.PB_V_PeNm=@"";
    codeBean9.PB_V_Way=@"LI";
    codeBean9.PB_VI_PeId=@"0";
    codeBean9.PB_VI_PeNm=@"";
    codeBean9.PB_VI_Way=@"";
    codeBean9.PB_VII_PeId=@"0";
    codeBean9.PB_VII_PeNm=@"";
    codeBean9.PB_VII_Way=@"";
    codeBean9.PB_Work_Price=@"0";
    codeBean9.PB_SHORT_LX=@"BA";
    codeBean9.PBDO_I_PmId=@"22";
    codeBean9.PBDO_I_PmNm=@"M";
    codeBean9.PBDO_I_PmCode=@"M";
    codeBean9.PBDO_II_PmId=@"4";
    codeBean9.PBDO_II_PmNm=@"4";
    codeBean9.PBDO_II_PmCode=@"4";
    codeBean9.PBDO_III_PmId=@"1";
    codeBean9.PBDO_III_PmNm=@"1";
    codeBean9.PBDO_III_PmCode=@"1";
    codeBean9.PBDO_IV_PmId=@"4";
    codeBean9.PBDO_IV_PmNm=@"4";
    codeBean9.PBDO_IV_PmCode=@"4";
    codeBean9.PBDO_V_PmId=@"22";
    codeBean9.PBDO_V_PmNm=@"M";
    codeBean9.PBDO_V_PmCode=@"M";
    codeBean9.PBDO_VI_PmId=@"";
    codeBean9.PBDO_VI_PmNm=@"";
    codeBean9.PBDO_VI_PmCode=@"";
    codeBean9.PBDO_VII_PmId=@"";
    codeBean9.PBDO_VII_PmNm=@"";
    codeBean9.PBDO_VII_PmCode=@"";
    codeBean9.zhilei=@"M414M(BA)";
    CaiZhiModel * codeBean10 = [[CaiZhiModel alloc]init];
    codeBean10.idstr=@"10";
    codeBean10.PB_Id=@"";
    codeBean10.PB_Nm=@"五层BA楞";
    codeBean10.PB_TypId=@"0";
    codeBean10.PB_TypNm=@"";
    codeBean10.PB_I_PeId=@"0";
    codeBean10.PB_I_PeNm=@"";
    codeBean10.PB_I_Way=@"MIAN";
    codeBean10.PB_II_PeId=@"2";
    codeBean10.PB_II_PeNm=@"B楞";
    codeBean10.PB_II_Way=@"LENG";
    codeBean10.PB_III_PeId=@"0";
    codeBean10.PB_III_PeNm=@"";
    codeBean10.PB_III_Way=@"XIN";
    codeBean10.PB_IV_PeId=@"1";
    codeBean10.PB_IV_PeNm=@"A楞";
    codeBean10.PB_IV_Way=@"LENG";
    codeBean10.PB_V_PeId=@"0";
    codeBean10.PB_V_PeNm=@"";
    codeBean10.PB_V_Way=@"LI";
    codeBean10.PB_VI_PeId=@"0";
    codeBean10.PB_VI_PeNm=@"";
    codeBean10.PB_VI_Way=@"";
    codeBean10.PB_VII_PeId=@"0";
    codeBean10.PB_VII_PeNm=@"";
    codeBean10.PB_VII_Way=@"";
    codeBean10.PB_Work_Price=@"0";
    codeBean10.PB_SHORT_LX=@"BA";
    codeBean10.PBDO_I_PmId=@"27";
    codeBean10.PBDO_I_PmNm=@"R";
    codeBean10.PBDO_I_PmCode=@"R";
    codeBean10.PBDO_II_PmId=@"4";
    codeBean10.PBDO_II_PmNm=@"4";
    codeBean10.PBDO_II_PmCode=@"4";
    codeBean10.PBDO_III_PmId=@"1";
    codeBean10.PBDO_III_PmNm=@"1";
    codeBean10.PBDO_III_PmCode=@"1";
    codeBean10.PBDO_IV_PmId=@"6";
    codeBean10.PBDO_IV_PmNm=@"6";
    codeBean10.PBDO_IV_PmCode=@"6";
    codeBean10.PBDO_V_PmId=@"22";
    codeBean10.PBDO_V_PmNm=@"M";
    codeBean10.PBDO_V_PmCode=@"M";
    codeBean10.PBDO_VI_PmId=@"";
    codeBean10.PBDO_VI_PmNm=@"";
    codeBean10.PBDO_VI_PmCode=@"";
    codeBean10.PBDO_VII_PmId=@"";
    codeBean10.PBDO_VII_PmNm=@"";
    codeBean10.PBDO_VII_PmCode=@"";
    codeBean10.zhilei=@"R416M(BA)";
    CaiZhiModel * codeBean11 = [[CaiZhiModel alloc]init];
    
    codeBean11.idstr=@"11";
    codeBean11.PB_Id=@"";
    codeBean11.PB_Nm=@"五层BA楞";
    codeBean11.PB_TypId=@"0";
    codeBean11.PB_TypNm=@"";
    codeBean11.PB_I_PeId=@"0";
    codeBean11.PB_I_PeNm=@"";
    codeBean11.PB_I_Way=@"MIAN";
    codeBean11.PB_II_PeId=@"2";
    codeBean11.PB_II_PeNm=@"B楞";
    codeBean11.PB_II_Way=@"LENG";
    codeBean11.PB_III_PeId=@"0";
    codeBean11.PB_III_PeNm=@"";
    codeBean11.PB_III_Way=@"XIN";
    codeBean11.PB_IV_PeId=@"1";
    codeBean11.PB_IV_PeNm=@"A楞";
    codeBean11.PB_IV_Way=@"LENG";
    codeBean11.PB_V_PeId=@"0";
    codeBean11.PB_V_PeNm=@"";
    codeBean11.PB_V_Way=@"LI";
    codeBean11.PB_VI_PeId=@"0";
    codeBean11.PB_VI_PeNm=@"";
    codeBean11.PB_VI_Way=@"";
    codeBean11.PB_VII_PeId=@"0";
    codeBean11.PB_VII_PeNm=@"";
    codeBean11.PB_VII_Way=@"";
    codeBean11.PB_Work_Price=@"0";
    codeBean11.PB_SHORT_LX=@"BA";
    codeBean11.PBDO_I_PmId=@"27";
    codeBean11.PBDO_I_PmNm=@"R";
    codeBean11.PBDO_I_PmCode=@"R";
    codeBean11.PBDO_II_PmId=@"6";
    codeBean11.PBDO_II_PmNm=@"6";
    codeBean11.PBDO_II_PmCode=@"6";
    codeBean11.PBDO_III_PmId=@"1";
    codeBean11.PBDO_III_PmNm=@"1";
    codeBean11.PBDO_III_PmCode=@"1";
    codeBean11.PBDO_IV_PmId=@"6";
    codeBean11.PBDO_IV_PmNm=@"6";
    codeBean11.PBDO_IV_PmCode=@"6";
    codeBean11.PBDO_V_PmId=@"22";
    codeBean11.PBDO_V_PmNm=@"M";
    codeBean11.PBDO_V_PmCode=@"M";
    codeBean11.PBDO_VI_PmId=@"";
    codeBean11.PBDO_VI_PmNm=@"";
    codeBean11.PBDO_VI_PmCode=@"";
    codeBean11.PBDO_VII_PmId=@"";
    codeBean11.PBDO_VII_PmNm=@"";
    codeBean11.PBDO_VII_PmCode=@"";
    codeBean11.zhilei=@"R616M(BA)";
    CaiZhiModel * codeBean12 = [[CaiZhiModel alloc]init];
    
    codeBean12.idstr=@"12";
    codeBean12.PB_Id=@"";
    codeBean12.PB_Nm=@"五层BA楞";
    codeBean12.PB_TypId=@"0";
    codeBean12.PB_TypNm=@"";
    codeBean12.PB_I_PeId=@"0";
    codeBean12.PB_I_PeNm=@"";
    codeBean12.PB_I_Way=@"MIAN";
    codeBean12.PB_II_PeId=@"2";
    codeBean12.PB_II_PeNm=@"B楞";
    codeBean12.PB_II_Way=@"LENG";
    codeBean12.PB_III_PeId=@"0";
    codeBean12.PB_III_PeNm=@"";
    codeBean12.PB_III_Way=@"XIN";
    codeBean12.PB_IV_PeId=@"1";
    codeBean12.PB_IV_PeNm=@"A楞";
    codeBean12.PB_IV_Way=@"LENG";
    codeBean12.PB_V_PeId=@"0";
    codeBean12.PB_V_PeNm=@"";
    codeBean12.PB_V_Way=@"LI";
    codeBean12.PB_VI_PeId=@"0";
    codeBean12.PB_VI_PeNm=@"";
    codeBean12.PB_VI_Way=@"";
    codeBean12.PB_VII_PeId=@"0";
    codeBean12.PB_VII_PeNm=@"";
    codeBean12.PB_VII_Way=@"";
    codeBean12.PB_Work_Price=@"0";
    codeBean12.PB_SHORT_LX=@"BA";
    codeBean12.PBDO_I_PmId=@"33";
    codeBean12.PBDO_I_PmNm=@"X";
    codeBean12.PBDO_I_PmCode=@"X";
    codeBean12.PBDO_II_PmId=@"6";
    codeBean12.PBDO_II_PmNm=@"6";
    codeBean12.PBDO_II_PmCode=@"6";
    codeBean12.PBDO_III_PmId=@"1";
    codeBean12.PBDO_III_PmNm=@"1";
    codeBean12.PBDO_III_PmCode=@"1";
    codeBean12.PBDO_IV_PmId=@"6";
    codeBean12.PBDO_IV_PmNm=@"6";
    codeBean12.PBDO_IV_PmCode=@"6";
    codeBean12.PBDO_V_PmId=@"27";
    codeBean12.PBDO_V_PmNm=@"R";
    codeBean12.PBDO_V_PmCode=@"R";
    codeBean12.PBDO_VI_PmId=@"";
    codeBean12.PBDO_VI_PmNm=@"";
    codeBean12.PBDO_VI_PmCode=@"";
    codeBean12.PBDO_VII_PmId=@"";
    codeBean12.PBDO_VII_PmNm=@"";
    codeBean12.PBDO_VII_PmCode=@"";
    codeBean12.zhilei=@"X616R(BA)";
    CaiZhiModel * codeBean13 = [[CaiZhiModel alloc]init];
    
    codeBean13.idstr=@"13";
    codeBean13.PB_Id=@" ";
    codeBean13.PB_Nm=@"五层BA楞";
    codeBean13.PB_TypId=@"0";
    codeBean13.PB_TypNm=@"";
    codeBean13.PB_I_PeId=@"0";
    codeBean13.PB_I_PeNm=@"";
    codeBean13.PB_I_Way=@"MIAN";
    codeBean13.PB_II_PeId=@"2";
    codeBean13.PB_II_PeNm=@"B楞";
    codeBean13.PB_II_Way=@"LENG";
    codeBean13.PB_III_PeId=@"0";
    codeBean13.PB_III_PeNm=@"";
    codeBean13.PB_III_Way=@"XIN";
    codeBean13.PB_IV_PeId=@"1";
    codeBean13.PB_IV_PeNm=@"A楞";
    codeBean13.PB_IV_Way=@"LENG";
    codeBean13.PB_V_PeId=@"0";
    codeBean13.PB_V_PeNm=@"";
    codeBean13.PB_V_Way=@"LI";
    codeBean13.PB_VI_PeId=@"0";
    codeBean13.PB_VI_PeNm=@"";
    codeBean13.PB_VI_Way=@"";
    codeBean13.PB_VII_PeId=@"0";
    codeBean13.PB_VII_PeNm=@"";
    codeBean13.PB_VII_Way=@"";
    codeBean13.PB_Work_Price=@"0";
    codeBean13.PB_SHORT_LX=@"BA";
    codeBean13.PBDO_I_PmId=@"33";
    codeBean13.PBDO_I_PmNm=@"X";
    codeBean13.PBDO_I_PmCode=@"X";
    codeBean13.PBDO_II_PmId=@"6";
    codeBean13.PBDO_II_PmNm=@"6";
    codeBean13.PBDO_II_PmCode=@"6";
    codeBean13.PBDO_III_PmId=@"1";
    codeBean13.PBDO_III_PmNm=@"1";
    codeBean13.PBDO_III_PmCode=@"1";
    codeBean13.PBDO_IV_PmId=@"8";
    codeBean13.PBDO_IV_PmNm=@"8";
    codeBean13.PBDO_IV_PmCode=@"8";
    codeBean13.PBDO_V_PmId=@"33";
    codeBean13.PBDO_V_PmNm=@"X";
    codeBean13.PBDO_V_PmCode=@"X";
    codeBean13.PBDO_VI_PmId=@"";
    codeBean13.PBDO_VI_PmNm=@"";
    codeBean13.PBDO_VI_PmCode=@"";
    codeBean13.PBDO_VII_PmId=@"";
    codeBean13.PBDO_VII_PmNm=@"";
    codeBean13.PBDO_VII_PmCode=@"";
    codeBean13.zhilei=@"X618X(BA)";
    
    NSArray *arr=[NSArray arrayWithObjects:codeBean1,codeBean2,codeBean3,codeBean4,codeBean5,codeBean6,codeBean7,codeBean8,codeBean9,codeBean10,codeBean11,codeBean12,codeBean13, nil];
    return arr;
    
    
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
