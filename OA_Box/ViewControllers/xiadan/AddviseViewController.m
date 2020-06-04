  //
//  AddviseViewController.m
//  OA_Box
//
//  Created by imac-1 on 2016/10/25.
//  Copyright © 2016年 魏艳丽. All rights reserved.
//

#import "AddviseViewController.h"
#import "ScreenHelper.h"
#import "AlertHelper.h"
#import "MJRefresh.h"
#import "User.h"
#import "XiaDanWebAPI.h"
#import "FeeBackModel.h"
#import "FeeBackViewCell.h"
#import "SendAddviseViewController.h"
@interface AddviseViewController ()<CommonNotification>
{

    NSString *state;
    NSMutableArray *dataArr;
    NSString *maxid;
}
@property (weak, nonatomic) IBOutlet UISegmentedControl *seg_state;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation AddviseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _seg_state.selectedSegmentIndex=0;
    state=@"1";
    dataArr=[NSMutableArray new];
    // dataNum=0;
    [self setupRefresh];
    
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
    [XiaDanWebAPI postAddviseWithCmgt_Id:[User standartUserInfo].Cmgt_Id  count:@"2" endCount:@""  FB_Type:state maxid:@""
                                    Suecss:^(NSArray *renwulist){
                                     //   NSLog(@"1111WWWWW%@",renwulist);
                                        [dataArr removeAllObjects];
                                        
                                        
                                        if (renwulist && renwulist.count>0) {
                                            NSDictionary *dict =[[NSDictionary alloc] initWithDictionary: renwulist[0]];
                                            NSArray *dictArr= [dict objectForKey:@"FeedBack"];
                                            for (NSDictionary *dict1 in dictArr) {
                                                FeeBackModel *model=[[FeeBackModel alloc]initWithDic:dict1];
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
        
        [XiaDanWebAPI postAddviseWithCmgt_Id:[User standartUserInfo].Cmgt_Id  count:@"2" endCount:[NSString stringWithFormat:@"%lu",(unsigned long)dataArr.count] FB_Type:state
         maxid:maxid
                                      Suecss:^(NSArray *renwulist){
                                       //   NSLog(@"1111WWWWW%@",renwulist);
                                         
                                          if ([[renwulist[0]objectForKey:@"bool"] intValue]==1) {
                                              
                                          
                                          
                                         
                                              NSDictionary *dict =[[NSDictionary alloc] initWithDictionary: renwulist[0]];
                                              NSArray *dictArr= [dict objectForKey:@"FeedBack"];
                                              for (NSDictionary *dict1 in dictArr) {
                                                    FeeBackModel *model=[[FeeBackModel alloc]initWithDic:dict1];
                                                    [dataArr addObject:model];
                                              }
                                              //  dataNum=dataArr .count ;
                                               maxid=dict[@"MaxId"];
                                          }
                                          else
                                          {
                                            //  NSLog(@"无数据");
                                          
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


- (IBAction)segConrolPress:(id)sender {
   
    if (_seg_state.selectedSegmentIndex==0) {
        state =@"1";
    }
    else if (_seg_state.selectedSegmentIndex==1)
    {
       state =@"2";
    
    }
    else
    {
      state=@"3";
    }
    [self.tableView headerBeginRefreshing];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    FeeBackModel *_khmodel = [dataArr objectAtIndex:indexPath.row];
    
    FeeBackViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"FeeBackViewCell" owner:nil options:nil];
        cell= [nibView lastObject];
        
    }
    cell.FB_BoardOrderNum.text=_khmodel.FB_BoardOrderNum;
    cell.FB_CmpNm.text=_khmodel.FB_CmpNm;
    cell.FB_ConductDate.text=_khmodel.FB_ConductDate;
    cell.FB_Content.text=_khmodel.FB_Content;
   
    cell.FB_Id.text=_khmodel.FB_Id;
    cell.FB_Reply.text=_khmodel.FB_Reply;
    cell.FB_SubmitDate.text=[self substringWithAstring:_khmodel.FB_SubmitDate];
    cell.FB_Type.text=_khmodel.FB_Type;
    
    return cell;
    
}
-(NSString *)substringWithAstring:(NSString *)str
{
    NSString *str1=@" ";
    NSRange range = [str rangeOfString:str1] ;
    NSString *time=[str substringToIndex:range.location];
    return time;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 212;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // segue.identifier：获取连线的ID
 if ([segue.identifier isEqualToString:@"fankuiVC"]) {
 // segue.destinationViewController：获取连线时所指的界面（VC）
     SendAddviseViewController *receive = segue.destinationViewController;
     receive.refreshNotification=self;
 // 这里不需要指定跳转了，因为在按扭的事件里已经有跳转的代码
 //		[self.navigationController pushViewController:receive animated:YES];
 }
 }
-(void)refreshingDataList
{
    [_seg_state setSelectedSegmentIndex:0];
    state =@"1";
   
    [self.tableView headerBeginRefreshing];
 

}

@end
