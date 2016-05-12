//
//  EmoTabBarController.m
//  自定义TabBar的不规则图形
//
//  Created by Emo_Lin on 15/12/28.
//  Copyright © 2015年 linweida_emo. All rights reserved.
//

#import "EmoTabBarController.h"
#import "EmoOneViewController.h"
#import "EmoTwoViewController.h"
#import "EmoMiddleViewController.h"
#import "EmoFourViewController.h"
#import "EmoFiveViewController.h"
#import "EmoTabBar.h"
#import "EmoConst.h"
@interface EmoTabBarController ()<UINavigationControllerDelegate , EmoTabBarDelegate>

@end

@implementation EmoTabBarController

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        for (UINavigationController * navVC in self.viewControllers ) {
            navVC.delegate = self;
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.hidden = YES;
    // 创建 view 尺寸等于系统的 tabbbar
    EmoTabBar * tabbar = [[EmoTabBar alloc] initWithFrame:self.tabBar.bounds];
    tabbar.delegate = self;
    CGRect frame = tabbar.frame;
    tabbar.frame = CGRectMake(0, self.view.frame.size.height - TabBarHeight, frame.size.width, TabBarHeight);
    self.mytabbar = tabbar;
    tabbar.backgroundColor = RGB(240 ,240,240);
    [self.view addSubview:tabbar];
    
    self.MiddleButtonView =[[UIView alloc]init];
    self.MiddleButtonView.center = CGPointMake(SCREEN_WIDTH*0.5, SCREEN_HEIGHT-(MiddleTabBarViewHeight*0.5));
    self.MiddleButtonView.bounds =CGRectMake(0, 0, MiddleTabBarViewWidth,MiddleTabBarViewHeight);
    
    self.MiddleBtn = [[UIButton alloc] init];
    [self.MiddleBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_modifycar_up"] forState:UIControlStateNormal];
    [self.MiddleBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_modifycar_down"] forState:UIControlStateHighlighted];
    self.MiddleBtn.frame = CGRectMake(0, 0, MiddleTabBarViewWidth, MiddleTabBarViewHeight);
    self.MiddleBtn.tag = 1102;
    [self.MiddleBtn addTarget:self action:@selector(modifyCarAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.MiddleButtonView addSubview:self.MiddleBtn];
    [self.view addSubview:self.MiddleButtonView];
}

-(void)modifyCarAction:(UIButton *)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)changeNavigationBar:(NSInteger)from to:(NSInteger)to title:(NSString *)title{
    self.selectedIndex = to;
    self.title = title;
}

#pragma mark navVC代理
-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    UIViewController * root = navigationController.viewControllers.firstObject;
    if (viewController != root) {
        // 更改导航控制器的高度
        navigationController.view.frame = self.view.bounds;
        // 从 HomeViewController 移除
        [self.mytabbar removeFromSuperview];
        [self.MiddleButtonView removeFromSuperview];
        // 调整 tabbar的 Y 值
        CGRect dockFrame = self.mytabbar.frame;
        CGRect MiddleButtonViewFrame = self.MiddleButtonView.frame;
        if ([root.view isKindOfClass:[UIScrollView class]]) {
            UIScrollView * scrollview = (UIScrollView *)root.view;
            dockFrame.origin.y = scrollview.contentOffset.y + root.view.frame.size.height - TabBarHeight;
            MiddleButtonViewFrame.origin.y = scrollview.contentOffset.y + root.view.frame.size.height - TabBarHeight - (MiddleTabBarViewHeight - MiddleTabBarViewWidth);
        } else {
            MiddleButtonViewFrame.origin.y = root.view.frame.size.height - MiddleTabBarViewHeight;
            dockFrame.origin.y = root.view.frame.size.height - TabBarHeight;
        }
        self.mytabbar.frame = dockFrame;
        self.MiddleButtonView.frame =MiddleButtonViewFrame;
        // 添加 dock到根控制器界面
        [root.view addSubview:self.mytabbar];
        [root.view addSubview:self.MiddleButtonView];
    }
}

-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    UIViewController * root = navigationController.viewControllers[0];
    if (viewController == root) {
        // 更改导航控制器view 的 frame
        navigationController.view.frame = ContentFrame;
        // 让 Dock从root 上移除
        [self.mytabbar removeFromSuperview];
        [self.MiddleButtonView removeFromSuperview];
        //mytabbar 添加 dock 到 HomeViewController
        self.mytabbar.frame = DockFrame;
        [self.view addSubview:self.mytabbar];
        self.MiddleButtonView.center = CGPointMake(SCREEN_WIDTH*0.5, SCREEN_HEIGHT-(MiddleTabBarViewHeight*0.5));
        self.MiddleButtonView.bounds  =CGRectMake(0, 0, MiddleTabBarViewWidth, MiddleTabBarViewHeight);
        [self.view addSubview:self.MiddleButtonView];
    }
}

@end
