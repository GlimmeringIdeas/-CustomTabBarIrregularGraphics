//
//  EmoTabBar.h
//  自定义TabBar的不规则图形
//
//  Created by Emo_Lin on 15/12/28.
//  Copyright © 2015年 linweida_emo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "EmoTabBarButton.h"
#import "EmoConst.h"
@protocol EmoTabBarDelegate <NSObject>

@required

-(void)changeNavigationBar:(NSInteger)from to:(NSInteger)to title:(NSString *)title;

@end

@interface EmoTabBar : UIView

@property (nonatomic , weak)id<EmoTabBarDelegate>delegate;

@end