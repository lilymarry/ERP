   //
//  BannerView.m
//  OA_Box
//
//  Created by imac-1 on 2016/10/26.
//  Copyright © 2016年 魏艳丽. All rights reserved.
//

#import "BannerView.h"
#import "UIImageView+WebCache.h"
#import "ScreenHelper.h"  
#import "URL.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
@implementation BannerView
{
    UIImageView *netView;
    UILabel *mlbTitle;
    //  UILabel *iconLabel;
}

@synthesize delegate,OnClick;
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        self.backgroundColor = [UIColor lightGrayColor];
        netView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        netView.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:netView];
        
//        mlbTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, frame.size.height-25, SCREEN_WIDTH, 15.5)];
//        mlbTitle.backgroundColor = [UIColor clearColor];
//        mlbTitle.textAlignment = NSTextAlignmentCenter;
//        mlbTitle.font = [UIFont systemFontOfSize:15.5];
//        mlbTitle.textColor = [UIColor whiteColor];
//        [self addSubview:mlbTitle];
        
        
        UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
        but.frame = netView.bounds;
        but.backgroundColor = [UIColor clearColor];
        [but addTarget:self action:@selector(Click) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:but];
    }
    return self;
}
- (void)Click{
  //  NSLog(@"Click");
    if (delegate && OnClick) {
    //    self.delegate
   //   SafePerformSelector([delegate performSelector:OnClick withObject:self]);
   
      [delegate performSelector:OnClick withObject:self];
    }
}
- (void)LoadContent:(BannerModel *)info{
    self.mInfo = info;
  //  mlbTitle.text = info.title;
    //[netView sd_setImageWithURL:[NSURL URLWithString:info.focusimg]];
    NSString *str=[NSString stringWithFormat:@"%@/%@",kDomain,info.BA_Img];
    [netView sd_setImageWithURL:[NSURL URLWithString:str] placeholderImage:[UIImage imageNamed:@"lunbo_default_icon"]];
    
    
    
    //    if ([info.property isEqualToString:@"专题"]) {
    //        CGSize maximumSize =CGSizeMake(SCREEN_WIDTH-40,16);
    //        //CGSize dateStringSize =[mlbTitle.text sizeWithFont:mlbTitle.font constrainedToSize:maximumSize lineBreakMode:mlbTitle.lineBreakMode];
    //        NSStringDrawingOptions options =  NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    //        CGRect dateStringSize = [[[NSAttributedString alloc]initWithString:mlbTitle.text ] boundingRectWithSize:maximumSize options:options context:nil];
    //        iconLabel.frame = CGRectMake(SCREEN_WIDTH*0.5+dateStringSize.size.width*0.5+10, mlbTitle.frame.origin.y, 33, 15.5);
    //
    //        iconLabel.hidden = NO;
    //    }else{
    //        iconLabel.hidden = YES;
    //    }
}
- (void)dealloc{
    self.mInfo = nil;
}

@end
