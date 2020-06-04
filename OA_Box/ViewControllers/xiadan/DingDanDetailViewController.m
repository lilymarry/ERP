//
//  DingDanDetailViewController.m
//  Re-OA
//
//  Created by admin on 16/4/26.
//  Copyright © 2016年 姜任鹏. All rights reserved.
//

#import "DingDanDetailViewController.h"
#import "XiaDanWebAPI.h"
#import "XiaDanFlowCell.h"
#import "XiaDanFlowModel.h"
#import "XiaDanDetailCell.h"
//#import "ShangBMapViewController.h"
#import "CarInMapViewController.h"
#import "DingDanDetailCell.h"
#import "TuiHuoViewController.h"
#import "AlertHelper.h"
#import "User.h"
@interface DingDanDetailViewController ()
{
  //  NSMutableArray *sectionData;
    NSMutableArray *liuchengArr;
    NSArray *flowArr;
}
@end

@implementation DingDanDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle=UITableViewCellAccessoryNone;
    liuchengArr=[NSMutableArray new];
    self.navigationItem.title=@"订单详情";
    
    [AlertHelper MBHUDShow:@"加载中..." ForView:self.view AndDelayHid:30];
    [XiaDanWebAPI getPapaerOrderLocusWithOrderCode:_khmodel.PBDO_OrderCode PBDO_CmpId:[User standartUserInfo].model.Jcmp_Id Suecss:^(NSArray *arr){
         [AlertHelper hideAllHUDsForView:self.view];
       //  NSLog(@"AAAA________%@#",arr);
        if ([[arr[0] objectForKey:@"bool"]integerValue]==1)
        {
        NSArray *da=arr[0][@"PaperBoardOrderState"];
        for (int i=0; i<da.count; i++) {
            XiaDanFlowModel *model=[[XiaDanFlowModel alloc]initWithDic:da[i]];
            [liuchengArr addObject:model];
        }
        
        
            [self.tableView reloadData];
        }
        else  if ([[arr[0] objectForKey:@"bool"]integerValue]==0)
        {
            [AlertHelper singleMBHUDShow:@"无数据" ForView:self.view AndDelayHid:1];
        }
            else
            {
                [AlertHelper singleMBHUDShow:@"网络错误" ForView:self.view AndDelayHid:1];
            }

        
        
        
    } fail:^(){
        [AlertHelper hideAllHUDsForView:self.view];
        [AlertHelper singleMBHUDShow:@"网络请求数据失败" ForView:self.view AndDelayHid:1];
    
    }];
    
    if ([_khmodel.isExist isEqualToString:@"7"]) {
        UIBarButtonItem  *but=[[UIBarButtonItem alloc]initWithTitle:@"退货单" style: UIBarButtonItemStylePlain target:self action:@selector(tuiHuoPress)];
        [self.navigationItem setRightBarButtonItem:but];
    }

}
-(void)tuiHuoPress
{

    TuiHuoViewController *tuihuo=    [[TuiHuoViewController  alloc]init];
    tuihuo.khmodel=_khmodel;
    [self.navigationController pushViewController:tuihuo animated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)setlabHidden:(NSString *)lab
{
    if (lab.length==0) {
        return YES;
    }
    else
    {
        return NO;
        
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==1) {
        return 1;
    }
    else
    {
        return liuchengArr.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (1==indexPath.section) {         //详情
        DingDanDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DingDanDetailCell"];
        if (!cell) {
            NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"DingDanDetailCell" owner:nil options:nil];
            cell= [nibView lastObject];
            
        }
        cell.PBDO_start_tm.text=_khmodel.PBDO_start_tm;
//
        
        if ([[User standartUserInfo].IsSinglePlant isEqualToString:@"1"]) {
           cell.PBDO_CmpNm.text=[User standartUserInfo].model.Jcmp_Nm;
        }
        else
        {
         cell.PBDO_CmpNm.text=_khmodel.PBDO_CmpNm;
        }

      
//        cell.PBDO_POST_Nm.text=_khmodel.PBDO_POST_Nm;
      // cell.PBDO_Long.text=[NSString stringWithFormat:@"%@mm x %@mm",_khmodel.PBDO_Long,_khmodel.PBDO_Width];
        cell.PBDO_Width.text=_khmodel.PBDO_Width;
         cell.PBDO_Long.text=_khmodel.PBDO_Long;
         cell.PBDO_BuyCode.text=_khmodel.PBDO_BuyCode;
        cell.PBDO_OrderCode.text=_khmodel.PBDO_OrderCode;
        
//        cell.PBDO_PBNm.text=_khmodel.PBDO_PBCorrugatedLine;
        
//        cell.PBDO_I_PmNm.hidden=[self setlabHidden:_khmodel.PBDO_I_PmNm];
//        cell.PBDO_II_PmNm.hidden=[self setlabHidden:_khmodel.PBDO_II_PmNm];
//        cell.PBDO_III_PmNm.hidden=[self setlabHidden:_khmodel.PBDO_III_PmNm];
//        cell.PBDO_IV_PmNm.hidden=[self setlabHidden:_khmodel.PBDO_IV_PmNm];
//        cell.PBDO_V_PmNm.hidden=[self setlabHidden:_khmodel.PBDO_V_PmNm];
//        cell.PBDO_VI_PmNm.hidden=[self setlabHidden:_khmodel.PBDO_VI_PmNm];
//        cell.PBDO_VII_PmNm.hidden=[self setlabHidden:_khmodel.PBDO_VII_PmNm];
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
        
//        cell.PBDO_PPTnm.text=_khmodel.PBDO_Plate;
        cell.PBDO_DeliveryTm.text=_khmodel.PBDO_DeliveryTm;
//      cell.PBDO_Note.text=_khmodel.PBDO_Note;
        cell.ProductionDescription.text=_khmodel.ProductionDescription;
        cell.DeliveryNote.text=_khmodel.DeliveryNote;
 
      //  cell.zhanghuName.text=@"万达商户";
        cell.zhanghuName.text=@"";
        cell.yaxing.text=_khmodel.PBDO_PPTnm;
        cell.zhuyiNote.text=_khmodel.PBDO_Note;;
        cell.maoban.text=_khmodel.PBDO_Plate;
        return cell;
    }
    
    else{
        
        XiaDanFlowCell *cell = [tableView dequeueReusableCellWithIdentifier:@"flowcell1"];
        if (!cell) {
            NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"XiaDanFlowCell" owner:nil options:nil];
            cell= [nibView lastObject];
        }
        
        XiaDanFlowModel *model = [liuchengArr objectAtIndex:indexPath.row];
        if (indexPath.row==liuchengArr.count-1) {
            cell.ima_stateView.image=[UIImage imageNamed:@"endcircle.png"];
            cell.lab_on.hidden=YES;
  
        }
        else
        {   cell.ima_stateView.image=[UIImage imageNamed:@"ingcircle.png"];
            cell.lab_on.hidden=NO;
            
        }
        cell.State.text=model.State;
        cell.Remark.text=model.Remark;
        cell.SetTime.text= [self substringWithAstring:model.SetTime];
        return cell;
    }
    return nil;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (0==indexPath.section) {
        
        XiaDanFlowModel *model = [liuchengArr objectAtIndex:indexPath.row];
        if(  [model.State isEqualToString:@"已发车"]&&(liuchengArr.count-1==indexPath.row))
        {
            
            
       
        NSString *carNam=  [self searchCarNum:model.Remark];
        if (carNam.length!=0) {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"XiaDan" bundle:[NSBundle mainBundle]];
            
            CarInMapViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"CarInMap"];
            //  controller.state=@"1";
            controller.carNum=carNam;
            controller.PBDO_CmpId=_khmodel.PBDO_CmpId;
            [self.navigationController pushViewController:controller animated:YES];
        }
        }}
    
}
-(NSString *)searchCarNum:(NSString *)num
{
    NSString *str1=@"车牌号：";
    NSRange range = [num rangeOfString:str1] ;
    if ( range.location != NSNotFound)
    {
        NSString *   string = [num substringFromIndex:range.length+range.location];
        return string;
    }
    return nil;
//    NSString *time=[str substringToIndex:range.location];


}
//-(NSString *)getCont:(XiaDanFlowModel *)mode
//{
//    NSMutableString *str=[NSMutableString string];
//    [str appendFormat:@"%@ %@",mode.POL_Yi_Tit,mode.POL_Yi_Con ];
//    [str appendString:@"\n"];
//    [str appendFormat:@"%@ %@",mode.POL_Er_Tit,mode.POL_Er_Tit ];
//    [str appendString:@"\n"];
//    [str appendFormat:@"%@ %@",mode.POL_San_Tit,mode.POL_San_Con];
//
//    return str;
//
//}
//-(NSMutableString *)flowContentWithArr:(NSArray *)arr
//{
//    
//    NSMutableString *str=[NSMutableString string];
//    for (int i=0; i<arr.count; i++) {
//        [str appendString:arr[i][@"olt"] ];
//        [str appendString:@"  "];
//        [str appendString:arr[i][@"olc"] ];
//        
//        if (i!=arr.count-1) {
//            [str appendString:@"\n"];
//        }
//        
//    }
//    return str;
//    
//}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if (0==section) {
        return @"状态信息";
    }
    else
    {
        return @"订单详情";}
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (1==indexPath.section) {
        return 555;
    }
    else
    {
        return 74;}
}
-(NSString *)substringWithAstring:(NSString *)str
{
    NSString *str1=@" ";
    NSRange range = [str rangeOfString:str1] ;
    NSString *time=[str substringToIndex:range.location];
    return time;
}

@end
