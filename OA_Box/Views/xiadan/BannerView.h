//
//  BannerView.h
//  OA_Box
//
//  Created by imac-1 on 2016/10/26.
//  Copyright © 2016年 魏艳丽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BannerModel.h"
@interface BannerView : UIView
@property(nonatomic, assign)id delegate;
@property(nonatomic, assign)SEL OnClick;
@property(nonatomic, strong)BannerModel *mInfo;

- (void)LoadContent:(BannerModel *)info;
@end
