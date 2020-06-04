//
//  AddDingdanViewController.m
//  Re-OA
//
//  Created by admin on 15/8/12.
//  Copyright (c) 2015年 姜任鹏. All rights reserved.
//

#import "AddDingdanViewController.h"
//#import "ToCompanyViewController.h"
#import "ChooseDateView.h"
#import  "SelectPIckView.h"
#import "XiaDanWebAPI.h"
#import "AlertHelper.h"
//#import "YaXingWebAPI.h"
#import "User.h"
@interface AddDingdanViewController ()<RenWuDateChooseDelegate,okButtonDelegate,UITextFieldDelegate,UIActionSheetDelegate>
{
    ChooseDateView *ch_deDay;
    NSString *date_24;
    SelectPIckView *select;
    SelectPIckView *select1;
    SelectPIckView *select2;
    SelectPIckView *select3;
    SelectPIckView *select4;
    SelectPIckView *select5;
    SelectPIckView *select6;
    SelectPIckView *select7;
    SelectPIckView *yaxingView;
    NSArray *data;
    NSArray *mainData;
    NSArray *czData;
    NSArray *lengData;
    NSDictionary *cengData;
    NSMutableArray *yaxingArr;
    NSString *zhizhiId;
    
    NSString *pmid1;
    NSString *pmid2;
    NSString *pmid3;
    NSString *pmid4;
    NSString *pmid5;
    NSString *pmid6;
    NSString *pmid7;
    NSString *yaxingid;
    
    NSString *PB_Id;
    NSString *PB_Nm;
    NSString * PB_CorrugatedLine;
    NSString *pmcode1;
    NSString *pmcode2;
    NSString *pmcode3;
    NSString *pmcode4;
    NSString *pmcode5;
    NSString *pmcode6;
    NSString *pmcode7;
    
    NSString *comPanId;
    NSString *comPanName;
    NSDictionary *Caidic;
     BOOL isEdit;
    
    
}

@property (weak, nonatomic) IBOutlet UITextField *tf_caigoudandiam;
@property (weak, nonatomic) IBOutlet UITextField *tf_zhizhi;
@property (weak, nonatomic) IBOutlet UITextField *tf_deday;
@property (weak, nonatomic) IBOutlet UILabel *la_jiaji;
@property (weak, nonatomic) IBOutlet UILabel *la_kehuName;

@property (weak, nonatomic) IBOutlet UIView *view_zhizhi;
@property (weak, nonatomic) IBOutlet UILabel *lab_1;
@property (weak, nonatomic) IBOutlet UILabel *lab_2;
@property (weak, nonatomic) IBOutlet UILabel *lab_3;
@property (weak, nonatomic) IBOutlet UILabel *lab_4;
@property (weak, nonatomic) IBOutlet UILabel *lab_5;
@property (weak, nonatomic) IBOutlet UILabel *lab_6;
@property (weak, nonatomic) IBOutlet UILabel *lab_7;
@property (weak, nonatomic) IBOutlet UITextField *tf_1;
@property (weak, nonatomic) IBOutlet UITextField *tf_2;
@property (weak, nonatomic) IBOutlet UITextField *tf_3;
@property (weak, nonatomic) IBOutlet UITextField *tf_4;
@property (weak, nonatomic) IBOutlet UITextField *tf_5;
@property (weak, nonatomic) IBOutlet UITextField *tf_6;
@property (weak, nonatomic) IBOutlet UITextField *tf_7;
@property (weak, nonatomic) IBOutlet UIImageView *imaV_1;
@property (weak, nonatomic) IBOutlet UIImageView *imaV_2;
@property (weak, nonatomic) IBOutlet UIImageView *imaV_3;
@property (weak, nonatomic) IBOutlet UIImageView *imaV_4;
@property (weak, nonatomic) IBOutlet UIImageView *imaV_5;
@property (weak, nonatomic) IBOutlet UIImageView *imaV_6;
@property (weak, nonatomic) IBOutlet UIImageView *imaV_7;


@property (weak, nonatomic) IBOutlet UIView *view_intro;
@property (weak, nonatomic) IBOutlet UITextField *tf_wide;
@property (weak, nonatomic) IBOutlet UITextField *tf_long;
@property (weak, nonatomic) IBOutlet UITextField *tf_num;
@property (weak, nonatomic) IBOutlet UITextField *tf_yaxing;
@property (weak, nonatomic) IBOutlet UITextField *tf_yxl;
@property (weak, nonatomic) IBOutlet UITextField *tf_yx2;
@property (weak, nonatomic) IBOutlet UITextField *tf_yx3;
@property (weak, nonatomic) IBOutlet UITextField *tf_yx4;
@property (weak, nonatomic) IBOutlet UITextField *tf_yx5;
@property (weak, nonatomic) IBOutlet UITextField *tf_yx6;
@property (weak, nonatomic) IBOutlet UITextField *tf_yx7;
@property (weak, nonatomic) IBOutlet UITextField *tf_yx8;
@property (weak, nonatomic) IBOutlet UILabel *la_yaxingNum;
@property (weak, nonatomic) IBOutlet UIButton *btn_jingban;
@property (weak, nonatomic) IBOutlet UIButton *btn_maoBan;
@property (weak, nonatomic) IBOutlet UITextField *tf_shixiang;
- (IBAction)jingbanPress:(id)sender;
- (IBAction)maobanPress:(id)sender;

//@property (weak, nonatomic) IBOutlet UITextField *tf_shuoming;
//
//
//@property (weak, nonatomic) IBOutlet UITextField *tf_zhiLong;
//@property (weak, nonatomic) IBOutlet UITextField *tf_zhiWide;
//@property (weak, nonatomic) IBOutlet UITextField *tf_zhiheigth;
//
@property (weak, nonatomic) IBOutlet UITableViewCell *zhizhiCell;



@end

@implementation AddDingdanViewController
- (IBAction)submit:(id)sender {
    UIActionSheet *sheet=[[UIActionSheet alloc]initWithTitle:@"选取操作" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"提交" otherButtonTitles:nil, nil];
    sheet.delegate=self;
    
    [sheet showInView:self.view];
    
    
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex==0)
    {
        if (_tf_zhizhi.text<=0) {
            [AlertHelper singleMBHUDShow:@"没有选择楞型" ForView:self.view AndDelayHid:1];
  
        }
        else if([self caizhiNull])
        {
            [AlertHelper singleMBHUDShow:@"材质没有选全" ForView:self.view AndDelayHid:1];
        }
        
        else
        {
          [self faBuPress];
        }
        
    }
    
    
    
}
//-(BOOL)caizhiNull
//{
//    NSMutableArray *dat=[NSMutableArray array];
//    NSArray *arr=[NSArray arrayWithObjects:_lab_1,_lab_2,_lab_3,_lab_4,_lab_5,_lab_6,_lab_7, nil];
//    for (UILabel *lab in arr ) {
//        if (lab.hidden==NO )
//        {
//            [dat addObject:lab];
//        }
//    }
//    
//    for (UILabel *labb in dat ) {
//        if (labb.text.length==0)
//        {  return YES;
//            break;
//            
//        }
//        
//    }
//    return NO;
//}

-(NSString *)stringNullWithString:(NSString *)str
{
    if (str.length==0)
    {
        return @"";
    }
    else
    {
        return str;
        
    }
}
-(bool)sumWithYaXian
{
    double num =[_tf_yxl.text doubleValue]+[_tf_yx2.text doubleValue]+[_tf_yx3.text doubleValue]+[_tf_yx4.text doubleValue]+[_tf_yx5.text doubleValue]+[_tf_yx6.text doubleValue]+[_tf_yx7.text doubleValue]+[_tf_yx8.text doubleValue];
   
    if (_tf_wide.text.length!=0) {
        if (num!=[_tf_wide.text doubleValue]) {
          
            return NO;
        }
        else
        {
            return YES;

        }
    }
    else
    {
       return YES;
    }
}
-(void)faBuPress
{
    
    if ( [self sumWithYaXian]) {
        
 
    
    pmid1=[self stringNullWithString:pmid1];
    pmid2=[self stringNullWithString:pmid2];
    pmid3=[self stringNullWithString:pmid3];
    pmid4=[self stringNullWithString:pmid4];
    pmid5=[self stringNullWithString:pmid5];
    pmid6=[self stringNullWithString:pmid6];
    pmid7=[self stringNullWithString:pmid7];
    NSString *banxing;
    if (_btn_jingban.selected) {
        banxing=@"净板";
    }
    else
    {
      banxing=@"毛板";
    }
    NSMutableString *str=[NSMutableString string];
    if (pmcode1.length!=0) {
        [str appendString:pmcode1];

    }
    if (pmcode2.length!=0) {
        [str appendString:pmcode2];
        
    }
    if (pmcode3.length!=0) {
        [str appendString:pmcode3];
        
    }
    if (pmcode4.length!=0) {
        [str appendString:pmcode4];
        
    }
    if (pmcode5.length!=0) {
        [str appendString:pmcode5];
        
    }
    if (pmcode6.length!=0) {
        [str appendString:pmcode6];
        
    }
    if (pmcode7.length!=0) {
        [str appendString:pmcode7];
        
    }
     [str appendString:@"("];
     [str appendString:PB_CorrugatedLine];
     [str appendString:@")"];
    

    
    [AlertHelper MBHUDShow:@"加载中..." ForView:self.view AndDelayHid:30];
    [XiaDanWebAPI addPaperOrderCmgt_Id: [User standartUserInfo].Cmgt_Id  Cmgt_Name:[[NSUserDefaults standardUserDefaults] objectForKey:@"username"]  PBDO_CmpId:comPanId PBDO_CmpNm:comPanName PBDO_POST_Key:@"" PBDO_POST_Nm:@"" PBDO_BuyCode:_tf_caigoudandiam.text PBDO_PBId:PB_Id PBDO_PBNm:PB_Nm      PBDO_I_PmId:pmid1      PBDO_I_PmNm:_tf_1.text
                           PBDO_II_PmId:pmid2    PBDO_II_PmNm:_tf_2.text
                          PBDO_III_PmId:pmid3  PBDO_III_PmNm:_tf_3.text
                           PBDO_IV_PmId:pmid4   PBDO_IV_PmNm:_tf_4.text
                            PBDO_V_PmId:pmid5     PBDO_V_PmNm:_tf_5.text
                           PBDO_VI_PmId:pmid6    PBDO_VI_PmNm:_tf_6.text
                          PBDO_VII_PmId:pmid7   PBDO_VII_PmNm:_tf_7.text
                              PBDO_Long:_tf_long.text PBDO_Width:_tf_wide.text PBDO_BuyNum:_tf_num.text PBDO_I_line:_tf_yxl.text PBDO_II_line:_tf_yx2.text PBDO_III_line:_tf_yx3.text PBDO_IV_line:_tf_yx4.text PBDO_V_line:_tf_yx5.text PBDO_VI_line:_tf_yx6.text PBDO_VII_line:_tf_yx6.text PBDO_VIII_line:_tf_yx8.text PBDO_PPTid:yaxingid PBDO_PPTnm:_tf_yaxing.text PBDO_DeliveryTm:_tf_deday.text PBDO_Note:_tf_shixiang.text PBDO_start_tm:@"" PBDO_over_tm:@"" PBDO_ClientNmAbbreviation:[User standartUserInfo].Cmgt_CmpNmAbbreviation
                         PBDO_OrderCode:@"" PBDO_PBCorrugatedLine:PB_CorrugatedLine
                            PBDO_Plate:banxing PBDO_PaperNumber:str  ProductionDescription:@"" DeliveryNote:@"" PBDO_Id:@""
  Suecss: ^(NSArray *arr){
                                  [AlertHelper hideAllHUDsForView:self.view];
                                if ([[arr[0] objectForKey:@"bool"]integerValue]==1)
                                 {
                                     [AlertHelper singleMBHUDShow:@"上传成功" ForView:self.view AndDelayHid:1];
                                     [self.navigationController popViewControllerAnimated:YES];

                                 }
                                 else
                                 {
                                    [AlertHelper singleMBHUDShow:@"上传失败" ForView:self.view AndDelayHid:1];
                                 }
             //  NSLog(@"WWWWW %@",arr);
           } fail:^(){
             [AlertHelper hideAllHUDsForView:self.view];
               [AlertHelper singleMBHUDShow:@"网络请求数据失败" ForView:self.view AndDelayHid:1];
           }];
    }
    else
    {
        UIAlertView *alert=[[UIAlertView  alloc]initWithTitle:@"提示" message:@"线宽需等于压线和" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
}
-(int)sumWithtextfeild
{
    double num=[_tf_yxl.text doubleValue]+[_tf_yx2.text doubleValue]+[_tf_yx3.text doubleValue]+[_tf_yx4.text doubleValue]
    +[_tf_yx5.text doubleValue]+[_tf_yx6.text doubleValue]+[_tf_yx7.text doubleValue] +[_tf_yx8.text doubleValue];
    return (int)num;
    
    
}
-(void)getData
{
    //板型名称
    [XiaDanWebAPI getPaper_BoardWithJcmp_Id:comPanId Suecss:^(NSArray *arr){
      //  NSLog(@"AAAAAA %@",arr);
        
        data=arr[0][@"Paper_Board"];
        NSMutableArray *daArr=[NSMutableArray array];
        
        for (int i=0; i<[data count]; i++)
        {
            [daArr addObject:  data[i][@"PB_Nm"] ];
            
            if ([_state isEqualToString:@"1"]) {
                if(   [ data[i][@"PB_Id"]isEqualToString:PB_Id])
                       {
                       
                           [ self setzhizhiModel :data[i] ];
                           
                         //  pmid1.length!=0
                           
                       }
            }
        }
       
        select.dataArr=daArr;
        
    } fail:^(){}];
   
    pmid1=[self stringNullWithString:pmid1];
    pmid2=[self stringNullWithString:pmid2];
    pmid3=[self stringNullWithString:pmid3];
    pmid4=[self stringNullWithString:pmid4];
    pmid5=[self stringNullWithString:pmid5];
    pmid6=[self stringNullWithString:pmid6];
    pmid7=[self stringNullWithString:pmid7];
    
    [XiaDanWebAPI getPaper_MaterialWithJcmp_Id:comPanId Suecss:^(NSArray *arr){
        
        czData=arr[0][@"Paper_Material"];
        NSMutableArray *daArr=[NSMutableArray array];
        
        for (int i=0; i<[czData count]; i++)
        {
            [daArr addObject:  czData[i][@"PM_Nm"] ];
            
            if ([_state isEqualToString:@"1"]) {
                
                if ( [czData[i][@"PM_Id"]  isEqualToString:pmid1]) {
                    pmcode1=czData[i][@"PM_Code"];
                }
               else if ( [czData[i][@"PM_Id"]  isEqualToString:pmid2]) {
                    pmcode2=czData[i][@"PM_Code"];
                }
               else if ( [czData[i][@"PM_Id"]  isEqualToString:pmid3]) {
                   pmcode3=czData[i][@"PM_Code"];
               }
               else if ( [czData[i][@"PM_Id"]  isEqualToString:pmid4]) {
                   pmcode4=czData[i][@"PM_Code"];
               }
               else if ( [czData[i][@"PM_Id"]  isEqualToString:pmid5]) {
                   pmcode5=czData[i][@"PM_Code"];
               }
               else if ( [czData[i][@"PM_Id"]  isEqualToString:pmid6]) {
                   pmcode6=czData[i][@"PM_Code"];
               }
               else if ( [czData[i][@"PM_Id"]  isEqualToString:pmid7]) {
                   pmcode7=czData[i][@"PM_Code"];
               }
               else{
               }
            }
 
            
        }
        select1.dataArr=daArr;
        select2.dataArr=daArr;
        select3.dataArr=daArr;
        select4.dataArr=daArr;
        select5.dataArr=daArr;
        select6.dataArr=daArr;
        select7.dataArr=daArr;
        
        
        
    } fail:^(){}];
    
    [XiaDanWebAPI getgetPaper_PressureWithJcmp_Id:comPanId Suecss:^(NSArray *arr){
   
            
            yaxingArr=arr[0][@"Paper_Pressure_Type"];
            NSMutableArray *yaArr=[NSMutableArray array];
            for (int i=0; i<yaxingArr.count; i++) {
                [yaArr addObject:yaxingArr[i][@"PPT_Nm"] ];
            }
            yaxingView.dataArr=yaArr;
    
        
    } fail:^(){}];


}

- (void)viewDidLoad {
    [super viewDidLoad];
    _la_jiaji.hidden=YES;
  
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapScroll)];
    [self.tableView addGestureRecognizer:tap];
    
    ch_deDay = [ChooseDateView instanceChooseDateView];
    ch_deDay.chooseDateDelegate=self;
    ch_deDay.dateId=@"1";
    _tf_deday.inputView=ch_deDay;
    
    
    NSDate *dates = [NSDate date];
    NSDateFormatter *formatter =  [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/beijing"];
    [formatter setTimeZone:timeZone];
    NSString *loctime = [formatter stringFromDate:dates];
    _tf_deday.text=loctime;
    
    
    select=[[SelectPIckView alloc]initWithFrame:CGRectMake(0, 377,   self.view.frame.size.width, 166)];
    select.state=0;
    select.delegate=self;
    self.tf_zhizhi.inputView=select;
       
    select1=[[SelectPIckView alloc]initWithFrame:CGRectMake(0, 377,   self.view.frame.size.width, 166)];
    select2=[[SelectPIckView alloc]initWithFrame:CGRectMake(0, 377,   self.view.frame.size.width, 166)];
    select3=[[SelectPIckView alloc]initWithFrame:CGRectMake(0, 377,   self.view.frame.size.width, 166)];
    select4=[[SelectPIckView alloc]initWithFrame:CGRectMake(0, 377,   self.view.frame.size.width, 166)];
    select5=[[SelectPIckView alloc]initWithFrame:CGRectMake(0, 377,   self.view.frame.size.width, 166)];
    select6=[[SelectPIckView alloc]initWithFrame:CGRectMake(0, 377,   self.view.frame.size.width, 166)];
    select7=[[SelectPIckView alloc]initWithFrame:CGRectMake(0, 377,   self.view.frame.size.width, 166)];
    
    select1.state=1;
    select1.delegate=self;
    self.tf_1.inputView=select1;
    
    select2.state=2;
    select2.delegate=self;
    self.tf_2.inputView=select2;
    
    select3.state=3;
    select3.delegate=self;
    self.tf_3.inputView=select3;
    
    select4.state=4;
    select4.delegate=self;
    self.tf_4.inputView=select4;
    
    select5.state=5;
    select5.delegate=self;
    self.tf_5.inputView=select5;
    
    select6.state=6;
    select6.delegate=self;
    self.tf_6.inputView=select6;
    
    select7.state=7;
    select7.delegate=self;
    self.tf_7.inputView=select7;
    yaxingid=@"";
       
    yaxingView=[[SelectPIckView alloc]initWithFrame:CGRectMake(0, 377,   self.view.frame.size.width, 166)];
    yaxingView.state=8;
    yaxingView.delegate=self;
    self.tf_yaxing.inputView=yaxingView;
    

    
    if ([_state isEqualToString:@"0"]) {
        self.navigationItem.title=@"下单";
     
        comPanName= _model.Jcmp_Nm;
        comPanId=  _model.Jcmp_Id;
        _btn_maoBan.selected=YES;

        
        
        
    }
    else
    {
        self.navigationItem.title=@"修改订单";

         comPanId=  _khmodel.PBDO_CmpId;
         comPanName =_khmodel.PBDO_CmpNm;
        _tf_caigoudandiam.text=_khmodel.PBDO_BuyCode;
        
        _tf_zhizhi.text=_khmodel.PBDO_PBNm;
         PB_Id=_khmodel.PBDO_PBId;
        
        pmid1=_khmodel.PBDO_I_PmId;
        _tf_1.text=_khmodel.PBDO_I_PmNm;
      //  _khmodel.PBDO_PaperNumber
        
        
        pmid2=_khmodel.PBDO_II_PmId;
        _tf_2.text=_khmodel.PBDO_II_PmNm;

        pmid3=_khmodel.PBDO_III_PmId;
        _tf_3.text=_khmodel.PBDO_III_PmNm;

        pmid4=_khmodel.PBDO_IV_PmId;
        _tf_4.text=_khmodel.PBDO_IV_PmNm;

        pmid5=_khmodel.PBDO_V_PmId;
        _tf_5.text=_khmodel.PBDO_V_PmNm;

        pmid6=_khmodel.PBDO_VI_PmId;
        _tf_6.text=_khmodel.PBDO_VI_PmNm;

        pmid7=_khmodel.PBDO_VII_PmId;
        _tf_7.text=_khmodel.PBDO_VII_PmNm;
        
        _tf_wide.text=_khmodel.PBDO_Width;
        _tf_long.text=_khmodel.PBDO_Long;
        _tf_num.text=_khmodel.PBDO_BuyNum;
        _tf_deday.text=_khmodel.PBDO_DeliveryTm;
        
        _tf_yxl.text=_khmodel.PBDO_I_line;
        
        _tf_yx2.text=_khmodel.PBDO_II_line;
        _tf_yx3.text=_khmodel.PBDO_III_line;
        _tf_yx4.text=_khmodel.PBDO_IV_line;
        _tf_yx5.text=_khmodel.PBDO_V_line;
        _tf_yx6.text=_khmodel.PBDO_VI_line;
        _tf_yx7.text=_khmodel.PBDO_VII_line;
        _tf_yx8.text=_khmodel.PBDO_VIII_line;
        
        _tf_yaxing.text=_khmodel.PBDO_PPTnm;
         yaxingid=_khmodel.PBDO_PPTid;
        if ([_khmodel. PBDO_Plate isEqualToString:@"毛板"]) {
            _btn_maoBan.selected=YES;
        }
        else
        {
            _btn_jingban.selected=YES;

        
        }
        _tf_shixiang.text=_khmodel.PBDO_Note;
       //  [self getData];

      

        
    }
    [self getData];

    @try {
        
    } @catch (NSException *exception) {
        [AlertHelper singleMBHUDShow:@"无数据！" ForView:self.view AndDelayHid:2];
        
        
    } @finally {
    }
    

     _la_kehuName.text=comPanName;
   
 //  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(presentKeyBoard:) name:UIKeyboardWillShowNotification object:nil];
}
-(NSString *)getCaizhiWithStr:(NSString *)str
{
    return nil;
}
- (void)presentKeyBoard:(NSNotification *)notif {
    
    //取得键盘的高度
NSArray *ViewArr=[self.tableView subviews];
    for (UIView  *view in ViewArr) {
        if ([view isKindOfClass:[UITextField class]]) {
      UITextField *feild=      (UITextField *) view;
            if (feild.tag>1000) {
                NSValue *value = [notif.userInfo objectForKey:UIKeyboardBoundsUserInfoKey];
                //NSValue->CGRect
                CGRect rect = [value CGRectValue];
                CGFloat height = CGRectGetHeight(rect);
                
                [UIView animateWithDuration:0.25 animations:^{
                    
                    //  _view.transform = CGAffineTransformMakeTranslation(0, -height);
                    self.tableView.transform = CGAffineTransformMakeTranslation(0, -height);
                    
                }];

            }
        }
    }
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
  //  if (textField.tag>1000) {
        
    
    CGRect frame=self.tableView.frame;
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
   // CGFloat height =  window.frame.size.height;
   if (!isEdit)
    {
       frame.origin.y-= window.frame.size.height==568?130:158;
        [UIView animateWithDuration:0.5f animations:^{
            self.tableView.frame=frame;
        }];
    }
    isEdit=YES;
//    
//    NSValue *value = [notif.userInfo objectForKey:UIKeyboardBoundsUserInfoKey];
//    //NSValue->CGRect
//    CGRect rect = [value CGRectValue];
//    CGFloat height = CGRectGetHeight(rect);
    
//    [UIView animateWithDuration:0.25 animations:^{
//        
//        //  _view.transform = CGAffineTransformMakeTranslation(0, -height);
//        self.tableView.transform = CGAffineTransformMakeTranslation(0, -height);
//        
//    }];
  //  }

}
-(void)chooseTheDate:(NSString *)dateStr withId:(NSString *)dateid {
    

    _tf_deday.text= dateStr;

    [_tf_deday resignFirstResponder];
    [self  tapScroll];

}
-(NSString *)exchangeCaizhiName :(NSString *)oldName
{
    if ([oldName isEqualToString:@"MIAN"])
    {
        return @"面";
        
    }
    else   if ([oldName isEqualToString:@"XIN"])
    {
        return @"芯";
        
    }
    else if ([oldName isEqualToString:@"LENG"])
    {
        return @"楞";
    }
    else if ([oldName isEqualToString:@"LI"])
    {
        return @"里";
    }
    else
    {
        return  @"未设置";
        
    }
}
-(NSString *)setviewImage:(NSString *)str
{
    if ([str isEqualToString:@"面"]) {
        
        return  @"ic_mian.png";
        
        
    }
    
    else if([str isEqualToString:@"芯"])
    {
        
        return  @"ic_xin.png";
        
        
    }
    
    else if([str isEqualToString:@"里"])
    {
        
        return @"ic_li.png" ;
        
    }
    else if ([str isEqualToString:@"楞"])
    {
        
        return  @"ic_leng.png";
    }
    else
    {
        return @"";
    }
    
}
-(BOOL)settextFeildHidden:(NSString *)str
{
    if (![str isEqualToString:@"未设置"])
    {
        return NO;
    }
    else
    {
        return  YES;
    }
    
    
}
-(BOOL)searchLeng:(NSString *)str
{
    if ([str isEqualToString:@"楞"]) {
        return YES;
    }
    else
    {
        return NO;
    }
    
    
}

-(void)setzhizhiModel:(NSDictionary *)dic{
   
    PB_Id=dic[@"PB_Id"];
    PB_Nm=dic[@"PB_Nm"];
    PB_CorrugatedLine=dic[@"PB_CorrugatedLine"];
    
   // NSLog(@"QQQ__ %@",dic[@"PB_I_Way"]);
    NSString *str1=[self exchangeCaizhiName:dic[@"PB_I_Way"]];
   // NSLog(@"QQQ__ %@",str1);
    NSString *str2=[self exchangeCaizhiName:dic[@"PB_II_Way"]];
    NSString *str3=[self exchangeCaizhiName:dic[@"PB_III_Way"]];
    NSString *str4=[self exchangeCaizhiName:dic[@"PB_IV_Way"]];
    NSString *str5=[self exchangeCaizhiName:dic[@"PB_V_Way"]];
    NSString *str6=[self exchangeCaizhiName:dic[@"PB_VI_Way"]];
    NSString *str7=[self exchangeCaizhiName:dic[@"PB_VII_Way"]];
     NSLog(@"2QQQ__ %@",str2);
     NSLog(@"3QQQ__ %@",str3);
     NSLog(@"4QQQ__ %@",str4);
     NSLog(@"5QQQ__ %@",str5);
     NSLog(@"6QQQ__ %@",str6);
     NSLog(@"7QQQ__ %@",str7);
    int i=0;
    if (![str1 isEqualToString:@"未设置"]) {
        i++;
    }
    if (![str2 isEqualToString:@"未设置"]) {
        i++;
    }
    if (![str3 isEqualToString:@"未设置"]) {
        i++;
    }
    if (![str4 isEqualToString:@"未设置"]) {
        i++;
    }
    if (![str5 isEqualToString:@"未设置"]) {
        i++;
    }
    if (![str6 isEqualToString:@"未设置"]) {
        i++;
    }
    if (![str7 isEqualToString:@"未设置"]) {
        i++;
    }
    _imaV_1.image=[UIImage imageNamed:[self setviewImage:str1]];
    _imaV_2.image=[UIImage imageNamed:[self setviewImage:str2]];
    _imaV_3.image=[UIImage imageNamed:[self setviewImage:str3]];
    _imaV_4.image=[UIImage imageNamed:[self setviewImage:str4]];
    _imaV_5.image=[UIImage imageNamed:[self setviewImage:str5]];
    _imaV_6.image=[UIImage imageNamed:[self setviewImage:str6]];
    _imaV_7.image=[UIImage imageNamed:[self setviewImage:str7]];
    
    _tf_1.hidden=[self settextFeildHidden:str1];
    _tf_2.hidden=[self settextFeildHidden:str2];
    _tf_3.hidden=[self settextFeildHidden:str3];
    _tf_4.hidden=[self settextFeildHidden:str4];
    _tf_5.hidden=[self settextFeildHidden:str5];
    _tf_6.hidden=[self settextFeildHidden:str6];
    _tf_7.hidden=[self settextFeildHidden:str7];
    
    _imaV_1.hidden=[self settextFeildHidden:str1];
    _imaV_2.hidden=[self settextFeildHidden:str2];
    _imaV_3.hidden=[self settextFeildHidden:str3];
    _imaV_4.hidden=[self settextFeildHidden:str4];
    _imaV_5.hidden=[self settextFeildHidden:str5];
    _imaV_6.hidden=[self settextFeildHidden:str6];
    _imaV_7.hidden=[self settextFeildHidden:str7];
    
    _lab_1.hidden=[self settextFeildHidden:str1];
    _lab_2.hidden=[self settextFeildHidden:str2];
    _lab_3.hidden=[self settextFeildHidden:str3];
    _lab_4.hidden=[self settextFeildHidden:str4];
    _lab_5.hidden=[self settextFeildHidden:str5];
    _lab_6.hidden=[self settextFeildHidden:str6];
    _lab_7.hidden=[self settextFeildHidden:str7];
    
    
    [_view_zhizhi setFrame:CGRectMake(0, 134, self.view.frame.size.width, 50*i+10)];
    _view_intro.frame=CGRectMake(0, 50*i+170,  self.view.frame.size.width, 400);
    
    
   
   

}
-(void)doButtonWithSelectRow:(NSString *)row state:(int)state selectRow:(int)selectrow
{
    
    switch (state)
    {
        case 0:
        {
            
            self.tf_zhizhi.text=row;
            [self.tf_zhizhi resignFirstResponder];
            @try {
            _tf_1.text=nil;
            _tf_2.text=nil;
            _tf_3.text=nil;
            _tf_4.text=nil;
            _tf_5.text=nil;
            _tf_6.text=nil;
            _tf_7.text=nil;
            NSDictionary *dic=data[selectrow];
          //  NSLog(@"qwqw %@",dic);
          //  XiaDanListModel *model=[[XiaDanListModel alloc]initWithDic:dic];
            [self setzhizhiModel:dic];
            }
                @catch (NSException *exception) {
                    [AlertHelper singleMBHUDShow:@"无数据！" ForView:self.view AndDelayHid:2];
                }
                @finally {
                    
                }
          

        }
            break;
        case 1:
        {
             _tf_1.text=[NSString stringWithFormat:@"%@",row];
            [_tf_1 resignFirstResponder];
             NSDictionary *dic=[czData objectAtIndex:selectrow];
             pmid1=dic[@"PM_Id"];
             pmcode1=dic[@"PM_Code"];
            
        }
            break;
        case 2:
        {
            _tf_2.text=[NSString stringWithFormat:@"%@",row];
            [_tf_2 resignFirstResponder];
            NSDictionary *dic=[czData objectAtIndex:selectrow];
            pmid2=dic[@"PM_Id"];
            pmcode2=dic[@"PM_Code"];
           

        }
            break;
        case 3:
        {
            _tf_3.text=[NSString stringWithFormat:@"%@",row];
            [_tf_3 resignFirstResponder];
            NSDictionary *dic=[czData objectAtIndex:selectrow];
            pmid3=dic[@"PM_Id"];
            pmcode3=dic[@"PM_Code"];
          
        }
            break;
        case 4:
        {
            _tf_4.text=[NSString stringWithFormat:@"%@",row];
            [_tf_4 resignFirstResponder];
            NSDictionary *dic=[czData objectAtIndex:selectrow];
            pmid4=dic[@"PM_Id"];
            pmcode4=dic[@"PM_Code"];
          
            
        }
            break;
        case 5:
        {
            _tf_5.text=[NSString stringWithFormat:@"%@",row];
            [_tf_5 resignFirstResponder];
            NSDictionary *dic=[czData objectAtIndex:selectrow];
            pmid5=dic[@"PM_Id"];
            pmcode5=dic[@"PM_Code"];
           
        }
            break;
        case 6:
        {
            _tf_6.text=[NSString stringWithFormat:@"%@",row];
            [_tf_6 resignFirstResponder];
            NSDictionary *dic=[czData objectAtIndex:selectrow];
            pmid6=dic[@"PM_Id"];
            pmcode6=dic[@"PM_Code"];
           
            
        }
            break;
        case 7:
        {
            _tf_7.text=[NSString stringWithFormat:@"%@",row];
            [_tf_7 resignFirstResponder];
            NSDictionary *dic=[czData objectAtIndex:selectrow];
            pmid7=dic[@"PM_Id"];
            pmcode7=dic[@"PM_Code"];
           

        }
            break;
        case 8:
        {
            @try {
                
            }
            @catch (NSException *exception) {
                [AlertHelper singleMBHUDShow:@"无数据！" ForView:self.view AndDelayHid:2];
            }
            @finally {
                _tf_yaxing.text=[NSString stringWithFormat:@"%@",row];
                [_tf_yaxing resignFirstResponder];
                NSDictionary *dic=[yaxingArr objectAtIndex:selectrow];
                yaxingid=dic[@"PPT_Id"];
            }
           
      

        }
            break;
        default:{
//            [UIView animateWithDuration:.25 animations:^{
//                
//                self.tableView.transform = CGAffineTransformIdentity;
//            }];
//
        }
            break;
    }
    
    [self tapScroll];
    
}



- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    char X = [string UTF8String][0];
    
    if (X == '.') {
        //判断之前是否输入过'.'如果输入过，不让输入这个
        if ([textField.text rangeOfString:@"."].length == 1) {
            return NO;
        }
    }
    
    if (textField.tag == 2000)
    {
        
        //第一步、去除空格、
        NSString * str1 = textField.text;
        str1 = [str1 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        //第二步、更新新输入的数值.
        // if (textField == _tf_report) {
        NSMutableString * strs = [NSMutableString stringWithString:str1];
        [strs replaceCharactersInRange:range withString:string];
        str1 = strs;
        if (str1.length==0) {
            _la_yaxingNum.text=@"0";
        }
        _la_yaxingNum.text=str1;
      
        
        
        
    }
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
   if (textField.tag == 2000)
   {
       if ([textField.text isEqualToString: @"."]) {
           _la_yaxingNum.text=nil;
           _tf_wide.text=nil;
           
       }
       if ([textField.text hasPrefix:@"."]) {
           _la_yaxingNum.text=[NSString stringWithFormat:@"0%@",textField.text];
           _tf_wide.text=[NSString stringWithFormat:@"0%@",textField.text];

       }
   
   }
    CGRect frame=self.tableView.frame;
    if (!isEdit) {
        frame.origin.y=0;
        [UIView animateWithDuration:0.5f animations:^{
            self.tableView.frame=frame;
        }];
    }
}

-(void)tapScroll
{
   

     [_tf_deday resignFirstResponder];
     [_tf_zhizhi resignFirstResponder];
     [_tf_1 resignFirstResponder];
     [_tf_2 resignFirstResponder];
     [_tf_3 resignFirstResponder];
     [_tf_4 resignFirstResponder];
     [_tf_5 resignFirstResponder];
     [_tf_6 resignFirstResponder];
     [_tf_7 resignFirstResponder];
     [_tf_wide resignFirstResponder];
     [_tf_long resignFirstResponder];
     [_tf_num resignFirstResponder];
     [_tf_yaxing resignFirstResponder];
     [_tf_yxl resignFirstResponder];
     [_tf_yx2 resignFirstResponder];
     [_tf_yx3 resignFirstResponder];
     [_tf_yx4 resignFirstResponder];
     [_tf_yx5 resignFirstResponder];
     [_tf_yx6 resignFirstResponder];
     [_tf_yx7 resignFirstResponder];
     [_tf_yx8 resignFirstResponder];
     [_tf_caigoudandiam resignFirstResponder];
     [_tf_shixiang resignFirstResponder];
    
    CGRect frame=self.tableView.frame;
        frame.origin.y=0;
        [UIView animateWithDuration:0.5f animations:^{
            self.tableView.frame=frame;
        }];
    isEdit=NO;
 
 
  
    
}
-(BOOL)caizhiNull
{
    NSMutableArray *dat=[NSMutableArray array];
    NSArray *arr=[NSArray arrayWithObjects:_tf_1,_tf_2,_tf_3,_tf_4,_tf_5,_tf_6,_tf_7, nil];
    for (UITextField *lab in arr ) {
        if (lab.hidden==NO )
        {
            [dat addObject:lab];
        }
    }
    
    for (UITextField *la in dat ) {
        if ([la.text length]==0 )
        {  return YES;
            break;
            
        }
        
    }
    return NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)jingbanPress:(id)sender {
    UIButton *btn=(UIButton *)sender;
    if (btn.selected==NO)
    {
        btn.selected = YES;
        _btn_maoBan.selected = NO;

        
        
    }
    else
    {
        if (_btn_maoBan.selected!=NO)
        {
            btn.selected = NO;
        }
    }
  
}

- (IBAction)maobanPress:(id)sender {
    UIButton *btn=(UIButton *)sender;
    if (btn.selected==NO)
    {
        btn.selected = YES;
        _btn_jingban.selected = NO;

        
        
    }
    else
    {
        if (_btn_jingban.selected!=NO)
        {
            btn.selected = NO;
        }
    }

    
}
@end
