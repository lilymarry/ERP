//
//  SelectedCaiZhiViewController.m
//  OA_Box
//
//  Created by imac-1 on 2017/4/13.
//  Copyright © 2017年 魏艳丽. All rights reserved.
//

#import "SelectedCaiZhiViewController.h"
#import "CaiZhiModel.h"
@interface SelectedCaiZhiViewController ()
{
    NSMutableArray *allData;
    NSDictionary *selectData;
   
}
@end

@implementation SelectedCaiZhiViewController

-(id)initWithBlock:(finishBlock)ablock
{
    if (self=[super init]) {
        _block=[ablock copy];
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
 //   self.tableView.allowsMultipleSelection=YES;
    
      allData=[NSMutableArray array];
    NSString *docPath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *path=[docPath stringByAppendingPathComponent:@"person.text"];
    
   // NSLog(@"WWW %@",path);
    //3.将自定义的对象保存到文件中
    //  [NSKeyedArchiver archiveRootObject:p1 toFile:path];
    allData = [NSMutableArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithFile:path] ];
  
   // NSLog(@"SSSSS %@",allData);
    [self.tableView reloadData];
    
    [self.navigationItem setTitle:@"常用纸质"];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return allData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ident=@"PersonCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
   
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
    }
    CaiZhiModel *model=[allData objectAtIndex:indexPath.row];
    cell.textLabel.text=model.zhilei;
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
         return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     CaiZhiModel *model=[allData objectAtIndex:indexPath.row];
    if (_block)
    {
        _block(model);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
