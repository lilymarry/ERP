//
//  TuiHuoViewController.m
//  OA_Box
//
//  Created by imac-1 on 2016/10/28.
//  Copyright © 2016年 魏艳丽. All rights reserved.
//

#import "TuiHuoViewController.h"
#import "XiaDanWebAPI.h"
#import "TuiHuoModel.h"
#import "TuiHuoCell.h"
#import "AlertHelper.h"
@interface TuiHuoViewController ()
{
    NSMutableArray *dataArr;

}
@end

@implementation TuiHuoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dataArr=[NSMutableArray new];
      self.navigationItem.title=@"退货单";
     [AlertHelper MBHUDShow:@"加载中..." ForView:self.view AndDelayHid:30];
    [XiaDanWebAPI GetRefundReplenishment:_khmodel.OrderCode webcode:_khmodel.PBDO_OrderCode Suecss:^(NSArray * arr) {
      //  NSLog(@"AA___XX %@",arr);
        [AlertHelper hideAllHUDsForView:self.view];
        [dataArr removeAllObjects];
        
        
        if ([[arr[0] objectForKey:@"bool"]integerValue]==1)
        {            NSDictionary *dict =[[NSDictionary alloc] initWithDictionary: arr[0]];
            NSArray *dictArr= [dict objectForKey:@"PaperBoardReturn"];
            for (NSDictionary *dict1 in dictArr) {
                TuiHuoModel *model=[[TuiHuoModel alloc]initWithDic:dict1];
                [dataArr addObject:model];
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

    } fail:^{
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
    return dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    TuiHuoModel *model = [dataArr objectAtIndex:indexPath.row];
    
    TuiHuoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TuiHuoCell"];
    if (!cell) {
        NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"TuiHuoCell" owner:nil options:nil];
        cell= [nibView lastObject];
        
    }
    cell.Amount.text=model.Amount;
    cell.Code.text=model.Code;
    cell.Date.text=model.Date;
    cell.DeliveryCode.text=model.DeliveryCode;
    
    cell.Freight.text=model.Freight;
    cell.FreightSquare.text=model.FreightSquare;
    cell.Money.text=model.Money;
    cell.OrderCode.text=model.OrderCode;
    
    cell.PricePaperBoard.text=model.PricePaperBoard;
    cell.Reason.text=model.Reason;
    cell.ZHJG.text=model.ZHJG;

    
  
    
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
    return 219;
    
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
