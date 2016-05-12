//
//  EmoTabBarButton.m
//  自定义TabBar的不规则图形
//
//  Created by Emo_Lin on 15/12/28.
//  Copyright © 2015年 linweida_emo. All rights reserved.
//

#import "EmoTabBarButton.h"
#import "EmoConst.h"
@implementation EmoTabBarButton

#pragma mark 返回TabBarItem按钮内部的文字边框
-(CGRect)titleRectForContentRect:(CGRect)contentRect  {
    
    return CGRectMake(0, contentRect.size.height * TabBarItemImageRatio - 5, contentRect.size.width, contentRect.size.height * (1-TabBarItemImageRatio));
}

# pragma mark 返回TabBarItem按钮内部的图片边框
-(CGRect)imageRectForContentRect:(CGRect)contentRect  {
    return CGRectMake(0, 0, contentRect.size.width, contentRect.size.height * TabBarItemImageRatio);
}

@end
