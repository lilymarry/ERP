//
//  PiliangSelectView.m
//  OA_Box
//
//  Created by imac-1 on 2017/1/23.
//  Copyright © 2017年 魏艳丽. All rights reserved.
//

#import "PiliangSelectView.h"
#import "ScreenHelper.h"
#import "DingDanListCell.h"
#import "XiaDanListModel.h"
@implementation PiliangSelectView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _leiXingArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    XiaDanListModel *_khmodel = [_leiXingArr objectAtIndex:indexPath.row];
    
    DingDanListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DingDanListCell"];
    if (!cell) {
        NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"DingDanListCell" owner:nil options:nil];
        cell= [nibView lastObject];
        
    }
    //  cell.backgroundColor= (isChooseMode )?[UIColor groupTableViewBackgroundColor]:[UIColor whiteColor];
//    cell.accessoryType= (isChooseMode)?UITableViewCellAccessoryNone:UITableViewCellAccessoryDisclosureIndicator;
//    if (_khmodel.isSeleted) {
//        cell.accessoryType=UITableViewCellAccessoryCheckmark;
//    }
    
    cell.PBDO_PaperNumber.text=_khmodel.PBDO_PaperNumber;
    cell.PBDO_BuyNum.text=_khmodel.PBDO_BuyNum;
    cell.state.text=_khmodel.state;
    cell.PBDO_OrderCode.text=_khmodel.PBDO_OrderCode;
    cell.PBDO_DeliveryTm.text=[self substringWithAstring:_khmodel.PBDO_DeliveryTm];
    cell.PBDO_CmpNm.text=_khmodel.PBDO_CmpNm;
    cell.PBDO_PPTnm.text=_khmodel.PBDO_PPTnm;
    cell.guiuge.text=[NSString stringWithFormat:@"%@*%@mm",_khmodel.PBDO_Long,_khmodel.PBDO_Width];
    cell.yaxian.text=[self getYaXianData:_khmodel];
 
    
    return cell;

    
    
}
-(NSString *)getYaXianData:(XiaDanListModel *)model
{
    NSMutableString *str=[NSMutableString string];
    [str appendString: [self  setStrNull:model.PBDO_I_line] ];
    [str appendString:@","];
    [str appendString:[self  setStrNull:model.PBDO_II_line] ];
    [str appendString:@","];
    [str appendString:[self  setStrNull:model.PBDO_III_line] ];
    [str appendString:@","];
    [str appendString:[self  setStrNull:model.PBDO_IV_line]];
    [str appendString:@","];
    [str appendString:[self  setStrNull:model.PBDO_V_line] ];
    [str appendString:@","];
    [str appendString: [self  setStrNull:model.PBDO_VI_line] ];
    [str appendString:@","];
    [str appendString:[self  setStrNull:model.PBDO_VII_line]];
    [str appendString:@","];
    [str appendString:[self  setStrNull:model.PBDO_VIII_line] ];
    
    
    return  str;
    
}
-(NSString *)setStrNull:(NSString *)str
{
    if (str.length==0) {
        return @"无";
    }
    else
    {
        return str;
    }
    
}

-(NSString *)substringWithAstring:(NSString *)str
{
    NSString *str1=@" ";
    NSRange range = [str rangeOfString:str1] ;
    NSString *time=[str substringToIndex:range.location];
    return time;
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if ([self.dataDelegate respondsToSelector:@selector(selectCompanyWithNum:)])
//    {     CompanyModel *model=[_leiXingArr objectAtIndex:indexPath.row];
//        
//        [self.dataDelegate selectCompanyWithNum:model];
//        //  [self.dataDelegate selectLeiXingWithNum:[NSString stringWithFormat: @"%d",i]];
//        [self closingTheLittleMenu:nil];
//    }
//    
//    
//}
-(void)getdata
{
//    [XiaDanWebAPI getJoinCompanyWithCmgt_Id:[User standartUserInfo].Cmgt_Id Suecss:^(NSArray *arr){
//        [_leiXingArr removeAllObjects];
//        NSArray *ar=arr[0][@"GOI_JoinCompany"];
//        for (NSDictionary *dic in ar ) {
//            CompanyModel *model=[[CompanyModel alloc]initWithDic:dic];
//            [_leiXingArr addObject:model];
//        }
//      
//        //  NSLog(@"WWWW %@",arr);
//    } fail:^(){}];
    
    
    
}
//-(void)setLeiXingArr:(NSArray *)leiXingArr
//{
//    
//    self.leiXingArr=leiXingArr;
//  //    [_table reloadData];
//
//}
-(void)refreshTable
{
  //  NSLog(@"22222 %@",self.leiXingArr);
  [self.table reloadData];

}
-(void)closingTheLittleMenu:(void (^)())closeMenuHandle{
    [self removeTheView:closeMenuHandle];
}
-(void)removeTheView:(void (^)())closeMenuHandle{
    
    [UIView animateWithDuration:0.2 animations:^(){
        [self setFrame:CGRectMake([ScreenHelper SCREEN_WIDTH], 0, [ScreenHelper SCREEN_WIDTH], [ScreenHelper SCREEN_HEIGHT])];
    } completion:^(BOOL finished){
        [self removeFromSuperview];
        if (closeMenuHandle) {
            closeMenuHandle();
        }
    }];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.backgroundColor=[UIColor whiteColor];
        _leiXingArr=[NSArray array];
        
        UILabel *lab=[[UILabel alloc ] initWithFrame:CGRectMake(0, 0, frame.size.width, 44)];
        lab.backgroundColor = [UIColor groupTableViewBackgroundColor];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.textColor=[UIColor lightGrayColor];
        lab.font =  [UIFont fontWithName:@"Arial" size:18.0f];
        lab.text=@" 确认下单以下订单";
        [self addSubview:lab];
        
        
        _table=[[UITableView alloc]initWithFrame:CGRectMake(0, 44, frame.size.width, frame.size.height-88)];
        _table.delegate=self;
        _table.dataSource=self;
        [self addSubview:_table];
        
        
        UIButton *but=[UIButton buttonWithType:UIButtonTypeCustom];
        but.frame=CGRectMake(20, CGRectGetMaxY(_table.frame)+2, frame.size.width-40, 40);
        [but setTitle:@"确定" forState:UIControlStateNormal];
        [but setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [but addTarget:self action:@selector(surePress) forControlEvents:UIControlEventTouchUpInside];
        [but setBackgroundImage:[UIImage imageNamed:@"loginBtn11.png"]  forState:UIControlStateNormal];
        [self addSubview:but];
        
       // [self getdata];
    }
    
    return self;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 191;
    
}
-(void)surePress
{
    NSMutableString *str=[NSMutableString string];
    
    for (int i=0; i<_leiXingArr.count; i++) {
        XiaDanListModel *khmodel=_leiXingArr[i];
        [str appendString:khmodel.PBDO_Id];
        if (i!=_leiXingArr.count-1) {
            [str appendString:@","];
        }
        
    }
    if ([self.dataDelegate respondsToSelector:@selector(selectPilingWithNum:)])
    {
        [self.dataDelegate selectPilingWithNum:str];
     
        [self closingTheLittleMenu:nil];
    }

}
- (UIViewController *)viewController
{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}


@end
