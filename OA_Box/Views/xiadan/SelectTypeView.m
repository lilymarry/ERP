//
//  SelectTypeView.m
//  OA_Box
//
//  Created by imac-1 on 2016/10/24.
//  Copyright © 2016年 魏艳丽. All rights reserved.
//

#import "SelectTypeView.h"
#import "ScreenHelper.h"
@implementation SelectTypeView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _leiXingArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identfier=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identfier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identfier];
        
    }
    cell.textLabel.text=_leiXingArr[indexPath.row];
    cell.textLabel.textColor=[UIColor colorWithRed:119/255.0 green:119/255.0 blue:119/255.0 alpha:1];
    return cell;
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.dataDelegate respondsToSelector:@selector(selectLeiXingWithNum:)])
    {
        [self.dataDelegate selectLeiXingWithNum:[NSString stringWithFormat: @"%ld",(long)indexPath.row]];
        //  [self.dataDelegate selectLeiXingWithNum:[NSString stringWithFormat: @"%d",i]];
        [self closingTheLittleMenu:nil];
    }
    
    
}
-(void)getdata
{
    _leiXingArr=[NSMutableArray array];
//    [BaoJingWebAPI requestBaoJIngLeiXingSuccess:^(NSArray *arr){
//        _leiXingArr =[NSMutableArray arrayWithArray:arr];
//        NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:@"全部",@"jblxnm", @"0",@"jblxid",nil];
//        [_leiXingArr insertObject:dic atIndex:0];
//        [_table reloadData];
//    } fail:^(){}];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"type" ofType:@"plist"];
    _leiXingArr = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
    
    
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
        UILabel *lab=[[UILabel alloc ] initWithFrame:CGRectMake(0, 0, frame.size.width, 44)];
        lab.backgroundColor = [UIColor groupTableViewBackgroundColor];
        lab.textAlignment=NSTextAlignmentLeft;
        lab.textColor=[UIColor lightGrayColor];
        lab.font =  [UIFont fontWithName:@"Arial" size:12.0f];
        lab.text=@" 选择要查询的类型";
        [self addSubview:lab];
        
        
        _table=[[UITableView alloc]initWithFrame:CGRectMake(0, 44, frame.size.width, frame.size.height-44)];
        _table.delegate=self;
        _table.dataSource=self;
        [self addSubview:_table];
        
        [self getdata];
    }
    
    return self;
}


@end
