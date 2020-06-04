//
//  CarInMapViewController.m
//  Re-OA
//
//  Created by imac-1 on 16/8/29.
//  Copyright © 2016年 姜任鹏. All rights reserved.
//

#import "CarInMapViewController.h"
#import <BMapKit.h>
#import "MyAnnotation.h"
#import "XiaDanWebAPI.h"
#import "CarModel.h"
#import "AlertHelper.h"
@interface CarInMapViewController ()<BMKGeoCodeSearchDelegate>
{
    BMKMapView *_mapView;
    BMKGeoCodeSearch* _geocodesearch;
    CarModel* carModel;
    
}
@end

@implementation CarInMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.navigationItem.title=@"位置查看";
    
    _mapView=[[BMKMapView alloc]init];
    _mapView.frame=CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height);
    _mapView.mapType=BMKMapTypeStandard;
    _mapView.rotateEnabled=YES;
    [self.view addSubview:_mapView];
    [AlertHelper MBHUDShow:@"加载中..." ForView:self.view AndDelayHid:30];
 
    [XiaDanWebAPI getCarGPSPBDO_CmpId:_PBDO_CmpId CarNum:_carNum Suecss:^(NSArray *arr){
        // NSLog(@"AAAA %@",arr);
         [AlertHelper hideAllHUDsForView:self.view];
        NSArray *da=arr[0][@"MapCarLocus"];
            //    NSLog(@"AAAA %@",da);
        

      carModel=[[CarModel alloc]initWithDic:da[0]];
       CLLocationCoordinate2D loca2D = CLLocationCoordinate2DMake([carModel.latitude doubleValue], [carModel.longitude doubleValue]);
        
        BMKCoordinateRegion region;
        
        region.center=loca2D;
        region.span=BMKCoordinateSpanMake(0.04, 0.04);
        [_mapView setRegion:region];
        
        BMKReverseGeoCodeOption *reverseGeocodeSearchOption = [[BMKReverseGeoCodeOption alloc]init];
        reverseGeocodeSearchOption.reverseGeoPoint = loca2D;
        _geocodesearch =[[BMKGeoCodeSearch alloc]init];
        _geocodesearch.delegate=self;
        BOOL flag = [_geocodesearch reverseGeoCode:reverseGeocodeSearchOption];
        if(flag)
        {
           // NSLog(@"sccuess");
        }
        else
        {
           //                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          (@"err");
        }
  
    
    } fail:^{
        [AlertHelper hideAllHUDsForView:self.view];
        
        [AlertHelper singleMBHUDShow:@"网络请求数据失败" ForView:self.view AndDelayHid:1];
    
    }];


}
-(void) onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error
{
    
    NSArray* array = [NSArray arrayWithArray:_mapView.annotations];
    [_mapView removeAnnotations:array];
    MyAnnotation *ann=[[MyAnnotation alloc]initWithCoordinate:result.location title:carModel.userName subtitle:result.address ];
    [_mapView addAnnotation:ann];
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
