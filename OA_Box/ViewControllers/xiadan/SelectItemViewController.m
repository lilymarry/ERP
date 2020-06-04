//
//  SelectItemViewController.m
//  OA_Box
//
//  Created by imac-1 on 2016/10/26.
//  Copyright © 2016年 魏艳丽. All rights reserved.
//

#import "SelectItemViewController.h"
#import "ChooseDateView.h"
@interface SelectItemViewController ()<RenWuDateChooseDelegate>
{
   ChooseDateView *ch_deDay;
   ChooseDateView *ch_deDay1;
     BOOL isEdit;
}
@property (weak, nonatomic) IBOutlet UITextField *txt_PBDO_BuyCode;
@property (weak, nonatomic) IBOutlet UITextField *txt_PBDO_PBCorrugatedLine;
@property (weak, nonatomic) IBOutlet UITextField *txt_PBDO_PBNm;
@property (weak, nonatomic) IBOutlet UITextField *txt_PPBDO_PaperNumber;
@property (weak, nonatomic) IBOutlet UITextField *txt_PBDO_Width;
@property (weak, nonatomic) IBOutlet UITextField *txt_ToPBDO_Width;
@property (weak, nonatomic) IBOutlet UITextField *txt_PBDO_Long;

@property (weak, nonatomic) IBOutlet UITextField *txt_ToPBDO_Long;
@property (weak, nonatomic) IBOutlet UITextField *txt_PBDO_Num;
@property (weak, nonatomic) IBOutlet UITextField *txt_ToPBDO_Num;
@property (weak, nonatomic) IBOutlet UITextField *txt_PBDO_Tm;
@property (weak, nonatomic) IBOutlet UITextField *txt_ToPBDO_Tm;

@end

@implementation SelectItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _txt_PBDO_BuyCode.text=_textDic[@"PBDO_BuyCode"];
    _txt_PBDO_PBCorrugatedLine.text=_textDic[@"PBDO_PBCorrugatedLine"];_txt_PBDO_PBNm.text=_textDic[@"PBDO_PBNm"];
    _txt_PPBDO_PaperNumber.text=_textDic[@"PBDO_PaperNumber"];
    _txt_PBDO_Width.text=_textDic[@"PBDO_Width"];
    _txt_ToPBDO_Width.text=_textDic[@"ToPBDO_Width"];
    _txt_PBDO_Long.text=_textDic[@"PBDO_Long"];
    _txt_ToPBDO_Long.text=_textDic[@"ToPBDO_Long"];
    _txt_PBDO_Num.text=_textDic[@"PBDO_Num"];
    _txt_ToPBDO_Num.text=_textDic[@"ToPBDO_Num"];
    _txt_PBDO_Tm.text=_textDic[@"PBDO_Tm"];
    _txt_ToPBDO_Tm.text=_textDic[@"ToPBDO_Tm"];

    ch_deDay = [ChooseDateView instanceChooseDateView];
    ch_deDay.chooseDateDelegate=self;
    ch_deDay.dateId=@"1";
    _txt_PBDO_Tm.inputView=ch_deDay;

    ch_deDay1 = [ChooseDateView instanceChooseDateView];
    ch_deDay1.chooseDateDelegate=self;
    ch_deDay1.dateId=@"2";
    _txt_ToPBDO_Tm.inputView=ch_deDay1;
    
}
-(void)chooseTheDate:(NSString *)dateStr withId:(NSString *)dateid {
    
    if ([dateid isEqualToString:@"1"]) {
         _txt_PBDO_Tm.text= dateStr;
    }
   else
   {
        _txt_ToPBDO_Tm.text=dateStr;
   }
    isEdit=NO;
    [_txt_PBDO_Tm resignFirstResponder];
    [_txt_ToPBDO_Tm resignFirstResponder];
    
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame=self.view.frame;
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    if (!isEdit&&textField.tag>1000)
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
    if (!isEdit&&textField.tag>1000) {
        frame.origin.y=0;
        [UIView animateWithDuration:0.5f animations:^{
            self.view.frame=frame;
        }];
    }
}

- (IBAction)btnPress:(id)sender {
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:_txt_PBDO_BuyCode.text,@"PBDO_BuyCode",
        _txt_PBDO_PBCorrugatedLine.text,@"PBDO_PBCorrugatedLine",_txt_PBDO_PBNm.text,@"PBDO_PBNm",
            _txt_PPBDO_PaperNumber.text,@"PBDO_PaperNumber",
    _txt_PBDO_Width.text,@"PBDO_Width",
                        _txt_ToPBDO_Width.text,@"ToPBDO_Width",_txt_PBDO_Long.text,@"PBDO_Long",_txt_ToPBDO_Long.text,@"ToPBDO_Long",_txt_PBDO_Num.text,@"PBDO_Num"
                          ,_txt_ToPBDO_Num.text,@"ToPBDO_Num"
                       ,_txt_PBDO_Tm.text,@"PBDO_Tm",
                       _txt_ToPBDO_Tm.text,@"ToPBDO_Tm",
                      nil];
    //NSLog(@"WWwW__ %@",dic);
    NSNotification *notification =[NSNotification notificationWithName:@"selectItem" object:nil userInfo:dic];
    //通过通知中心发送通知
    [[NSNotificationCenter defaultCenter] postNotification:notification];
    [self.navigationController popViewControllerAnimated: YES];
 
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{    isEdit=NO;
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
