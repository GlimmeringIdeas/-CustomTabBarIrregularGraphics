//
//  EmoTabBar.m
//  自定义TabBar的不规则图形
//
//  Created by Emo_Lin on 15/12/28.
//  Copyright © 2015年 linweida_emo. All rights reserved.
//

#import "EmoTabBar.h"
#import "EmoConst.h"
#import "EmoOneViewController.h"
#import "EmoTwoViewController.h"
#import "EmoMiddleViewController.h"
#import "EmoFourViewController.h"
#import "EmoFiveViewController.h"
@interface EmoTabBar()

@property(nonatomic , strong) EmoTabBarButton * selectedTabBarButton;

@end

@implementation EmoTabBar

-(instancetype)initWithFrame:(CGRect)frame  {
    self = [super initWithFrame:frame];
    if (self) {
        [self createTabBarButton];
    }
    return self;
}

-(void)createTabBarButton {
    for (int i = 0; i < 5; i++) {
        EmoTabBarButton * button = [[EmoTabBarButton alloc] init];
        CGFloat buttonW = self.frame.size.width / 5;
        CGFloat buttonX = i * buttonW;
        CGFloat buttonY = 0;
        CGFloat buttonH = self.frame.size.height;
        button.frame = CGRectMake(buttonX , buttonY , buttonW , buttonH);
        NSString * title;
        
        if (i == 0) {
            title = @"第一个";
            [button setImage:[UIImage imageNamed:@"tabbar_information_up"] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"tabbar_information_down"] forState:UIControlStateSelected];
            [button addTarget:self action:@selector(OneButton:) forControlEvents:UIControlEventTouchDown];
            
        } else if (i == 1) {
            title = @"第二个";
            [button setImage:[UIImage imageNamed:@"tabbar_question_up"] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"tabbar_question_down"] forState:UIControlStateSelected];
            [button addTarget:self action:@selector(TwoButton:) forControlEvents:UIControlEventTouchDown];
        } else if (i == 3) {
            title = @"第四个";
            [button setImage:[UIImage imageNamed:@"tabbar_message_up"] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"tabbar_message_down"] forState:UIControlStateSelected];
            [button addTarget:self action:@selector(FourButton:) forControlEvents:UIControlEventTouchDown];
        } else if (i == 4) {
            title = @"第五个";
            [button setImage:[UIImage imageNamed:@"tabbar_profile_up"] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"tabbar_profile_down"] forState:UIControlStateSelected];
            [button addTarget:self action:@selector(FiveButton:) forControlEvents:UIControlEventTouchDown];
        }
        button.tag = 1100 + i;
        button.imageView.contentMode = UIViewContentModeCenter;
        if (i != 2) {
            [button setTitle:title forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize: 11.0];
            button.titleLabel.textAlignment = NSTextAlignmentCenter;
            [button setTitleColor:RGB(84, 171, 182) forState:UIControlStateSelected];
            [button setTitleColor:RGB(180 , 180, 180) forState:UIControlStateNormal];
            [self addSubview:button];
        }
    }
}

-(void)OneButton:(UIButton *)button {
    [self.delegate changeNavigationBar:_selectedTabBarButton.tag to:button.tag title:@"第一个"];
    _selectedTabBarButton.selected = NO;
    button.selected = YES;
    _selectedTabBarButton = (EmoTabBarButton *)button;
    
}
-(void)TwoButton:(UIButton *)button {
    [self.delegate changeNavigationBar:_selectedTabBarButton.tag to:button.tag title:button.titleLabel.text];
    _selectedTabBarButton.selected = NO;
    button.selected = YES;
    _selectedTabBarButton = (EmoTabBarButton *)button;
    NSLog(@"TwoButton");
}
-(void)FourButton:(UIButton *)button {
    [self.delegate changeNavigationBar:_selectedTabBarButton.tag to:button.tag title:button.titleLabel.text];
    _selectedTabBarButton.selected = NO;
    button.selected = YES;
    _selectedTabBarButton = (EmoTabBarButton *)button;
    NSLog(@"FourButton");
}
-(void)FiveButton:(UIButton *)button {
    [self.delegate changeNavigationBar:_selectedTabBarButton.tag to:button.tag title:button.titleLabel.text];
    _selectedTabBarButton.selected = NO;
    button.selected = YES;
    _selectedTabBarButton = (EmoTabBarButton *)button;
    NSLog(@"FiveButton");
}


@end
