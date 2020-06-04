//
//  ShopDetailViewController.m
//  OA_Box
//
//  Created by imac-1 on 2016/12/15.
//  Copyright © 2016年 魏艳丽. All rights reserved.
//

#import "ShopDetailViewController.h"
#import "DingDanDetailCell.h"
#import "AlertHelper.h"
#import "XiaDanWebAPI.h"
#import "AddDinDanViewController.h"
#import "User.h"
@interface ShopDetailViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tabView;

@end

@implementation ShopDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (IBAction)modiyPress:(id)sender {
    UIStoryboard *s = [UIStoryboard storyboardWithName:@"AddDingdan" bundle:[NSBundle mainBundle]];
    AddDinDanViewController *changyongController = [s instantiateViewControllerWithIdentifier:@"AddDinDan"];
    
    changyongController.khmodel=_khmodel;
    changyongController.state=@"1";
    [self.navigationController pushViewController:changyongController animated:YES];
 
    
}
- (IBAction)subPress:(id)sender {
     [AlertHelper MBHUDShow:@"下单中..." ForView:self.view AndDelayHid:30];
    [XiaDanWebAPI addPaperBoardTempOrderToBoardOrderWithPBID:_khmodel.PBDO_Id Suecss:^(NSArray *arr) {
        [AlertHelper hideAllHUDsForView:self.view];
        //   (@"AAAA________%@#",arr);
        if ([[arr[0] objectForKey:@"bool"]integerValue]==1) 
        {
            [AlertHelper singleMBHUDShow:@"订单确认成功" ForView:self.view AndDelayHid:1];
            NSObject<CommonNotification> *tmpDele=self.refreshNotification;
            [tmpDele refreshingDataList];
            [self.navigationController popViewControllerAnimated:YES];
            
            
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    DingDanDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DingDanDetailCell"];
    if (!cell) {
        NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"DingDanDetailCell" owner:nil options:nil];
        cell= [nibView lastObject];
        
    }
    cell.PBDO_start_tm.text=_khmodel.PBDO_start_tm;
    cell.PBDO_Width.text=_khmodel.PBDO_Width;
    cell.PBDO_Long.text=_khmodel.PBDO_Long;
    cell.PBDO_BuyCode.text=_khmodel.PBDO_BuyCode;
    cell.PBDO_OrderCode.text=_khmodel.PBDO_OrderCode;
    cell.PBDO_PaperNumber.text=_khmodel.PBDO_PBNm;
    cell.PBDO_I_PmNm.text=_khmodel.PBDO_I_PmNm;
    cell.PBDO_II_PmNm.text=_khmodel.PBDO_II_PmNm;
    cell.PBDO_III_PmNm.text=_khmodel.PBDO_III_PmNm;
    cell.PBDO_IV_PmNm.text=_khmodel.PBDO_IV_PmNm;
    cell.PBDO_V_PmNm.text=_khmodel.PBDO_V_PmNm;
    cell.PBDO_VI_PmNm.text=_khmodel.PBDO_VI_PmNm;
    cell.PBDO_VII_PmNm.text=_khmodel.PBDO_VII_PmNm;
    cell.PBDO_BuyNum.text=_khmodel.PBDO_BuyNum;
    cell.PBDO_I_line.text=_khmodel.PBDO_I_line;
    cell.PBDO_II_line.text=_khmodel.PBDO_II_line;
    cell.PBDO_III_line.text=_khmodel.PBDO_III_line;
    cell.PBDO_IV_line.text=_khmodel.PBDO_IV_line;
    cell.PBDO_V_line.text=_khmodel.PBDO_V_line;
    cell.PBDO_VI_line.text=_khmodel.PBDO_VI_line;
    cell.PBDO_VII_line.text=_khmodel.PBDO_VII_line;
    cell.PBDO_VIII_line.text=_khmodel.PBDO_VIII_line;
    cell.PBDO_DeliveryTm.text=_khmodel.PBDO_DeliveryTm;
    cell.ProductionDescription.text=_khmodel.ProductionDescription;
    cell.DeliveryNote.text=_khmodel.DeliveryNote;
    
    cell.zhanghuName.text=@"";
    cell.yaxing.text=_khmodel.PBDO_PPTnm;
    cell.zhuyiNote.text=_khmodel.PBDO_Note;;
    cell.maoban.text=_khmodel.PBDO_Plate;
    
    if ([[User standartUserInfo].IsSinglePlant isEqualToString:@"1"]) {
        cell.PBDO_CmpNm.text=[User standartUserInfo].model.Jcmp_Nm;
    }
    else
    {
        cell.PBDO_CmpNm.text=_khmodel.PBDO_CmpNm;
    }
    
    
    return cell;

    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    

    return @"订单详情";

    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 555;

}
-(NSString *)substringWithAstring:(NSString *)str
{
    NSString *str1=@" ";
    NSRange range = [str rangeOfString:str1] ;
    NSString *time=[str substringToIndex:range.location];
    return time;
}

@end
