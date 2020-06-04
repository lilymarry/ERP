//
//  GoodListViewController.m
//  OA_Box
//
//  Created by imac-1 on 2017/1/17.
//  Copyright © 2017年 魏艳丽. All rights reserved.
//

#import "GoodListViewController.h"
#import "MJRefresh.h"
#import "XiaDanWebAPI.h"
#import "AlertHelper.h"
#import "XiaDanListModel.h"
#import "User.h"
#import "DingDanListCell.h"
#import "AddDingdanViewController.h"
#import "DingDanDetailViewController.h"
#import "ScreenHelper.h"
#import "SelectTypeView.h"
#import "SelectCompanyView.h"
#import "SelectItemViewController.h"

///#import "AddDinDanViewController.h"
#import "ShopDetailViewController.h"
#import "PiliangSelectView.h"
@interface GoodListViewController ()
<selectLeiXingDelegate,selectCompanyDelegate,CommonNotification,selectPilingDelegate>
{
    NSMutableArray *dataArr;
    //    int selectedTag;
    UIView *bgView ; //遮罩层
    //    NSString *typeidStr;
    SelectTypeView *choseview;
    SelectCompanyView *choseview1;
    //
    //    NSString *perid;
    NSString *maxid;
    NSMutableArray *liuchengArr;
    
    NSString *PBDO_CmpId;//工厂ID
    NSString  *typeStr;
    NSString * typeSort;
    NSString * typeSortKey;
    
    BOOL show;
    // int  dataNum;
    //    NSString *etim;
    //
    NSString *method;
    
    NSMutableDictionary *DataDic;
    
    BOOL isChooseMode;
    PiliangSelectView *SelectView;
}

@property (weak, nonatomic) IBOutlet UIButton *btn_type;
@property (weak, nonatomic) IBOutlet UILabel *lab_type;
@property (weak, nonatomic) IBOutlet UIImageView *ima_type;

@property (weak, nonatomic) IBOutlet UIButton *btn_compan;
@property (weak, nonatomic) IBOutlet UILabel *lab_compan;
@property (weak, nonatomic) IBOutlet UIImageView *ima_compan;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UILabel *lab_num;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *rightBtn;



@end

@implementation GoodListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigatioTittle];
    
    isChooseMode=NO;
    [_rightBtn setTitle:@"编辑"];
    
    method=@"getPaperTempOrder";
    //_dingDanState=
    //    //购物车数据
    //    if ([_type isEqualToString:@"3"]) {
    //        method=@"getPaperTempOrder";
    //    }
    //    else
    //    {
    //        method=@"getPaperOrder";
    //    }
    //
    
    _btn_type.selected=NO;
    _ima_type.image=[UIImage imageNamed:@"x_09.png"];
    _lab_type.text=@"交期由近到远";
    
    //    _btn_compan.selected=NO;
    //    _btn_compan.enabled=NO;
    //    _ima_compan.image=[UIImage imageNamed:@"x_09.png"];
    //    _lab_compan.text=[User standartUserInfo].model.Jcmp_Nm;
    //
    if ([[User standartUserInfo].IsSinglePlant isEqualToString:@"1"]) {
        _btn_compan.selected=NO;
        _btn_compan.enabled=NO;
        _ima_compan.image=[UIImage imageNamed:@"x_09.png"];
        _lab_compan.text=[User standartUserInfo].model.Jcmp_Nm;
        PBDO_CmpId=[User standartUserInfo].model.Jcmp_Id;
    }
    else
    {
        _btn_compan.selected=NO;
        _btn_compan.enabled=YES;
        _ima_compan.image=[UIImage imageNamed:@"x_09.png"];
        _lab_compan.text=@"全部";
        PBDO_CmpId=@"";
    }
    
    
    
    DataDic=[NSMutableDictionary dictionary];
    dataArr=[NSMutableArray new];
    // dataNum=0;
    
    [self  setLeiXingSortWithName];
    [self setCompanyDataWithNum:_lab_compan.text];
    
    [self setupRefresh];
    show=NO;
    
    // NSLog(@"AAA___XX %@",_dingDanState);
    
    
    
}
-(void)setNavigatioTittle
{
    //    if ([_dingDanState isEqualToString:@"1,2,3,4,5,6,7"]) {
    //        if ([_type isEqualToString:@"3"]) {
    //            self.navigationItem.title=@"购物车";
    //
    //        }
    //        else
    //        {
    //            self.navigationItem.title=@"所有订单";
    //        }
    //    }
    //    else if ([_dingDanState isEqualToString:@"1,2,3,4,5"]) {
    //        self.navigationItem.title=@"未完成订单";
    //    }
    //    else  if ([_dingDanState isEqualToString:@"5"]) {
    //        self.navigationItem.title=@"位置查看";
    //    }
    //    else
    //    {
    //        self.navigationItem.title=@"退换货";
    //    }
}
- (void)setupRefresh
{
    
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    [self.tableView headerBeginRefreshing];
    // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [self.tableView addFooterWithTarget:self action:@selector(footerRereshing)];
    
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)viewWillAppear:(BOOL)animated
{  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tongzhi:) name:@"selectItem" object:nil];
}
- (void)tongzhi:(NSNotification *)text{
    // NSLog(@"%@",text.userInfo);
    DataDic =[NSMutableDictionary dictionaryWithDictionary:text.userInfo];
    [self.tableView headerBeginRefreshing];
    //  NSLog(@"－－－－－接收到通知------");
    //  _khmodel=text.userInfo[@"data"];
    // [self  getFlowData];
    // _tabView.hidden=NO;
    // [_tabView reloadData];
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [choseview removeFromSuperview];
    [choseview1 removeFromSuperview];
}
#pragma mark 开始进入刷新状态
- (void)headerRereshing
{
    //  isChooseMode=NO;
    // [_rightBtn setTitle:@"全选"];
    
    NSDictionary * param ;
    if (DataDic.count >0) {
        
        param = @{@"method":method,
                  @"Cmgt_Id":[User standartUserInfo].Cmgt_Id,@"count":@"4",@"endCount":@"0",@"maxId":@"",typeStr:typeStr,typeSortKey:typeSort,@"PBDO_CmpId":[User standartUserInfo].model.Jcmp_Id
                  ,@"PBDO_BuyCode":DataDic[@"PBDO_BuyCode"]
                  ,@"PBDO_PBCorrugatedLine":DataDic[@"PBDO_PBCorrugatedLine"]
                  ,@"PBDO_PBNm":DataDic[@"PBDO_PBNm"]
                  ,@"PBDO_PaperNumber":DataDic[@"PBDO_PaperNumber"]
                  ,@"PBDO_Width":DataDic[@"PBDO_Width"]
                  ,@"ToPBDO_Width":DataDic[@"ToPBDO_Width"]
                  ,@"PBDO_Long":DataDic[@"PBDO_Long"]
                  ,@"ToPBDO_Long":DataDic[@"ToPBDO_Long"]
                  ,@"PBDO_Num":DataDic[@"PBDO_Num"]
                  ,@"ToPBDO_Num":DataDic[@"ToPBDO_Num"]
                  ,@"PBDO_Tm":DataDic[@"PBDO_Tm"]
                  ,@"ToPBDO_Tm":DataDic[@"ToPBDO_Tm"]
                  ,@"BOS_OrderType":@"1,2,3,4,5,6,7"
                  };
    }
    else
    {
        param = @{@"method":method,
                  @"Cmgt_Id":[User standartUserInfo].Cmgt_Id,@"count":@"4",@"endCount":@"0",@"maxId":@"",typeStr:typeStr,typeSortKey:typeSort,@"PBDO_CmpId":[User standartUserInfo].model.Jcmp_Id,@"BOS_OrderType":@"1,2,3,4,5,6,7"
                  };
        
    }
    [XiaDanWebAPI selectListWithDic:param
                             Suecss:^(NSArray *renwulist){
                                 //  NSLog(@"1111WWWWW%@",renwulist);
                                 [dataArr removeAllObjects];
                                 
                                 
                                 if (renwulist && renwulist.count>0) {
                                     NSDictionary *dict =[[NSDictionary alloc] initWithDictionary: renwulist[0]];
                                     NSArray *dictArr= [dict objectForKey:@"PaperBoardOrder"];
                                     for (NSDictionary *dict1 in dictArr) {
                                         XiaDanListModel *model=[[XiaDanListModel alloc]initWithDic:dict1];
                                         [dataArr addObject:model];
                                     }
                                     //  dataNum=dataArr .count ;
                                     [self refreshLable];
                                     maxid=dict[@"MaxId"];
                                 }
                                 [self.tableView reloadData];
                                 //结束刷新状态
                                 [self.tableView headerEndRefreshing];
                             } fail:^{
                                 [self.tableView headerEndRefreshing];
                                 
                                 [AlertHelper singleMBHUDShow:@"网络请求数据失败" ForView:self.view AndDelayHid:1];
                             }];
}

- (void)footerRereshing
{
    
    if (dataArr.count==0)
    {
        self.tableView.footerRefreshingText = @"无更新数据";
        [self.tableView footerEndRefreshing];
        return ;
    }
    else
    {
        NSDictionary * param ;
        if (DataDic.count >0) {
            
            param = @{@"method":method,
                      @"Cmgt_Id":[User standartUserInfo].Cmgt_Id,@"count":@"4",@"endCount":[NSString stringWithFormat:@"%lu",(unsigned long)dataArr.count],@"maxId":maxid,typeStr:typeStr,typeSortKey:typeSort,@"PBDO_CmpId":[User standartUserInfo].model.Jcmp_Id
                      ,@"PBDO_BuyCode":DataDic[@"PBDO_BuyCode"]
                      ,@"PBDO_PBCorrugatedLine":DataDic[@"PBDO_PBCorrugatedLine"]
                      ,@"PBDO_PBNm":DataDic[@"PBDO_PBNm"]
                      ,@"PBDO_PaperNumber":DataDic[@"PBDO_PaperNumber"]
                      ,@"PBDO_Width":DataDic[@"PBDO_Width"]
                      ,@"ToPBDO_Width":DataDic[@"ToPBDO_Width"]
                      ,@"PBDO_Long":DataDic[@"PBDO_Long"]
                      ,@"ToPBDO_Long":DataDic[@"ToPBDO_Long"]
                      ,@"PBDO_Num":DataDic[@"PBDO_Num"]
                      ,@"ToPBDO_Num":DataDic[@"ToPBDO_Num"]
                      ,@"PBDO_Tm":DataDic[@"PBDO_Tm"]
                      ,@"ToPBDO_Tm":DataDic[@"ToPBDO_Tm"]
                      ,@"BOS_OrderType":@"1,2,3,4,5,6,7"
                      
                      };
        }
        else
        {
            param = @{@"method":method,
                      @"Cmgt_Id":[User standartUserInfo].Cmgt_Id,@"count":@"4",@"endCount":[NSString stringWithFormat:@"%lu",(unsigned long)dataArr.count],@"maxId":maxid,typeStr:typeStr,typeSortKey:typeSort,@"PBDO_CmpId":[User standartUserInfo].model.Jcmp_Id,@"BOS_OrderType":@"1,2,3,4,5,6,7"
                      };
            
        }
        
        //   [self setAllChildViewHidden];
        [XiaDanWebAPI selectListWithDic:param                                       Suecss:^(NSArray *renwulist){
            if (renwulist && renwulist.count>0) {
                NSDictionary *dict =[[NSDictionary alloc] initWithDictionary: renwulist[0]];
                NSArray *dictArr= [dict objectForKey:@"PaperBoardOrder"];
                for (NSDictionary *dict1 in dictArr) {
                    XiaDanListModel *model=[[XiaDanListModel alloc]initWithDic:dict1];
                    [dataArr addObject:model];
                }
                //  dataNum=dataArr.count;
                
            }
            [self.tableView reloadData];
            //结束刷新状态
            [self.tableView footerEndRefreshing];
        } fail:^{
            [self.tableView footerEndRefreshing];
            
            [AlertHelper singleMBHUDShow:@"网络请求数据失败" ForView:self.view AndDelayHid:1];
        }];
        
        
        
        
        
    }
}
-(void)showBg
{
    if (_btn_type.selected ||_btn_compan.selected) {
        [self showThebgview];
    }
    else
    {
        [self hidThebgview];
    }
}
- (IBAction)typePress:(id)sender {
    //  [self hidThebgview];
    _btn_type.selected=!_btn_type.selected;
    
    [choseview removeFromSuperview];
    [choseview1 removeFromSuperview];
    
    _btn_compan.selected=NO;
    _ima_compan.image=[UIImage imageNamed:@"x_09.png"];
    if (_btn_type.selected) {
        _ima_type.image=[UIImage imageNamed:@"s_11.png"];
        //   [self showThebgview];
        choseview =[[SelectTypeView alloc]  initWithFrame:CGRectMake(0,100, self.view.frame.size.width, self.view.frame.size.height-100)];
        choseview.dataDelegate=self;
        [self.view.window addSubview:choseview];
        
    }
    else
    {
        _ima_type.image=[UIImage imageNamed:@"x_09.png"];
        //  [self hidThebgview];
        [choseview removeFromSuperview];
        [choseview1 removeFromSuperview];
    }
    
    
    
}
- (IBAction)comPanyPress:(id)sender {
    
    // [self hidThebgview];
    _btn_compan.selected=!_btn_compan.selected;
    
    [choseview removeFromSuperview];
    [choseview1 removeFromSuperview];
    
    _btn_type.selected=NO;
    _ima_type.image=[UIImage imageNamed:@"x_09.png"];
    
    if (_btn_compan.selected) {
        _ima_compan.image=[UIImage imageNamed:@"s_11.png"];
        //   [self showThebgview];
        choseview1 =[[SelectCompanyView alloc]  initWithFrame:CGRectMake(0,100, self.view.frame.size.width, self.view.frame.size.height-100)];
        choseview1.dataDelegate=self;
        [self.view.window addSubview:choseview1];
        
    }
    else
    {
        _ima_compan.image=[UIImage imageNamed:@"x_09.png"];
        //   [self hidThebgview];
        [choseview removeFromSuperview];
        [choseview1 removeFromSuperview];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)seletVCPress:(id)sender {
    
    
    UIStoryboard *s = [UIStoryboard storyboardWithName:@"XiaDan" bundle:[NSBundle mainBundle]];
    SelectItemViewController *changyongController = [s instantiateViewControllerWithIdentifier:@"SelectItem"];
    changyongController.textDic=DataDic;
    [self.navigationController   pushViewController:changyongController animated:YES ];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    XiaDanListModel *_khmodel = [dataArr objectAtIndex:indexPath.row];
    
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
    //
    
    if (_khmodel.isSeleted&&isChooseMode) {
        cell.imaView.image=[UIImage imageNamed:@"remBtn.png"];
        cell.imaView.hidden=NO;
    }
    else if(isChooseMode)
    {
        cell.imaView.image=[UIImage imageNamed:@"unRemBtn.png"];
        cell.imaView.hidden=NO;
    }
    else
    {
        cell.imaView.hidden=YES;
    }
    //    else
    //    {
    //        cell.imaView.image=[UIImage imageNamed:@"unRemBtn.png"];
    //    }
    //  cell.imaView.hidden=(isChooseMode)?YES:NO;
    
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

//-(BOOL)setlabHidden:(NSString *)lab
//{
//    if (lab.length==0) {
//        return YES;
//    }
//    else
//    {
//        return NO;
//
//    }
//}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    XiaDanListModel *model=[dataArr objectAtIndex:indexPath.row];
    // NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:model,@"data", nil];
    if (isChooseMode) {
        model.isSeleted=(model.isSeleted)?NO:YES;
        DingDanListCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        NSString *name=(model.isSeleted)?@"remBtn.png":@"unRemBtn.png";
        cell.imaView.image =[UIImage imageNamed:name];
        [self refreshLable];
        
    }else{
        //    if ([_type isEqualToString:@"1"]) {
        //        //创建通知
        //        NSNotification *notification =[NSNotification notificationWithName:@"tongzhi" object:nil userInfo:dic];
        //        //通过通知中心发送通知
        //        [[NSNotificationCenter defaultCenter] postNotification:notification];
        //        [self.navigationController popViewControllerAnimated: YES];
        //    }
        //    else if ([_type isEqualToString:@"3"]) {
        //        UIStoryboard *s = [UIStoryboard storyboardWithName:@"XiaDan" bundle:[NSBundle mainBundle]];
        //        ShopDetailViewController *changyongController = [s instantiateViewControllerWithIdentifier:@"shop"];
        //
        //        changyongController.khmodel=model;
        //        changyongController.refreshNotification=self;
        //        // changyongController.state=@"1";
        //        [self.navigationController pushViewController:changyongController animated:YES];
        //    }
        //    else
        //    {
        
        //  //  model.isExist 1都可以修改
        //    if ([model.isExist isEqualToString:@"1"]) {
        //        //修改订单
        ////        UIStoryboard *s = [UIStoryboard storyboardWithName:@"XiaDan" bundle:[NSBundle mainBundle]];
        ////        AddDingdanViewController *changyongController = [s instantiateViewControllerWithIdentifier:@"AddDinDan"];
        //        UIStoryboard *s = [UIStoryboard storyboardWithName:@"AddDingdan" bundle:[NSBundle mainBundle]];
        //        AddDinDanViewController *changyongController = [s instantiateViewControllerWithIdentifier:@"AddDinDan"];
        //
        //        changyongController.khmodel=model;
        //        changyongController.state=@"1";
        //        [self.navigationController pushViewController:changyongController animated:YES];
        //
        //    }
        //    else
        //    {
        
        UIStoryboard *s = [UIStoryboard storyboardWithName:@"XiaDan" bundle:[NSBundle mainBundle]];
        ShopDetailViewController *changyongController = [s instantiateViewControllerWithIdentifier:@"shop"];
        
        changyongController.khmodel=model;
        changyongController.refreshNotification=self;
        // changyongController.state=@"1";
        [self.navigationController pushViewController:changyongController animated:YES];
        
        //        UIStoryboard *s = [UIStoryboard storyboardWithName:@"XiaDan" bundle:[NSBundle mainBundle]];
        //        DingDanDetailViewController *changyongController = [s instantiateViewControllerWithIdentifier:@"DingDanDetail"];
        //        changyongController.khmodel=model;
        //        [self.navigationController pushViewController:changyongController animated:YES];
        //  }
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 191;
    
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        XiaDanListModel *model=[dataArr objectAtIndex:indexPath.row];
        //   NSString *fpiId=[dict valueForKey:@"fpiId"];
        [self deleteDataBy:model.PBDO_Id AndNSIndexPath:indexPath];
    }
}
-(void)deleteDataBy:(NSString*)fpiid AndNSIndexPath:(NSIndexPath *)indexPath{
    [AlertHelper singleMBHUDShow:@"删除中..." ForView:self.view];
    [XiaDanWebAPI delePaperBoardTempOrderToBoardOrderPLWithPBID:fpiid
                                                         Suecss:^(NSArray *arr) {
                                                             [AlertHelper hideAllHUDsForView:self.view];
                                                             NSDictionary *dict =[arr objectAtIndex:0];
                                                             NSString *flag=[dict valueForKey:@"bool"];
                                                             if ([@"1" isEqualToString:flag]) {
                                                                 
                                                                 [dataArr removeObjectAtIndex:indexPath.row];
                                                                 [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
                                                             }else{
                                                                 [AlertHelper singleMBHUDShow:@"删除失败,稍后再试" ForView:self.view AndDelayHid:2];
                                                             }
                                                         } fail:^{
                                                             [AlertHelper hideAllHUDsForView:self.view];
                                                             [AlertHelper singleMBHUDShow:@"网络操作出现错误" ForView:self.view AndDelayHid:2];
                                                         }];
}

//销毁查询菜单view
-(void)removeTheView:(UITapGestureRecognizer*)gesture{
    [self hidThebgview];
    [SelectView removeFromSuperview];
    [choseview removeFromSuperview];
    [choseview1 removeFromSuperview];
    
}

//加载背景蒙板
-(void)showThebgview{
    bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [ScreenHelper SCREEN_WIDTH], [ScreenHelper SCREEN_HEIGHT])];
    bgView.backgroundColor=[UIColor blackColor];
    bgView.alpha=0;
    [self.view.window addSubview:bgView];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeTheView:)];
    tapGesture.numberOfTapsRequired=1;
    [bgView addGestureRecognizer:tapGesture];
    
    [UIView animateWithDuration:0.3 animations:^(){
        bgView.alpha=0.8;
    }completion:^(BOOL finished){
        
    } ];
}
//撤销背景蒙板
-(void)hidThebgview{
    
    [UIView animateWithDuration:0.3 animations:^(){
        bgView.alpha=0;
    }completion:^(BOOL finished){
        [bgView removeFromSuperview];
    } ];
}
-(void)setLeiXingSortWithName
{
    
    if ([_lab_type.text isEqualToString:@"交期由远到近"])
    {
        typeStr=@"PBDO_DeliveryTm";
        typeSort=@"asc";
        typeSortKey=@"PBDO_DeliveryTmSort";
        
        //        typeStr=@"PBDO_over_tm";
        //        typeSort=@"desc";
        //        typeSortKey=@"PBDO_over_tmSort";
    }
    else if ([_lab_type.text isEqualToString:@"交期由近到远"])
    {
        typeStr=@"PBDO_DeliveryTm";
        typeSort=@"desc";
        typeSortKey=@"PBDO_DeliveryTmSort";
        
        //        typeStr=@"PBDO_over_tm";
        //        typeSort=@"asc";
        //        typeSortKey=@"PBDO_over_tmSort";
    }
    else if ([_lab_type.text isEqualToString:@"下单日期由远到近"])
    {
        typeStr=@"PBDO_start_tm";
        typeSort=@"asc";
        typeSortKey=@"PBDO_start_tmSort";
    }
    else if ([_lab_type.text isEqualToString:@"下单日期由近到远"])
    {
        typeStr=@"PBDO_start_tm";
        typeSort=@"desc";
        typeSortKey=@"PBDO_start_tmSort";
    }
    else if ([_lab_type.text isEqualToString:@"交期由多到少"])
    {
        typeStr=@"PBDO_BuyNum";
        typeSort=@"asc";
        typeSortKey=@"PBDO_BuyNumSort";
        
    }
    else if ([_lab_type.text isEqualToString:@"交期由少到多"])
    {
        //        typeStr=@"PBDO_DeliveryTm";
        //        typeSort=@"desc";
        //        typeSortKey=@"PBDO_DeliveryTmSort";
        typeStr=@"PBDO_BuyNum";
        typeSort=@"descsc";
        typeSortKey=@"PBDO_BuyNumSort";
    }
    else if ([_lab_type.text isEqualToString:@"平方数由大到小"])
    {
        typeStr=@"PM";
        typeSort=@"asc";
        typeSortKey=@"PMSort";
    }
    else if ([_lab_type.text isEqualToString:@"平方数由小到大"])
    {
        typeStr=@"PM";
        typeSort=@"desc";
        typeSortKey=@"PMSort";
    }
    
    else if ([_lab_type.text isEqualToString:@"状态由远到近"])
    {
        typeStr=@"BOS_Num";
        typeSort=@"asc";
        typeSortKey=@"BOS_NumSort";
    }
    else if ([_lab_type.text isEqualToString:@"状态由近到远"])
    {
        typeStr=@"BOS_Num";
        typeSort=@"desc";
        typeSortKey=@"BOS_NumSort";
    }
    else
    {
        typeStr=@"";
        typeSort=@"";
        typeSortKey=@"";
    }
    
}
-(void)setCompanyDataWithNum:(NSString *)row
{
    if ([_lab_compan.text isEqualToString:@"全部"])
    {
        PBDO_CmpId=@"";
        
    }
    else
    {
        PBDO_CmpId=row;
        
    }
    
    
}
-(void)selectLeiXingWithNum:(NSString *)row
{
    //NSLog(@"AAAA___ %@",row);
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"type" ofType:@"plist"];
    NSArray  *arr = [[NSArray alloc] initWithContentsOfFile:plistPath];
    _lab_type.text=[arr objectAtIndex:[row intValue]];
    
    [self setLeiXingSortWithName];
    [self setCompanyDataWithNum:PBDO_CmpId];
    [self.tableView headerBeginRefreshing];
    
    // [self hidThebgview];
    // show=NO;
    [choseview removeFromSuperview];
    [choseview1 removeFromSuperview];
    _btn_type.selected=NO;
    _ima_type.image=[UIImage imageNamed:@"x_09.png"];
    
    _btn_compan.selected=NO;
    _ima_compan.image=[UIImage imageNamed:@"x_09.png"];
    
    
    
    
    
}
-(void)selectCompanyWithNum:(CompanyModel *)row
{
    NSLog(@"AAAA___ %@",row);
    _lab_compan.text=row.Jcmp_Nm;
    
    [self setCompanyDataWithNum:row.Jcmp_Id];
    [self setLeiXingSortWithName];
    
    [self.tableView headerBeginRefreshing];
    
    //  [self hidThebgview];
    //  show=NO;
    [choseview removeFromSuperview];
    [choseview1 removeFromSuperview];
    _btn_type.selected=NO;
    _ima_type.image=[UIImage imageNamed:@"x_09.png"];
    
    _btn_compan.selected=NO;
    _ima_compan.image=[UIImage imageNamed:@"x_09.png"];
    
    
    
}
-(void)refreshingDataList
{
    [self.tableView headerBeginRefreshing];
}
- (IBAction)selectAllPress:(id)sender {
    
    isChooseMode=!isChooseMode;
    if (isChooseMode) {
        for (XiaDanListModel *ListModel in dataArr) {
            ListModel.isSeleted=YES;
        }
        NSArray *cellArr=[self.tableView visibleCells];
        for (DingDanListCell *cell in cellArr) {
            // cell.accessoryType= UITableViewCellAccessoryCheckmark;
            
            cell.imaView.image =[UIImage imageNamed:@"remBtn.png"];
            cell.imaView.hidden=NO;
        }
        
        [self refreshLable];
    }
    else
    {
        for (XiaDanListModel *ListModel in dataArr) {
            ListModel.isSeleted=NO;
        }
        NSArray *cellArr=[self.tableView visibleCells];
        for (DingDanListCell *cell in cellArr) {
            cell.imaView.image =[UIImage imageNamed:@"unRemBtn.png"];
            cell.imaView.hidden=YES;
        }
        [self refreshLable];
    }
    
    
    //    if ([_rightBtn.title isEqualToString:@"全选"]) {
    //        [_rightBtn setTitle:@"取消"];
    //        isChooseMode=YES;
    //        for (XiaDanListModel *ListModel in dataArr) {
    //            ListModel.isSeleted=YES;
    //        }
    //        NSArray *cellArr=[self.tableView visibleCells];
    //        for (DingDanListCell *cell in cellArr) {
    //           // cell.accessoryType= UITableViewCellAccessoryCheckmark;
    //
    //            cell.imaView.image =[UIImage imageNamed:@"remBtn.png"];
    //            cell.imaView.hidden=NO;
    //        }
    //
    //        [self refreshLable];
    //
    //
    //    }
    //    else
    //    {
    //        [_rightBtn setTitle:@"全选"];
    //        isChooseMode=NO;
    //        for (XiaDanListModel *ListModel in dataArr) {
    //            ListModel.isSeleted=NO;
    //        }
    //        NSArray *cellArr=[self.tableView visibleCells];
    //        for (DingDanListCell *cell in cellArr) {
    //            cell.imaView.image =[UIImage imageNamed:@"unRemBtn.png"];
    //           cell.imaView.hidden=YES;
    //        }
    //         [self refreshLable];
    //    }
    
    
}
-(void)refreshLable
{
    int i=0;
    
    for (XiaDanListModel *ListModel in dataArr) {
        
        if ( ListModel.isSeleted) {
            i++;
        }
    }
    _lab_num.text=[NSString stringWithFormat:@"已选 %d条",i];
    
}
-(NSArray *)hasSelectSomeFPID{
    
    NSMutableArray *selectedModelArr=[NSMutableArray array];
    for (XiaDanListModel *shenheModel in dataArr) {
        if (shenheModel.isSeleted) {
            [selectedModelArr addObject:shenheModel];
        }
    }
    if (selectedModelArr.count>0) {
        return selectedModelArr;
    }
    
    return nil;
}
- (IBAction)pilingSelectPress:(id)sender {
    
    
    NSArray *arr=[self hasSelectSomeFPID];
    if (arr.count>0) {
        
        [self showThebgview];
        [UIView animateWithDuration:0.3 animations:^(){
            
            SelectView =[[PiliangSelectView alloc]  initWithFrame:CGRectMake(0, 100, [ScreenHelper SCREEN_WIDTH], 400)];
            [self.view.window addSubview:SelectView];
            SelectView.dataDelegate=self;
            SelectView.leiXingArr=[self hasSelectSomeFPID];
            [SelectView refreshTable];
        }];
    }
    else
    {
        [AlertHelper singleMBHUDShow:@"至少选择一条记录" ForView:self.view AndDelayHid:1];
        
    }
    
}
-(void)selectPilingWithNum:(NSString *)num
{
    [self hidThebgview];
    [AlertHelper MBHUDShow:@"下单中..." ForView:self.view AndDelayHid:30];
    [XiaDanWebAPI addPaperBoardTempOrderToBoardOrderPLWithPBID:num Suecss:^(NSArray * arr) {
        [AlertHelper hideAllHUDsForView:self.view];
        //  NSLog(@"AAAA________%@#",arr);
        if ([[arr[0] objectForKey:@"bool"]integerValue]==1)
        {
            [AlertHelper singleMBHUDShow:@"订单确认成功" ForView:self.view AndDelayHid:1];
            
            [self.tableView headerBeginRefreshing];
            [self refreshLable];
            
            
        }
        else
        {
            [AlertHelper singleMBHUDShow:@"网络错误" ForView:self.view AndDelayHid:1];
        }
        
        
    } fail:^{
        [AlertHelper hideAllHUDsForView:self.view];
        [AlertHelper singleMBHUDShow:@"网络请求数据失败" ForView:self.view AndDelayHid:1];
    }];
    //  NSLog(@"AAAA_ %@",num);
    
    
}


@end
