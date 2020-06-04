//
//  AddDinDanViewController.m
//  OA_Box
//
//  Created by imac-1 on 2016/11/21.
//  Copyright © 2016年 魏艳丽. All rights reserved.
//

#import "AddDinDanViewController.h"
#import "ChooseDateView.h"
#import  "SelectPIckView.h"
#import "XiaDanWebAPI.h"
#import "AlertHelper.h"
//#import "YaXingWebAPI.h"
#import "User.h"
#import "ScreenHelper.h"
#import "DingDaListViewController.h"
#import "SelectedCaiZhiViewController.h"
#import "CaiZhiModel.h"
#import "GoodListViewController.h"
@interface AddDinDanViewController ()<RenWuDateChooseDelegate,okButtonDelegate,UITextFieldDelegate,UIActionSheetDelegate,UITextViewDelegate>
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
    NSDictionary *cengData;
    NSMutableArray *yaxingArr;
    NSString *zhizhiId;
    
    NSArray *mainData;
    NSArray *xinData;
    NSArray *lengData;
    NSArray *liData;
    
    
    NSString *pmid1;
    NSString *pmid2;
    NSString *pmid3;
    NSString *pmid4;
    NSString *pmid5;
    NSString *pmid6;
    NSString *pmid7;
    NSString *yaxingid;
    NSString *yaxingidmo;
    NSString *yaxingNamemo;
    NSString *PB_Id;
    //  NSString *PB_Nm;
    NSString * PB_CorrugatedLine;
    NSString *pmcode1;
    NSString *pmcode2;
    NSString *pmcode3;
    NSString *pmcode4;
    NSString *pmcode5;
    NSString *pmcode6;
    NSString *pmcode7;
    
    NSString *PB_I_Way;
    NSString *PB_II_Way;
    NSString *PB_III_Way;
    NSString *PB_IV_Way;
    NSString *PB_V_Way;
    NSString *PB_VI_Way;
    NSString *PB_VII_Way;
    
    
    NSString *PB_I_PeId;
    NSString *PB_II_PeId;
    NSString *PB_III_PeId;
    NSString *PB_IV_PeId;
    NSString *PB_V_PeId;
    NSString *PB_VI_PeId;
    NSString *PB_VII_PeId;
    
    
    
    
    NSString *comPanId;
    NSString *comPanName;
    NSDictionary *Caidic;
    BOOL isEdit;
    
    // UITextField *foucsTextField;
    
    double heightH;
    NSString *loctime;
    
    NSString *Jcmp_MinWidth;
    NSString *Jcmp_MaxWidth;
    NSString *Jcmp_MinLength;
    NSString *Jcmp_MaxLength;
    NSString *Jcmp_MinDate;
    
    
    NSString *str1;
    NSString *str2;
    NSString *str3;
    NSString *str4;
    NSString *str5;
    NSString *str6;
    NSString *str7;
    
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *subBtn;
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
@property (weak, nonatomic) IBOutlet UITextView *tf_shixiang;
@property (weak, nonatomic) IBOutlet UITextView *tf_ProdutIntro;
@property (weak, nonatomic) IBOutlet UITextView *tf_deliIntro;
- (IBAction)jingbanPress:(id)sender;
- (IBAction)maobanPress:(id)sender;
@end

@implementation AddDinDanViewController

- (IBAction)submit:(id)sender {
 //     [self Gotoshop];
    if (_tf_zhizhi.text<=0) {
        [AlertHelper singleMBHUDShow:@"没有选择楞型" ForView:self.view AndDelayHid:1];
        
    }
    else if([self caizhiNull])
    {
        [AlertHelper singleMBHUDShow:@"材质没有选全" ForView:self.view AndDelayHid:1];
    }
    
    else
        
    {
        [self Gotoshop];
    }
    
    
    
}
-(void)Gotoshop
{
    if ( [self sumWithYaXian]) {
        
        CaiZhiModel *mode=[[CaiZhiModel alloc]init];
        
        pmid1=[self stringNullWithString:pmid1];
        pmid2=[self stringNullWithString:pmid2];
        pmid3=[self stringNullWithString:pmid3];
        pmid4=[self stringNullWithString:pmid4];
        pmid5=[self stringNullWithString:pmid5];
        pmid6=[self stringNullWithString:pmid6];
        pmid7=[self stringNullWithString:pmid7];
        pmcode1=[self stringNullWithString:pmcode1];
        pmcode2=[self stringNullWithString:pmcode2];
        pmcode3=[self stringNullWithString:pmcode3];
        pmcode4=[self stringNullWithString:pmcode4];
        pmcode5=[self stringNullWithString:pmcode5];
        pmcode6=[self stringNullWithString:pmcode6];
        pmcode7=[self stringNullWithString:pmcode7];
        
        
        
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
            mode.PBDO_I_PmId=pmid1;
            mode.PBDO_I_PmNm=_tf_1.text;
            mode.PBDO_I_PmCode=pmcode1;
            
            
            
        }
        if (pmcode2.length!=0) {
            [str appendString:pmcode2];
            mode.PBDO_II_PmId=pmid2;
            mode.PBDO_II_PmNm=_tf_2.text;
            mode.PBDO_II_PmCode=pmcode2;
            
        }
        if (pmcode3.length!=0) {
            [str appendString:pmcode3];
            mode.PBDO_III_PmId=pmid3;
            mode.PBDO_III_PmNm=_tf_3.text;
            mode.PBDO_III_PmCode=pmcode3;
            
        }
        if (pmcode4.length!=0) {
            [str appendString:pmcode4];
            mode.PBDO_IV_PmId=pmid4;
            mode.PBDO_IV_PmNm=_tf_4.text;
            mode.PBDO_IV_PmCode=pmcode4;
        }
        if (pmcode5.length!=0) {
            [str appendString:pmcode5];
            mode.PBDO_V_PmId=pmid5;
            mode.PBDO_V_PmNm=_tf_5.text;
            mode.PBDO_V_PmCode=pmcode5;
            
        }
        if (pmcode6.length!=0) {
            [str appendString:pmcode6];
            mode.PBDO_VI_PmId=pmid6;
            mode.PBDO_VI_PmNm=_tf_6.text;
            mode.PBDO_VI_PmCode=pmcode6;
            
        }
        if (pmcode7.length!=0) {
            [str appendString:pmcode7];
            mode.PBDO_VII_PmId=pmid7;
            mode.PBDO_VII_PmNm=_tf_7.text;
            mode.PBDO_VII_PmCode=pmcode7;
            
        }
        [str appendString:@"("];
        [str appendString:PB_CorrugatedLine];
        [str appendString:@")"];
        
        mode.zhilei=str;
        mode.PB_Id=PB_Id;
        mode.PB_Nm=_tf_zhizhi.text;
        
        mode.PB_I_Way=PB_I_Way;
        mode.PB_II_Way=PB_II_Way;
        mode.PB_III_Way=PB_III_Way;
        mode.PB_IV_Way= PB_IV_Way;
        mode.PB_V_Way=PB_V_Way;
        mode.PB_VI_Way=PB_VI_Way;
        mode.PB_VII_Way=PB_VII_Way;
        
        
        
        mode. PB_I_PeId=PB_I_PeId;
        mode. PB_II_PeId=PB_II_PeId;
        mode. PB_III_PeId=PB_III_PeId;
        mode. PB_IV_PeId=PB_IV_PeId;
        mode. PB_V_PeId=PB_V_PeId;
        mode. PB_VI_PeId= PB_VI_PeId;
        mode. PB_VII_PeId=PB_VII_PeId;
        
        mode.PB_I_PeNm=_lab_1.text;
        mode.PB_II_PeNm=_lab_2.text;
        mode.PB_III_PeNm=_lab_3.text;
        mode.PB_IV_PeNm=_lab_4.text;
        mode.PB_V_PeNm=_lab_5.text;
        mode.PB_VI_PeNm=_lab_6.text;
        mode.PB_VII_PeNm=_lab_7.text;
        
        mode.PB_TypId=@"";
        mode.PB_TypNm=@"";
        mode.PB_Work_Price=@"";
        mode.PB_SHORT_LX=PB_CorrugatedLine;
        
        NSString *idStr=   _khmodel.PBDO_Id;
        if (idStr.length==0) {
            idStr=@"";
        }
        
        NSString *orderC=_khmodel.PBDO_OrderCode;
        if (orderC.length==0) {
            orderC=@"";
        }
        NSString *PBDO_POST_Key=_khmodel.PBDO_POST_Key;
        if (PBDO_POST_Key.length==0) {
            PBDO_POST_Key=@"";
        }
        NSString *PBDO_POST_Nm=_khmodel.PBDO_POST_Nm;
        if (PBDO_POST_Nm.length==0) {
            PBDO_POST_Nm=@"";
        }
        
        
        if ([_tf_num.text intValue]==0|| [_tf_long.text intValue]==0||[_tf_wide.text intValue]==0) {
            [AlertHelper singleMBHUDShow:@"纸宽、纸长和数量不能为零" ForView:self.view AndDelayHid:1];
            return;
        }
        [AlertHelper MBHUDShow:@"加载中..." ForView:self.view AndDelayHid:30];
    
        NSString *docPath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
        NSString *path=[docPath stringByAppendingPathComponent:@"person.text"];
        
        NSArray *arr2 = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        int key=0;
        for(int i=0;i<arr2.count;i++)
        {
            CaiZhiModel *modl=[arr2 objectAtIndex:i];
            
            if ([modl.zhilei isEqualToString:str])
            {
                key=1;
                
            }
        }
        
        if (key==0)
        {
            NSMutableArray *arr=[NSMutableArray arrayWithArray:arr2];
            [arr insertObject:mode atIndex:0];
            BOOL success =  [NSKeyedArchiver archiveRootObject:arr toFile:path];
            if (success) {
                NSLog(@"归档成功");
            }
            
        }
        
        [XiaDanWebAPI addPaperTempOrderCmgt_Id: [User standartUserInfo].Cmgt_Id  Cmgt_Name:[[NSUserDefaults standardUserDefaults] objectForKey:@"username"]  PBDO_CmpId:comPanId PBDO_CmpNm:comPanName PBDO_POST_Key:PBDO_POST_Key PBDO_POST_Nm:PBDO_POST_Nm PBDO_BuyCode:_tf_caigoudandiam.text PBDO_PBId:PB_Id PBDO_PBNm:_tf_zhizhi.text      PBDO_I_PmId:pmid1      PBDO_I_PmNm:_tf_1.text
                                  PBDO_II_PmId:pmid2    PBDO_II_PmNm:_tf_2.text
                                 PBDO_III_PmId:pmid3  PBDO_III_PmNm:_tf_3.text
                                  PBDO_IV_PmId:pmid4   PBDO_IV_PmNm:_tf_4.text
                                   PBDO_V_PmId:pmid5     PBDO_V_PmNm:_tf_5.text
                                  PBDO_VI_PmId:pmid6    PBDO_VI_PmNm:_tf_6.text
                                 PBDO_VII_PmId:pmid7   PBDO_VII_PmNm:_tf_7.text
                                     PBDO_Long:_tf_long.text PBDO_Width:_tf_wide.text PBDO_BuyNum:_tf_num.text PBDO_I_line:_tf_yxl.text PBDO_II_line:_tf_yx2.text PBDO_III_line:_tf_yx3.text PBDO_IV_line:_tf_yx4.text PBDO_V_line:_tf_yx5.text PBDO_VI_line:_tf_yx6.text PBDO_VII_line:_tf_yx6.text PBDO_VIII_line:_tf_yx8.text PBDO_PPTid:yaxingid PBDO_PPTnm:_tf_yaxing.text PBDO_DeliveryTm:_tf_deday.text PBDO_Note:_tf_shixiang.text PBDO_start_tm:@"" PBDO_over_tm:@"" PBDO_ClientNmAbbreviation:[User standartUserInfo].Cmgt_CmpNmAbbreviation
                                PBDO_OrderCode:orderC PBDO_PBCorrugatedLine:PB_CorrugatedLine
                                    PBDO_Plate:banxing PBDO_PaperNumber:str ProductionDescription:_tf_ProdutIntro.text DeliveryNote:_tf_deliIntro.text    PBDO_Id:idStr  Cmgt_CustomerCode:[User standartUserInfo].Cmgt_CustomerCode    PBDO_I_PmCode:pmcode1
                                PBDO_II_PmCode:pmcode2
                               PBDO_III_PmCode:pmcode3
                                PBDO_IV_PmCode:pmcode4
                                 PBDO_V_PmCode:pmcode5
                                PBDO_VI_PmCode:pmcode6
                               PBDO_VII_PmCode:pmcode7  Suecss: ^(NSArray *arr){
                                   [AlertHelper hideAllHUDsForView:self.view];
                                   if ([[arr[0] objectForKey:@"bool"]integerValue]==1)
                                   {
                                       
                                       
                                       if (![_state isEqualToString:@"1"]) {
                                           UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"加入购物车成功,是否继续添加" delegate:self cancelButtonTitle:@"不" otherButtonTitles:@"下单", nil];
                                           [alert show];
                                           
                                       }
                                       else
                                       {
                                           [AlertHelper singleMBHUDShow:@"修改成功" ForView:self.view AndDelayHid:1];
                                           NSArray *ar= self.navigationController.viewControllers;
                                           for (UIViewController *vieC in ar) {
                                               if ([vieC isKindOfClass:[GoodListViewController   class]]) {
                                                   
                                                   
                                                   [self.navigationController popToViewController:vieC animated:YES];
                                                   
                                               }
                                           }
                                           
                                           
                                       }
                                   }
                                   
                                   else   if ([[arr[0] objectForKey:@"bool"]integerValue]==3)
                                   {
                                       // @"请在%@前下单"
                                       NSString *str= [arr[0] objectForKey:@"Jcmp_MinDate"];
                                       UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"加入购物车失败" message: [NSString stringWithFormat:@"请在%@前下单",str]  delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                                       [alert show];
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
    if (_tf_yxl.text.length==0&&_tf_yx2.text.length==0&&_tf_yx3.text.length==0&&_tf_yx4.text.length==0&&_tf_yx5.text.length==0&&_tf_yx6.text.length==0&&_tf_yx7.text.length==0&&_tf_yx8.text.length==0) {
        return YES;
    }
    else
    {
        double num =[_tf_yxl.text intValue]+[_tf_yx2.text intValue]+[_tf_yx3.text intValue]+[_tf_yx4.text intValue]+[_tf_yx5.text intValue]+[_tf_yx6.text intValue]+[_tf_yx7.text intValue]+[_tf_yx8.text intValue];
        
        
        if (num!=[_tf_wide.text intValue]) {
            
            return NO;
        }
        else
        {
            return YES;
            
        }
    }
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex ==1) {
        [self clearText];
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
-(void)clearText
{
    
    _tf_zhizhi.text=nil;
    _tf_1 .text=nil;
    _tf_2 .text=nil;
    _tf_3.text=nil;
    _tf_4 .text=nil;
    _tf_5 .text=nil;
    _tf_6 .text=nil;
    _tf_7 .text=nil;
    _tf_wide .text=nil;
    _tf_long .text=nil;
    _tf_num.text=nil;
    //  _tf_yaxing .text=nil;
    yaxingid=  yaxingidmo;
    _tf_yaxing.text=yaxingNamemo;
    
    _tf_yxl .text=nil;
    _tf_yx2 .text=nil;
    _tf_yx3 .text=nil;
    _tf_yx4 .text=nil;
    _tf_yx5 .text=nil;
    _tf_yx6 .text=nil;
    _tf_yx7.text=nil;
    _tf_yx8 .text=nil;
    _tf_caigoudandiam .text=nil;
    _tf_shixiang .text=nil;
    _tf_ProdutIntro .text=nil;
    _tf_deliIntro .text=nil;
    heightH=0;
    _scrollView.contentSize = CGSizeMake([ScreenHelper SCREEN_WIDTH],[ScreenHelper SCREEN_WIDTH]+800+heightH);
    _view_intro.frame=CGRectMake(0, 104, [ScreenHelper SCREEN_WIDTH], 700);
    _tf_deday.text=loctime;
    _btn_maoBan.selected=NO;
    _btn_jingban.selected=YES;
    _la_yaxingNum.text=@"";
    
 //   [self getDataFromWenDang];
    
    
    
}
-(int)sumWithtextfeild
{
    double num=[_tf_yxl.text intValue]+[_tf_yx2.text intValue]+[_tf_yx3.text intValue]+[_tf_yx4.text intValue]
    +[_tf_yx5.text intValue]+[_tf_yx6.text intValue]+[_tf_yx7.text intValue] +[_tf_yx8.text intValue];
    return (int)num;
    
    
}
-(NSArray *)setleiXingdata:(NSString *)str
{
    NSMutableArray *name=[NSMutableArray array];
    
    [name removeAllObjects];
    if ([str isEqualToString:@"面"]) {
        
        
        
        for (int i=0; i<mainData .count; i ++)
        {
            [ name addObject:mainData[i][@"PM_Nm"] ];
            
        }
        return  name;
        
        
    }
    
    else if([str isEqualToString:@"芯"])
        
    {   [name removeAllObjects];
        
        for (int i=0; i<xinData .count; i ++)
        {
            [ name addObject:xinData[i][@"PM_Nm"] ];
            
        }
        return  name;
        
        
    }
    
    else if([str isEqualToString:@"里"])
        
    {
        [name removeAllObjects];
        
        for (int i=0; i<mainData .count; i ++)
        {
            [ name addObject:mainData[i][@"PM_Nm"] ];
            
        }
        return  name;
        
    }
    else  if([str isEqualToString:@"楞"])
    {
        
        [name removeAllObjects];
        
        for (int i=0; i<lengData .count; i ++)
        {
            [ name addObject:lengData[i][@"PM_Nm"] ];
            
        }
        return  name;
    }
    else
    {
        return nil;
        
    }
    
}
-(NSArray *)dataWithCode:(NSString *)str
{
    if ([str isEqualToString:@"面"]) {
        
        return  mainData;
        
        
    }
    
    else if([str isEqualToString:@"芯"])
    {
        
        return  xinData;
        
        
    }
    
    else if([str isEqualToString:@"里"])
    {
        
        return mainData;
        
    }
    else{
        
        return  lengData;
    }
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _la_jiaji.hidden=YES;
    heightH=0;
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapScroll)];
    [self.scrollView addGestureRecognizer:tap];
    
    _scrollView.contentSize = CGSizeMake([ScreenHelper SCREEN_WIDTH],[ScreenHelper SCREEN_WIDTH]+800+heightH);
    
    ch_deDay = [ChooseDateView instanceChooseDateView];
    ch_deDay.chooseDateDelegate=self;
    ch_deDay.dateId=@"1";
    _tf_deday.inputView=ch_deDay;
    
    
    NSDate *dates= [NSDate dateWithTimeInterval:+48*60*60+8 sinceDate:[NSDate date]];
    NSDateFormatter *formatter =  [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/beijing"];
    [formatter setTimeZone:timeZone];
    loctime = [formatter stringFromDate:dates];
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
    
    [XiaDanWebAPI getJoinCompanyWithCmgt_Id:[User standartUserInfo].Cmgt_Id Suecss:^(NSArray *arr){
        
        NSArray *ar=arr[0][@"GOI_JoinCompany"];
        for (NSDictionary *dic in ar ) {
            if ([dic[@"Jcmp_Id"] isEqualToString:comPanId ]) {
                CompanyModel *model=[[CompanyModel alloc]initWithDic:dic];
                Jcmp_MinWidth=model.Jcmp_MinWidth;
                Jcmp_MaxWidth=model.Jcmp_MaxWidth;
                Jcmp_MinLength=model.Jcmp_MinLength;
                Jcmp_MaxLength=model.Jcmp_MaxLength;
                Jcmp_MinDate=model.Jcmp_MinDate;
                _tf_wide.placeholder=[NSString stringWithFormat:@"%@-%@",Jcmp_MinWidth,Jcmp_MaxWidth];
                _tf_long.placeholder=[NSString stringWithFormat:@"%@-%@",Jcmp_MinLength,Jcmp_MaxLength];
                break;
            }
        }
        
        
    } fail:^(){
        [AlertHelper hideAllHUDsForView:self.view];
        [AlertHelper singleMBHUDShow:@"网络请求数据失败" ForView:self.view AndDelayHid:1];
        
        
    }];
    
    // [self getDataFromWenDang];
    if ([_state isEqualToString:@"0"]) {
        self.navigationItem.title=@"下单";
        
        comPanName= _model.Jcmp_Nm;
        comPanId=  _model.Jcmp_Id;
        _btn_jingban.selected=YES;
        
        Jcmp_MinWidth=_model.Jcmp_MinWidth;
        Jcmp_MaxWidth=_model.Jcmp_MaxWidth;
        Jcmp_MinLength=_model.Jcmp_MinLength;
        Jcmp_MaxLength=_model.Jcmp_MaxLength;
        Jcmp_MinDate=_model.Jcmp_MinDate;
        
        _tf_wide.placeholder=[NSString stringWithFormat:@"%@-%@",Jcmp_MinWidth,Jcmp_MaxWidth];
        _tf_long.placeholder=[NSString stringWithFormat:@"%@-%@",Jcmp_MinLength,Jcmp_MaxLength];
        
        [_subBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
        
        [self getYaxingData];
        [self getDataPaper_BoardName];
        [self getDataZhizhiData];
        [self getDataFromWenDang];
        
        
    }
    else
    {
        self.navigationItem.title=@"修改订单";
        [_subBtn setTitle:@"确认修改" forState:UIControlStateNormal];
        comPanId=  _khmodel.PBDO_CmpId;
        comPanName =_khmodel.PBDO_CmpNm;
        
        _tf_caigoudandiam.text=_khmodel.PBDO_BuyCode;
        
        _tf_zhizhi.text=_khmodel.PBDO_PBNm;
        PB_Id=_khmodel.PBDO_PBId;
        
        pmid1=_khmodel.PBDO_I_PmId;
        _tf_1.text=_khmodel.PBDO_I_PmNm;
        
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
        
        pmcode1=_khmodel.PBDO_I_PmCode;
        pmcode2=_khmodel.PBDO_II_PmCode;
        pmcode3=_khmodel.PBDO_III_PmCode;
        pmcode4=_khmodel.PBDO_IV_PmCode;
        pmcode5=_khmodel.PBDO_V_PmCode;
        pmcode6=_khmodel.PBDO_VI_PmCode;
        pmcode7=_khmodel.PBDO_VII_PmCode;
        
        
        
        if ([_khmodel. PBDO_Plate isEqualToString:@"毛板"]) {
            _btn_maoBan.selected=YES;
        }
        else
        {
            _btn_jingban.selected=YES;
            
            
        }
        _tf_shixiang.text=_khmodel.PBDO_Note;
        _tf_deliIntro.text=_khmodel.DeliveryNote;
        _tf_ProdutIntro.text=_khmodel.ProductionDescription;
        
        [self getYaxingData];
        [self getDataPaper_BoardName];
        [self getDataZhizhiData];
        
    }
    
    _la_kehuName.text=comPanName;
}

-(void)getDataFromWenDang
{
    NSDictionary *dic=[[NSUserDefaults standardUserDefaults]objectForKey:@"DingDanData"];
   // NSLog(@"SSS_ %@",dic);
    if (dic.count>0) {
        comPanId=  dic[@"Cmgt_Id"];
        comPanName =dic[@"Cmgt_Name"];;
        
        _tf_caigoudandiam.text=dic[@"PBDO_BuyCode"];
        
        _tf_zhizhi.text=dic[@"PBDO_PBNm"];
        PB_Id=dic[@"PBDO_PBId"];
        pmid1=dic[@"PBDO_I_PmId"];
        _tf_1.text=dic[@"PBDO_I_PmNm"] ;
        
        pmid2=dic[@"PBDO_II_PmId"];
        _tf_2.text=dic[@"PBDO_II_PmNm"];
        
        pmid3=dic[@"PBDO_III_PmId"];
        _tf_3.text=dic[@"PBDO_III_PmNm"];
        
        pmid4=dic[@"PBDO_IV_PmId"];
        _tf_4.text=dic[@"PBDO_IV_PmNm"];
        
        pmid5=dic[@"PBDO_V_PmId"];
        _tf_5.text=dic[@"PBDO_V_PmNm"];
        
        pmid6=dic[@"PBDO_VI_PmId"];
        _tf_6.text=dic[@"PBDO_VI_PmNm"];
        
        pmid7=dic[@"PBDO_VII_PmId"];
        _tf_7.text=dic[@"PBDO_VII_PmNm"];
        
        _tf_wide.text=dic[@"PBDO_Width"];
        _tf_long.text=dic[@"PBDO_Long"];
        _tf_num.text=dic[@"PBDO_BuyNum"];
        _tf_deday.text=dic[@"PBDO_DeliveryTm"];
        
        _tf_yxl.text=dic[@"PBDO_I_line"];
        
        _tf_yx2.text=dic[@"PBDO_II_line"];
        _tf_yx3.text=dic[@"PBDO_III_line"];
        _tf_yx4.text=dic[@"PBDO_IV_line"];
        _tf_yx5.text=dic[@"PBDO_V_line"];
        _tf_yx6.text=dic[@"PBDO_VI_line"];
        _tf_yx7.text=dic[@"PBDO_VII_line"];
        _tf_yx8.text=dic[@"PBDO_VIII_line"];
        
        _tf_yaxing.text=dic[@"PBDO_PPTnm"];
        yaxingid=dic[@"PBDO_PPTid"];
        
        pmcode1=dic[@"PBDO_I_PmCode"];
        pmcode2=dic[@"PBDO_II_PmCode"];
        pmcode3=dic[@"PBDO_III_PmCode"];
        pmcode4=dic[@"PBDO_IV_PmCode"];
        pmcode5=dic[@"PBDO_V_PmCode"];
        pmcode6=dic[@"PBDO_VI_PmCode"];
        pmcode7=dic[@"PBDO_VII_PmCode"];
        
        for (int i=0; i<[self setZhiLeiMode].count; i++) {
            CaiZhiModel *mode=[self setZhiLeiMode][i];
            if ( [ _tf_zhizhi.text isEqualToString:mode.PB_Nm]) {
                
                [self setZhiZhi:mode];
                
                
            }
        }
        
        if ([dic[@"PBDO_Plate"]  isEqualToString:@"毛板"]) {
            _btn_maoBan.selected=YES;
        }
        else
        {
            _btn_jingban.selected=YES;
            
            
        }
        _tf_shixiang.text=dic[@"PBDO_Note"];
        _tf_deliIntro.text=dic[@"DeliveryNote"];
        _tf_ProdutIntro.text=dic[@"ProductionDescription"];
        
        heightH= 306;
        [_view_zhizhi setFrame:CGRectMake(0, 104, [ScreenHelper SCREEN_WIDTH], 306)];
        _view_intro.frame=CGRectMake(0, CGRectGetMaxY(_view_zhizhi.frame), [ScreenHelper SCREEN_WIDTH], 700);
        _scrollView.contentSize = CGSizeMake([ScreenHelper SCREEN_WIDTH],[ScreenHelper SCREEN_WIDTH]+800+heightH);
        
        
        
        
    }
    
    
    
}
//板型名称
-(void)getDataPaper_BoardName
{
    @try {
        
        
        [XiaDanWebAPI getPaper_BoardWithJcmp_Id:comPanId Suecss:^(NSArray *arr){
            
            data=arr[0][@"Paper_Board"];
            NSMutableArray *daArr=[NSMutableArray array];
            
            for (int i=0; i<[data count]; i++)
            {
                [daArr addObject:  data[i][@"PB_Nm"] ];
                if(   [data[i][@"PB_Id"]isEqualToString:PB_Id])
                {
                    
                    [ self setzhizhiModel :data[i] ];
                    
                }
            }
            select.dataArr=daArr;
            
        } fail:^(){}];
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    
}
-(void)getDataZhizhiData
{
    
    pmid1=[self stringNullWithString:pmid1];
    pmid2=[self stringNullWithString:pmid2];
    pmid3=[self stringNullWithString:pmid3];
    pmid4=[self stringNullWithString:pmid4];
    pmid5=[self stringNullWithString:pmid5];
    pmid6=[self stringNullWithString:pmid6];
    pmid7=[self stringNullWithString:pmid7];
    
    [XiaDanWebAPI getGetPMSPListWithJcmp_Id:comPanId Suecss:^(NSArray *arr){
        //  NSLog(@"222 %@",arr);
        @try {
            xinData=arr[0][@"pmx"];
            mainData=arr[0][@"pmm"];
            lengData=arr[0][@"pml"];
            [self relodPickViewData];

        } @catch (NSException *exception) {
            
        } @finally {
            
        }
        
        
    } fail:^(){}];
    
    
    
}
-(void)getYaxingData
{
    
    [XiaDanWebAPI getgetPaper_PressureWithJcmp_Id:comPanId Suecss:^(NSArray *arr){
        
        
        yaxingArr=arr[0][@"Paper_Pressure_Type"];
        NSMutableArray *yaArr=[NSMutableArray array];
        for (int i=0; i<yaxingArr.count; i++) {
            [yaArr addObject:yaxingArr[i][@"PPT_Nm"] ];
            if ([_state isEqualToString:@"0"]) {
                if(i==0)
                {
                    _tf_yaxing.text=[NSString stringWithFormat:@"%@",yaxingArr[i][@"PPT_Nm"]];
                    yaxingidmo=yaxingid;
                    yaxingNamemo=_tf_yaxing.text;
                    yaxingid=yaxingArr[i][@"PPT_Id"];
                }}
            
        }
        yaxingView.dataArr=yaArr;
        
        
    } fail:^(){}];
    
}
-(void)chooseTheDate:(NSString *)dateStr withId:(NSString *)dateid {
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *endDate = [dateFormatter dateFromString:dateStr];
    NSDate *statDate = [dateFormatter dateFromString:Jcmp_MinDate];
    int timeInterval =[endDate timeIntervalSinceDate:statDate];
    if (timeInterval<0) {
        [AlertHelper singleMBHUDShow:[NSString stringWithFormat:@"请在%@后下单",Jcmp_MinDate] ForView:self.view AndDelayHid:2];
    }
    else
    {
        _tf_deday.text= dateStr;
        
        [_tf_deday resignFirstResponder];
        [self  tapScroll];
    }
    
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
    
    cengData =dic;
    PB_Id=dic[@"PB_Id"];
    _tf_zhizhi.text=dic[@"PB_Nm"];
    PB_CorrugatedLine=dic[@"PB_CorrugatedLine"];
    
    // NSLog(@"QQQ__ %@",dic[@"PB_I_Way"]);
    str1=[self exchangeCaizhiName:dic[@"PB_I_Way"]];
    str2=[self exchangeCaizhiName:dic[@"PB_II_Way"]];
    str3=[self exchangeCaizhiName:dic[@"PB_III_Way"]];
    str4=[self exchangeCaizhiName:dic[@"PB_IV_Way"]];
    str5=[self exchangeCaizhiName:dic[@"PB_V_Way"]];
    str6=[self exchangeCaizhiName:dic[@"PB_VI_Way"]];
    str7=[self exchangeCaizhiName:dic[@"PB_VII_Way"]];
    
    PB_I_Way=dic[@"PB_I_Way"];
    PB_II_Way=dic[@"PB_II_Way"];
    PB_III_Way=dic[@"PB_III_Way"];
    PB_IV_Way=dic[@"PB_IV_Way"];
    PB_V_Way=dic[@"PB_V_Way"];
    PB_VI_Way=dic[@"PB_VI_Way"];
    PB_VII_Way=dic[@"PB_VII_Way"];
    
    
    PB_I_PeId=dic[@"PB_I_PeId"];
    PB_II_PeId=dic[@"PB_II_PeId"];
    PB_III_PeId=dic[@"PB_III_PeId"];
    PB_IV_PeId=dic[@"PB_IV_PeId"];
    PB_V_PeId=dic[@"PB_V_PeId"];
    PB_VI_PeId=dic[@"PB_VI_PeId"];
    PB_VII_PeId=dic[@"PB_VII_PeId"];
    
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
    
    _lab_1.text=dic[@"PB_I_PeNm"];
    _lab_2.text=dic[@"PB_II_PeNm"];
    _lab_3.text=dic[@"PB_III_PeNm"];
    _lab_4.text=dic[@"PB_IV_PeNm"];
    _lab_5.text=dic[@"PB_V_PeNm"];
    _lab_6.text=dic[@"PB_VI_PeNm"];
    _lab_7.text=dic[@"PB_VII_PeNm"];
    
//    select1.dataArr=[self setleiXingdata:str1];
//    [select1 reloaPickView];
//    select2.dataArr=[self setleiXingdata:str2];
//    [select2 reloaPickView];
//    select3.dataArr=[self setleiXingdata:str3];
//    [select3 reloaPickView];
//    select4.dataArr=[self setleiXingdata:str4];
//    [select4 reloaPickView];
//    select5.dataArr=[self setleiXingdata:str5];
//    [select5 reloaPickView];
//    select6.dataArr=[self setleiXingdata:str6];
//    [select6 reloaPickView];
//    select7.dataArr=[self setleiXingdata:str7];
//    [select7 reloaPickView];
    
    [self relodPickViewData];
    
    heightH= 306;
    [_view_zhizhi setFrame:CGRectMake(0, 104, [ScreenHelper SCREEN_WIDTH], 306)];
    _view_intro.frame=CGRectMake(0, CGRectGetMaxY(_view_zhizhi.frame), [ScreenHelper SCREEN_WIDTH], 700);
    _scrollView.contentSize = CGSizeMake([ScreenHelper SCREEN_WIDTH],[ScreenHelper SCREEN_WIDTH]+800+heightH);
}
//-(NSArray *)getCaiZhiDetail:(NSString *) nameStr
//{
//    
//    NSArray *arr=[self dataWithCode:nameStr];
//    return arr;
//    
//}
-(void)doButtonWithSelectRow:(NSString *)row state:(int)state selectRow:(int)selectrow
{
    
    switch (state)
    {
        case 0:
        {
            
            self.tf_zhizhi.text=row;
            [self.tf_zhizhi resignFirstResponder];
            //    @try {
            _tf_1.text=nil;
            _tf_2.text=nil;
            _tf_3.text=nil;
            _tf_4.text=nil;
            _tf_5.text=nil;
            _tf_6.text=nil;
            _tf_7.text=nil;
            pmcode1=@"";
            pmcode2=@"";
            pmcode3=@"";
            pmcode4=@"";
            pmcode5=@"";
            pmcode6=@"";
            pmcode7=@"";
            pmid1=@"";
            pmid2=@"";
            pmid3=@"";
            pmid4=@"";
            pmid5=@"";
            pmid6=@"";
            pmid7=@"";
            NSDictionary *dic=data[selectrow];
            [self setzhizhiModel:dic];
            
            
        }
            break;
        case 1:
        {
            _tf_1.text=[NSString stringWithFormat:@"%@",row];
            [_tf_1 resignFirstResponder];
            //  NSDictionary *dic=[czData objectAtIndex:selectrow];
            NSString *str=[self exchangeCaizhiName:cengData[@"PB_I_Way"]];
            //  NSLog(@"AAAA222 %@",cengData[@"PB_I_Way"]);
            
            NSDictionary *dic=[[self dataWithCode:str] objectAtIndex:selectrow];
            
            pmid1=dic[@"PM_Id"];
            pmcode1=dic[@"PM_Code"];
            
        }
            break;
        case 2:
        {
            _tf_2.text=[NSString stringWithFormat:@"%@",row];
            [_tf_2 resignFirstResponder];
            NSString *str=[self exchangeCaizhiName:cengData[@"PB_II_Way"]];
            
            NSDictionary *dic=[[self dataWithCode:str] objectAtIndex:selectrow];
            
            pmid2=dic[@"PM_Id"];
            pmcode2=dic[@"PM_Code"];
            
            
        }
            break;
        case 3:
        {
            _tf_3.text=[NSString stringWithFormat:@"%@",row];
            [_tf_3 resignFirstResponder];
            NSString *str=[self exchangeCaizhiName:cengData[@"PB_III_Way"]];
            
            NSDictionary *dic=[[self dataWithCode:str] objectAtIndex:selectrow];
            pmid3=dic[@"PM_Id"];
            pmcode3=dic[@"PM_Code"];
            
        }
            break;
        case 4:
        {
            _tf_4.text=[NSString stringWithFormat:@"%@",row];
            [_tf_4 resignFirstResponder];
            NSString *str=[self exchangeCaizhiName:cengData[@"PB_IV_Way"]];
            
            NSDictionary *dic=[[self dataWithCode:str] objectAtIndex:selectrow];
            pmid4=dic[@"PM_Id"];
            pmcode4=dic[@"PM_Code"];
            
            
        }
            break;
        case 5:
        {
            _tf_5.text=[NSString stringWithFormat:@"%@",row];
            [_tf_5 resignFirstResponder];
            NSString *str=[self exchangeCaizhiName:cengData[@"PB_V_Way"]];
            
            NSDictionary *dic=[[self dataWithCode:str] objectAtIndex:selectrow];
            pmid5=dic[@"PM_Id"];
            pmcode5=dic[@"PM_Code"];
            
        }
            break;
        case 6:
        {
            _tf_6.text=[NSString stringWithFormat:@"%@",row];
            [_tf_6 resignFirstResponder];
            NSString *str=[self exchangeCaizhiName:cengData[@"PB_VI_Way"]];
            
            NSDictionary *dic=[[self dataWithCode:str] objectAtIndex:selectrow];
            pmid6=dic[@"PM_Id"];
            pmcode6=dic[@"PM_Code"];
            
            
        }
            break;
        case 7:
        {
            _tf_7.text=[NSString stringWithFormat:@"%@",row];
            [_tf_7 resignFirstResponder];
            NSString *str=[self exchangeCaizhiName:cengData[@"PB_VII_Way"]];
            
            NSDictionary *dic=[[self dataWithCode:str] objectAtIndex:selectrow];
            
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
        NSString * str11 = textField.text;
        str11 = [str11 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        //第二步、更新新输入的数值.
        // if (textField == _tf_report) {
        NSMutableString * strs = [NSMutableString stringWithString:str11];
        [strs replaceCharactersInRange:range withString:string];
        str11 = strs;
        if (str11.length==0) {
            //   _la_yaxingNum.text=@"0";
        }
        //_la_yaxingNum.text=str1;
        
        
        
        
    }
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.tag == 2000)
    {
        
        if (([textField.text intValue] <[Jcmp_MinWidth intValue])||([textField.text intValue] >[Jcmp_MaxWidth intValue])) {
            NSString  *str=[NSString stringWithFormat:@"线宽应在%@-%@之间",Jcmp_MinWidth,Jcmp_MaxWidth];
            [AlertHelper singleMBHUDShow:str ForView:self.view AndDelayHid:2];
            textField.text=nil;
            _la_yaxingNum.text=nil;
            return;
        }
        
    }
    if (textField.tag == 2010) {
        
        if (([textField.text intValue] <[Jcmp_MinLength intValue])||([textField.text intValue] >[Jcmp_MaxLength intValue])) {
            NSString  *str=[NSString stringWithFormat:@"线长应在%@-%@之间",Jcmp_MinLength,Jcmp_MaxLength];
            [AlertHelper singleMBHUDShow:str ForView:self.view AndDelayHid:2];
            textField.text=nil;
            return;
        }
    }
    
    int  num =[_tf_yxl.text intValue]+[_tf_yx2.text intValue]+[_tf_yx3.text intValue]+[_tf_yx4.text intValue]+[_tf_yx5.text intValue]+[_tf_yx6.text intValue]+[_tf_yx7.text intValue]+[_tf_yx8.text intValue];
    
    _la_yaxingNum.text=[NSString stringWithFormat:@"%d",num];
    
    
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    // foucsTextField = textField;
    _scrollView.contentSize = CGSizeMake([ScreenHelper SCREEN_WIDTH],[ScreenHelper SCREEN_HEIGHT]+800+  heightH +216);//原始滑动距离增加键盘高度
    CGPoint pt = [textField convertPoint:CGPointMake(0, 0) toView:_scrollView];//把当前的textField的坐标映射到scrollview上
    if(_scrollView.contentOffset.y-pt.y+64<=0)//判断最上面不要去滚动
        [_scrollView setContentOffset:CGPointMake(0, pt.y-64) animated:YES];//华东
    
}
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    _scrollView.contentSize = CGSizeMake([ScreenHelper SCREEN_WIDTH],[ScreenHelper SCREEN_HEIGHT]+800+  heightH +216);//原始滑动距离增加键盘高度
    CGPoint pt = [textView convertPoint:CGPointMake(0, 0) toView:_scrollView];//把当前的textField的坐标映射到scrollview上
    if(_scrollView.contentOffset.y-pt.y+64<=0)//判断最上面不要去滚动
        [_scrollView setContentOffset:CGPointMake(0, pt.y-64) animated:YES];//华东
    
    
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
    [_tf_ProdutIntro resignFirstResponder];
    [_tf_deliIntro resignFirstResponder];

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
- (IBAction)toSelectCaiZhiVC:(id)sender {
    SelectedCaiZhiViewController *to=[[SelectedCaiZhiViewController alloc]initWithBlock:^(CaiZhiModel *mode)
                                      {
                                          
                                          _tf_zhizhi.text=mode.PB_Nm;
                                          PB_Id=mode.PB_Id;
                                          
                                          pmid1=mode.PBDO_I_PmId;
                                          _tf_1.text=mode.PBDO_I_PmNm;
                                          
                                          pmid2=mode.PBDO_II_PmId;
                                          _tf_2.text=mode.PBDO_II_PmNm;
                                          
                                          pmid3=mode.PBDO_III_PmId;
                                          _tf_3.text=mode.PBDO_III_PmNm;
                                          
                                          pmid4=mode.PBDO_IV_PmId;
                                          _tf_4.text=mode.PBDO_IV_PmNm;
                                          
                                          pmid5=mode.PBDO_V_PmId;
                                          _tf_5.text=mode.PBDO_V_PmNm;
                                          
                                          pmid6=mode.PBDO_VI_PmId;
                                          _tf_6.text=mode.PBDO_VI_PmNm;
                                          
                                          pmid7=mode.PBDO_VII_PmId;
                                          _tf_7.text=mode.PBDO_VII_PmNm;
                                          
                                          pmcode1= mode.PBDO_I_PmCode;
                                          pmcode2= mode.PBDO_II_PmCode;
                                          pmcode3= mode.PBDO_III_PmCode;
                                          pmcode4= mode.PBDO_IV_PmCode;
                                          pmcode5= mode.PBDO_V_PmCode;
                                          pmcode6= mode.PBDO_VI_PmCode;
                                          pmcode7= mode.PBDO_VI_PmCode;
                                          
                                          
                                          PB_CorrugatedLine=mode.PB_SHORT_LX;
                                          
                                          
                                          [self setZhiZhi:mode];
                                          // [self getData1];
                                          
                                      }];
    [self.navigationController pushViewController:to animated:YES];
}
-(void)setZhiZhi:(CaiZhiModel *)mode
{
    
    //  NSLog(@"AAA_  %@",mode.PB_SHORT_LX);
    PB_I_Way=mode.PB_I_Way;
    PB_II_Way=mode.PB_II_Way;
    PB_III_Way=mode.PB_III_Way;
    PB_IV_Way=mode.PB_IV_Way;
    
    PB_V_Way=mode.PB_V_Way;
    
    PB_VI_Way=mode.PB_VI_Way;
    
    PB_VII_Way=mode.PB_VII_Way;
    
    
    
    PB_I_PeId= mode. PB_I_PeId;
    PB_II_PeId= mode. PB_II_PeId;
    PB_III_PeId= mode. PB_III_PeId;
    PB_IV_PeId= mode. PB_IV_PeId;
    PB_V_PeId= mode. PB_V_PeId;
    PB_VI_PeId= mode. PB_VI_PeId;
    PB_VII_PeId= mode. PB_VII_PeId;
    
    str1=[self exchangeCaizhiName:mode.PB_I_Way];
    str2=[self exchangeCaizhiName:mode.PB_II_Way];
    str3=[self exchangeCaizhiName:mode.PB_III_Way];
    str4=[self exchangeCaizhiName:mode.PB_IV_Way];
    str5=[self exchangeCaizhiName:mode.PB_V_Way];
    str6=[self exchangeCaizhiName:mode.PB_VI_Way];
    str7=[self exchangeCaizhiName:mode.PB_VII_Way];
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
    
    _lab_1.text=mode.PB_I_PeNm;
    _lab_2.text=mode.PB_II_PeNm;
    _lab_3.text=mode.PB_III_PeNm;
    _lab_4.text=mode.PB_IV_PeNm;
    _lab_5.text=mode.PB_V_PeNm;
    _lab_6.text=mode.PB_VI_PeNm;
    _lab_7.text=mode.PB_VII_PeNm;
    
    [self relodPickViewData];
    
    heightH= 306;
    [_view_zhizhi setFrame:CGRectMake(0, 104, [ScreenHelper SCREEN_WIDTH], 306)];
    _view_intro.frame=CGRectMake(0, CGRectGetMaxY(_view_zhizhi.frame), [ScreenHelper SCREEN_WIDTH], 700);
    _scrollView.contentSize = CGSizeMake([ScreenHelper SCREEN_WIDTH],[ScreenHelper SCREEN_WIDTH]+800+heightH);
    
    
    
}
-(void)relodPickViewData
{
    select1.dataArr=[self setleiXingdata:str1];
    [select1 reloaPickView];
    select2.dataArr=[self setleiXingdata:str2];
    [select2 reloaPickView];
    select3.dataArr=[self setleiXingdata:str3];
    [select3 reloaPickView];
    select4.dataArr=[self setleiXingdata:str4];
    [select4 reloaPickView];
    select5.dataArr=[self setleiXingdata:str5];
    [select5 reloaPickView];
    select6.dataArr=[self setleiXingdata:str6];
    [select6 reloaPickView];
    select7.dataArr=[self setleiXingdata:str7];
    [select7 reloaPickView];

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
    
    NSArray *arr=[NSArray arrayWithObjects:codeBean1,codeBean3,codeBean8, nil];
    return arr;
    
    
}
@end
