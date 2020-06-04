//
//  SelectComViewController.m
//  Re-OA
//
//  Created by admin on 16/3/17.
//  Copyright © 2016年 姜任鹏. All rights reserved.
//

#import "SelectComViewController.h"
#import "CompanyModel.h"
#import "User.h"
#import "XiaDanWebAPI.h"
#import "AddDingdanViewController.h"
#import "AlertHelper.h"
#import "AddDinDanViewController.h"
@interface SelectComViewController ()
{
    NSMutableArray *data;
}
@end

@implementation SelectComViewController

- (void)viewDidLoad {
    [super viewDidLoad];
       self.navigationItem.title=@"订单商户";
    
    data=[NSMutableArray array];
 //   NSLog(@"WWWW %@",[User standartUserInfo].Cmgt_Id);
    [AlertHelper MBHUDShow:@"加载中..." ForView:self.view AndDelayHid:30];

    [XiaDanWebAPI getJoinCompanyWithCmgt_Id:[User standartUserInfo].Cmgt_Id Suecss:^(NSArray *arr){
       [AlertHelper hideAllHUDsForView:self.view];
        [data removeAllObjects];
      //  NSLog(@"WWWW %@",arr);

        
        @try {
            NSArray *ar=arr[0][@"GOI_JoinCompany"];
            for (NSDictionary *dic in ar ) {
                CompanyModel *model=[[CompanyModel alloc]initWithDic:dic];
                [data addObject:model];
            }
          
        } @catch (NSException *exception) {
            
        } @finally {
            [self.tableView reloadData];
        }
      //  NSLog(@"WWWW %@",arr);
    } fail:^(){
        [AlertHelper hideAllHUDsForView:self.view];

      [AlertHelper singleMBHUDShow:@"网络请求数据失败" ForView:self.view AndDelayHid:1];
    
    
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell)
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    CompanyModel *model=[ data objectAtIndex:indexPath.row];
    cell.textLabel.text= model.Jcmp_Nm;
     cell.textLabel.textColor=[UIColor darkGrayColor];
//    cell.detailTextLabel.text=model.Jcmp_Code;
//    cell.detailTextLabel.font=[UIFont systemFontOfSize:10];
//    cell.detailTextLabel.textColor=[UIColor lightGrayColor];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CompanyModel *model=[ data objectAtIndex:indexPath.row];
//    UIStoryboard *s = [UIStoryboard storyboardWithName:@"XiaDan" bundle:[NSBundle mainBundle]];
//    AddDingdanViewController *changyongController = [s instantiateViewControllerWithIdentifier:@"AddDinDan"];
    UIStoryboard *s = [UIStoryboard storyboardWithName:@"AddDingdan" bundle:[NSBundle mainBundle]];
    AddDinDanViewController *changyongController = [s instantiateViewControllerWithIdentifier:@"AddDinDan"];
    changyongController.model=model;
    changyongController.state=@"0";
    [self.navigationController pushViewController:changyongController animated:YES];

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}


@end
