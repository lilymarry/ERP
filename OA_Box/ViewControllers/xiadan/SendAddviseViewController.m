//
//  SendAddviseViewController.m
//  OA_Box
//
//  Created by imac-1 on 2016/10/26.
//  Copyright © 2016年 魏艳丽. All rights reserved.
//

#import "SendAddviseViewController.h"
#import "ScreenHelper.h"
#import "XiaDanWebAPI.h"
#import "XiaDanFlowCell.h"
#import "XiaDanFlowModel.h"
#import "XiaDanDetailCell.h"
//#import "ShangBMapViewController.h"
#import "CarInMapViewController.h"
#import "DingDanDetailCell.h"
#import "XiaDanListModel.h"
#import "DingDaListViewController.h"
#import "User.h"
#import "AlertHelper.h"
@interface SendAddviseViewController ()
{
    UIView *otisView;
    NSMutableArray *liuchengArr;
    NSArray *flowArr;
    XiaDanListModel *_khmodel;

}
@property (weak, nonatomic) IBOutlet UITextView *text_cont;
@property (weak, nonatomic) IBOutlet UITableView *tabView;

@end

@implementation SendAddviseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tabView.hidden=YES;
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hiddenText)];
    [_tabView addGestureRecognizer:tap];
    _tabView.separatorStyle=UITableViewCellAccessoryNone;
    liuchengArr=[NSMutableArray new];
    
    // Do any additional setup after loading the view.
    
//  UITableView *  mTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 155, [ScreenHelper SCREEN_WIDTH], self.view.bounds.size.height-210)];
//    mTableView.backgroundColor = [UIColor clearColor];
//    mTableView.mDelegate = self;
//    mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    mTableView.mbMoreHidden = YES;
//    [self.view addSubview:mTableView];
    
//    otisView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [ScreenHelper SCREEN_WIDTH], 100)];
//    otisView.backgroundColor = [UIColor redColor];
//    otisView.userInteractionEnabled = YES;
//   // otisView.hidden = YES;
//    //    [self.view addSubview:otisView];
//    [_tabView setTableFooterView:otisView];
//    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.backgroundColor = [UIColor clearColor];
//    btn.frame = CGRectMake(0, 0, [ScreenHelper SCREEN_WIDTH], 100);
//    [btn setTitle:@"选择要反馈订单" forState:UIControlStateNormal];
//    //btn.center = CGPointMake(SCREEN_WIDTH*0.5, 60);
//    [btn addTarget:self action:@selector(AddDingDanDetai) forControlEvents:UIControlEventTouchUpInside];
//    [otisView addSubview:btn];
//    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake([ScreenHelper SCREEN_WIDTH]/2-22.5, 10, 45, 45)];
//    image.image = [UIImage imageNamed:@"caradd.png"];
//    // image.center = CGPointMake(SCREEN_WIDTH*0.25, 42.5);
//    [btn addSubview:image];
    
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake([ScreenHelper SCREEN_WIDTH]/2-80, 70, 160, 20)];
//    label.text = @"选择要反馈订单";
//    label.textAlignment = NSTextAlignmentCenter;
//    label.font = [UIFont systemFontOfSize:16];
//   // label.textColor = UIColorFromRGB(0x333333);
//    [btn addSubview:label];

}

-(void)hiddenText
{
    [_text_cont resignFirstResponder];

}
- (IBAction)AddDingDanDetai:(id)sender {
     [self.view endEditing:YES];
    UIStoryboard *s = [UIStoryboard storyboardWithName:@"XiaDan" bundle:[NSBundle mainBundle]];
    DingDaListViewController *changyongController = [s instantiateViewControllerWithIdentifier:@"DingDaList"];
    changyongController.dingDanState=@"1,2,3,4,5,6,7";
    changyongController.type=@"1";
    [self.navigationController pushViewController:changyongController animated:YES];

}
- (IBAction)btnPress:(id)sender {
        if (_text_cont.text.length==0) {
          [AlertHelper singleMBHUDShow:@"填写反馈意见" ForView:self.view AndDelayHid:1];
    }
    else if (_khmodel==nil)
    {
         [AlertHelper singleMBHUDShow:@"选择反馈订单号" ForView:self.view AndDelayHid:1];
    }
    else
    {
    [AlertHelper MBHUDShow:@"提交中..." ForView:self.view AndDelayHid:30];

   [ XiaDanWebAPI sendAddviseWithFB_Content:_text_cont.text FB_BoardOrderNum:_khmodel.PBDO_OrderCode FB_ClientMgmtId:[User standartUserInfo].Cmgt_Id FB_CmpId:_khmodel.PBDO_CmpId FB_CmpNm:_khmodel.PBDO_CmpNm Suecss:^(NSArray * arr) {
        [AlertHelper hideAllHUDsForView:self.view];
         if ([[arr[0] objectForKey:@"bool"]integerValue]==1)
         {
            [AlertHelper singleMBHUDShow:@"反馈成功" ForView:self.view AndDelayHid:1];
             NSObject<CommonNotification> *tmpDele=self.refreshNotification;
             [tmpDele refreshingDataList];
             [self.navigationController popViewControllerAnimated: YES];

          
         }
         else
         {
             [AlertHelper singleMBHUDShow:@"网络错误" ForView:self.view AndDelayHid:1];
         }
      // NSLog(@"AAA_ %@",arr);
    } fail:^{
        [AlertHelper hideAllHUDsForView:self.view];
        [AlertHelper singleMBHUDShow:@"网络请求数据失败" ForView:self.view AndDelayHid:1];
    }];
    }
}

-(void)viewWillAppear:(BOOL)animated
{  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tongzhi:) name:@"tongzhi" object:nil];
}
- (void)tongzhi:(NSNotification *)text{
   // NSLog(@"%@",text.userInfo[@"data"]);
  //  NSLog(@"－－－－－接收到通知------");
    _khmodel=text.userInfo[@"data"];
   // [self  getFlowData];
    _tabView.hidden=NO;
    [_tabView reloadData];

}
-(void)dealloc
{
  [[NSNotificationCenter defaultCenter] removeObserver:self];

}

-(void)getFlowData
{

    [XiaDanWebAPI getPapaerOrderLocusWithOrderCode:_khmodel.PBDO_OrderCode  PBDO_CmpId:[User standartUserInfo].Cmgt_Id Suecss:^(NSArray *arr){
    //    NSLog(@"AAAA________%@#",arr);
        NSArray *da=arr[0][@"PaperBoardOrderState"];
        for (int i=0; i<da.count; i++) {
            XiaDanFlowModel *model=[[XiaDanFlowModel alloc]initWithDic:da[i]];
            [liuchengArr addObject:model];
        }
        
        _tabView.hidden=NO;
        [_tabView reloadData];

    } fail:^(){}];


}
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    //#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
 //   if (section==1) {
        return 1;
//    }
//    else
//    {
//        return liuchengArr.count;
//    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (1==indexPath.section) {         //详情
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
        //        cell.PBDO_Note.text=_khmodel.PBDO_Note;
    cell.ProductionDescription.text=_khmodel.ProductionDescription;
    cell.DeliveryNote.text=_khmodel.DeliveryNote;
    
   // cell.zhanghuName.text=@"万达商户";
     cell.zhanghuName.text=@"";
    cell.yaxing.text=_khmodel.PBDO_PPTnm;
    cell.zhuyiNote.text=_khmodel.PBDO_Note;;
    cell.maoban.text=_khmodel.PBDO_Plate;
        return cell;
   // }
    
//    else{
//        
//        XiaDanFlowCell *cell = [tableView dequeueReusableCellWithIdentifier:@"flowcell1"];
//        if (!cell) {
//            NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"XiaDanFlowCell" owner:nil options:nil];
//            cell= [nibView lastObject];
//        }
//        
//        XiaDanFlowModel *model = [liuchengArr objectAtIndex:indexPath.row];
//        if (indexPath.row==liuchengArr.count-1) {
//            cell.ima_stateView.image=[UIImage imageNamed:@"endcircle.png"];
//            cell.lab_on.hidden=YES;
//            
//        }
//        else
//        {   cell.ima_stateView.image=[UIImage imageNamed:@"ingcircle.png"];
//            cell.lab_on.hidden=NO;
//            
//        }
//        cell.State.text=model.State;
//        cell.Remark.text=model.Remark;
//        cell.SetTime.text= [self substringWithAstring:model.SetTime];
//        return cell;
//    }
//    return nil;

}
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (0==indexPath.section) {
//        
//        XiaDanFlowModel *model = [liuchengArr objectAtIndex:indexPath.row];
//        NSString *carNam=  [self searchCarNum:model.Remark];
//        if (carNam.length!=0) {
//            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"XiaDan" bundle:[NSBundle mainBundle]];
//            
//            CarInMapViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"CarInMap"];
//            //  controller.state=@"1";
//            controller.carNum=carNam;
//            controller.PBDO_CmpId=_khmodel.PBDO_CmpId;
//            [self.navigationController pushViewController:controller animated:YES];
//        }
//    }
//    
//}
//-(NSString *)searchCarNum:(NSString *)num
//{
//    NSString *str1=@"车牌号：";
//    NSRange range = [num rangeOfString:str1] ;
//    if ( range.location != NSNotFound)
//    {
//        NSString *   string = [num substringFromIndex:range.length+range.location];
//        return string;
//    }
//    return nil;
//    //    NSString *time=[str substringToIndex:range.location];
//    
//    
//}
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
    
//    if (0==section) {
//        return @"状态信息";
//    }
//    else
//    {
        return @"订单详情";
//}

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   // if (1==indexPath.section) {
        return 555;
//    }
//    else
//    {
//        return 74;}
}
-(NSString *)substringWithAstring:(NSString *)str
{
    NSString *str1=@" ";
    NSRange range = [str rangeOfString:str1] ;
    NSString *time=[str substringToIndex:range.location];
    return time;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
