//
//  DingDanListViewController.m
//  Re-OA
//
//  Created by admin on 16/4/26.
//  Copyright © 2016年 姜任鹏. All rights reserved.
//

#import "DingDanListViewController.h"
#import "AlertHelper.h"
#import "XiaDanWebAPI.h"
#import "XiaDanListCell.h"
#import "XiaDanListModel.h"

//#import "ShenHeChooseView1.h"
#import "ScreenHelper.h"
//#import "YiShenHeDetailViewController.h"
#import "MJRefresh.h"
#import "User.h"
#import "DingDanDetailViewController.h"
#import "XiaDanDetailCell.h"
#import "AddDingdanViewController.h"

#import "XiaDanListParentCell.h"
#import "XiaDanDetailCell.h"
#import "XiaDanFlowModel.h"
#import "XiaDanFlowCell.h"
//#import "CharacterHelper.h"
//#import "TimePicker.h"
@interface DingDanListViewController ()<tapDetailDelegate>
{
    NSMutableArray *dataArr;
    //    int selectedTag;
    //    UIView *bgView ; //遮罩层
    //    NSString *typeidStr;
    //   // ShenHeChooseView1 *choseview;
    //
    //    NSString *perid;
    NSString *maxid;
    NSMutableArray *liuchengArr;
    
    // int  dataNum;
    //    NSString *etim;
    //
    //    NSString *Stitt;
}

@end

@implementation DingDanListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dataArr=[NSMutableArray new];
    // dataNum=0;
    [self setupRefresh];
    
    // self.tableView setta
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)viewWillAppear:(BOOL)animated
{  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tongzhi:) name:@"selectItem" object:nil];
}
- (void)tongzhi:(NSNotification *)text{
    NSLog(@"%@",text.userInfo);
  //  NSLog(@"－－－－－接收到通知------");
  //  _khmodel=text.userInfo[@"data"];
    // [self  getFlowData];
   // _tabView.hidden=NO;
   // [_tabView reloadData];
    
}

- (void)setupRefresh
{
    
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    [self.tableView headerBeginRefreshing];
    // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [self.tableView addFooterWithTarget:self action:@selector(footerRereshing)];
}

#pragma mark 开始进入刷新状态
- (void)headerRereshing
{
    
    [XiaDanWebAPI getPaperOrderWithCmgt_Id:[User standartUserInfo].Cmgt_Id count:@"2" endCount:@"0" maxId:@""
                                    Suecss:^(NSArray *renwulist){
                                        NSLog(@"1111WWWWW%@",renwulist);
                                        [dataArr removeAllObjects];
                                        
                                        
                                        if (renwulist && renwulist.count>0) {
                                            NSDictionary *dict =[[NSDictionary alloc] initWithDictionary: renwulist[0]];
                                            NSArray *dictArr= [dict objectForKey:@"PaperBoardOrder"];
                                            for (NSDictionary *dict1 in dictArr) {
                                                XiaDanListModel *model=[[XiaDanListModel alloc]initWithDic:dict1];
                                                [dataArr addObject:model];
                                            }
                                            //  dataNum=dataArr .count ;
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
        [self setAllChildViewHidden];
        [XiaDanWebAPI getPaperOrderWithCmgt_Id:[User standartUserInfo].Cmgt_Id count:@"2" endCount:[NSString stringWithFormat:@"%lu",(unsigned long)dataArr.count] maxId:maxid
                                        Suecss:^(NSArray *renwulist){
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return dataArr.count;
    // return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section==0) {
        return 1;
    }
    else
    {
        return 2;
        //  return liuchengArr.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row==0) {
        
        
        XiaDanListModel *_khmodel = [dataArr objectAtIndex:indexPath.section];
        
        if (_khmodel.isChild) {
            XiaDanDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"zhidetail"];
            if (!cell) {
                NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"XiaDanDetailCell" owner:nil options:nil];
                cell= [nibView lastObject];
                
            }
            cell.PBDO_ClientNm.text=_khmodel.PBDO_OrderCode;
            
            cell.PBDO_CmpNm.text=_khmodel.PBDO_CmpNm;
            cell.PBDO_POST_Nm.text=_khmodel.PBDO_POST_Nm;
            cell.PBDO_Long.text=[NSString stringWithFormat:@"%@mm x %@mm",_khmodel.PBDO_Long,_khmodel.PBDO_Width];
            cell.PBDO_BuyCode.text=_khmodel.PBDO_BuyCode;
            cell.PBDO_PBNm.text=_khmodel.PBDO_PBCorrugatedLine;
            
            cell.PBDO_I_PmNm.hidden=[self setlabHidden:_khmodel.PBDO_I_PmNm];
            cell.PBDO_II_PmNm.hidden=[self setlabHidden:_khmodel.PBDO_II_PmNm];
            cell.PBDO_III_PmNm.hidden=[self setlabHidden:_khmodel.PBDO_III_PmNm];
            cell.PBDO_IV_PmNm.hidden=[self setlabHidden:_khmodel.PBDO_IV_PmNm];
            cell.PBDO_V_PmNm.hidden=[self setlabHidden:_khmodel.PBDO_V_PmNm];
            cell.PBDO_VI_PmNm.hidden=[self setlabHidden:_khmodel.PBDO_VI_PmNm];
            cell.PBDO_VII_PmNm.hidden=[self setlabHidden:_khmodel.PBDO_VII_PmNm];
            
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
            cell.PBDO_PPTnm.text=_khmodel.PBDO_Plate;
            cell.PBDO_DeliveryTm.text=_khmodel.PBDO_DeliveryTm;
            cell.PBDO_Note.text=_khmodel.PBDO_Note;
            
            return cell;
            
            
            
            
        }else{
            
            
            XiaDanListParentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XiaDanListParentCell"];
            if (!cell) {
                NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"XiaDanListParentCell" owner:nil options:nil];
                cell= [nibView lastObject];
                cell.delegate=self;
                
                
            }
            cell.model=_khmodel;
            cell.indexPath=indexPath;
            cell.lab_caizhi.text=_khmodel.PBDO_PaperNumber;
            cell.lab_num.text=_khmodel.PBDO_BuyNum;
            cell.lab_chicun.text=[NSString stringWithFormat:@"%@mm x %@mm",_khmodel.PBDO_Long,_khmodel.PBDO_Width];
            cell.lab_time.text=_khmodel.PBDO_start_tm;
            [cell.btn_state setTitle:_khmodel.state forState:UIControlStateNormal];
            
            return cell;
        }
    }
    else
    {
        XiaDanFlowCell *cell = [tableView dequeueReusableCellWithIdentifier:@"flowcell1"];
        if (!cell) {
            NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"XiaDanFlowCell" owner:nil options:nil];
            cell= [nibView lastObject];
        }
        
        XiaDanFlowModel *model = [liuchengArr objectAtIndex:indexPath.row-1];
        if (indexPath.row==liuchengArr.count) {
            cell.ima_stateView.image=[UIImage imageNamed:@"endcircle.png"];
            cell.lab_on.hidden=YES;
            
        }
        else
        {   cell.ima_stateView.image=[UIImage imageNamed:@"ingcircle.png"];
            cell.lab_on.hidden=NO;
            
        }
        cell.State.text=@"dfhdsfhdshfjd";
        //cell.State.text=model.State;
        cell.Remark.text=model.Remark;
        cell.SetTime.text= [self substringWithAstring:model.SetTime];
        return cell;
        
        
        
    }
}
-(NSString *)substringWithAstring:(NSString *)str
{
    NSString *str1=@" ";
    NSRange range = [str rangeOfString:str1] ;
    NSString *time=[str substringToIndex:range.location];
    return time;
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
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//    XiaDanListModel *model=[ dataArr objectAtIndex:indexPath.row];
//  //  model.isExist 除了1都可以修改
//    if (![model.isExist isEqualToString:@"1"]) {
//        //修改订单
//        UIStoryboard *s = [UIStoryboard storyboardWithName:@"XiaDan" bundle:[NSBundle mainBundle]];
//        AddDingdanViewController *changyongController = [s instantiateViewControllerWithIdentifier:@"AddDinDan"];
//        changyongController.khmodel=model;
//        changyongController.state=@"1";
//        [self.navigationController pushViewController:changyongController animated:YES];
//
//    }
//    else
//    {
//    UIStoryboard *s = [UIStoryboard storyboardWithName:@"XiaDan" bundle:[NSBundle mainBundle]];
//    DingDanDetailViewController *changyongController = [s instantiateViewControllerWithIdentifier:@"DingDanDetail"];
//    changyongController.khmodel=model;
//    [self.navigationController pushViewController:changyongController animated:YES];
//    }
//
//}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        XiaDanListModel *model = [dataArr objectAtIndex:indexPath.section];
        
        if (model.isChild) {
            return 439;
        }else{
            return 110;
        }
        
    }
    else
    {
        
        return 74;
    }
    
    
    
}
- (void)getFlowData:(id)model andIndes:(NSIndexPath *)index
{
    NSLog(@"fdsfhjg");
    XiaDanListModel *parentModel=model;
    [XiaDanWebAPI getPapaerOrderLocusWithOrderCode:parentModel.PBDO_OrderCode Suecss:^(NSArray *arr){
        //NSLog(@"AAAA________%@#",arr);
        NSArray *da=arr[0][@"PaperBoardOrderState"];
        for (int i=0; i<da.count; i++) {
            XiaDanFlowModel *model=[[XiaDanFlowModel alloc]initWithDic:da[i]];
            [liuchengArr addObject:model];
        }
        
        
        [self.tableView reloadData];
    } fail:^(){}];
    
    
}
-(void)getDetail:(id)model andIndes:(NSIndexPath *)index
{
    NSLog(@"1111111");
    
    XiaDanListModel *parentModel=model;
    if (parentModel.isChild==NO) {
        parentModel.isExpended= !parentModel.isExpended? YES:NO;
        
        NSIndexPath *newIndexPath= [NSIndexPath indexPathForRow:0 inSection:index.section+1];
        
        if (parentModel.isExpended) {
            XiaDanListModel *childModel= [parentModel copy];
            childModel.isChild=YES;
            [dataArr insertObject:childModel atIndex:index.section+1];
            
            [self.tableView beginUpdates];
            
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:newIndexPath.section] withRowAnimation:UITableViewRowAnimationTop];
    
         //   [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationTop];
            [self.tableView endUpdates];
            
        }else{
            [dataArr removeObjectAtIndex:index.section+1];
            NSIndexPath *newIndexPath= [NSIndexPath indexPathForRow:0 inSection:index.section+1];
            
            [self.tableView beginUpdates];
          //  [self.tableView  deleteRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationTop];
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:newIndexPath.section] withRowAnimation:UITableViewRowAnimationTop];
            [self.tableView endUpdates];
        }
        
    }
    
    
}
-(void)setAllChildViewHidden
{
    NSMutableArray *arr=[NSMutableArray arrayWithArray:dataArr];
    
    for (int i=0; i<dataArr.count; i++) {
        XiaDanListModel *parentModel=[dataArr objectAtIndex:i];
        
        if (parentModel.isChild==YES) {
            [arr removeObject:parentModel];
        }
    }
    dataArr =arr;
    [self.tableView reloadData];
    
}
/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
