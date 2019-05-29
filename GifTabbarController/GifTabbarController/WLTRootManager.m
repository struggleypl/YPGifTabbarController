//
//  WLTRootManager.m
//  Wallet
//
//  Created by ypl on 2018/12/11.
//  Copyright © 2018年 JiuXi Technology. All rights reserved.
//

#import "WLTRootManager.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "GifTab/GifTabBarController/GifTabBarHeader.h"
#import "WLTNavigationBar.h"

@interface WLTRootManager ()
@property (nonatomic , weak) GifTabBarController *tabbarController;
@end

@implementation WLTRootManager
+ (instancetype)manager {
    static WLTRootManager* shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

+ (GifTabBarController *)rootViewController {
    
    UIViewController *first = [[FirstViewController alloc] init];
    SecondViewController *third = [[SecondViewController alloc] init];
    ThirdViewController *fourth = [[ThirdViewController alloc] init];
    
    NSURL *url1 = [[NSBundle mainBundle] URLForResource:@"btn_overview" withExtension:@"gif"];
//    NSURL *url2 = [[NSBundle mainBundle] URLForResource:@"btn_transfer" withExtension:@"gif"];
    NSURL *url3 = [[NSBundle mainBundle] URLForResource:@"btn_fx" withExtension:@"gif"];
    NSURL *url4 = [[NSBundle mainBundle] URLForResource:@"btn_mine" withExtension:@"gif"];

    GifTabBarItem *oneTabBarItem = [[GifTabBarItem alloc]initWithTitle:@"首页" gifUrlString:[url1 absoluteString] navigation:[self navigation:first] viewController:first normalImage:[UIImage imageNamed:@"tabbar_overview_normal"] selectedImage:[UIImage imageNamed:@"tabbar_overview_select"]];
    
//    GifTabBarItem *twoTabBarItem = [[GifTabBarItem alloc]initWithTitle:WLTString(@"Tabbar_Transaction") gifUrlString:[url2 absoluteString] navigation:[self navigation:second] viewController:second normalImage:[UIImage imageNamed:@"tabbar_transaction_normal"] selectedImage:[UIImage imageNamed:@"tabbar_transaction_select"]];
    
    GifTabBarItem *threeTabBarItem = [[GifTabBarItem alloc]initWithTitle:@"发现" gifUrlString:[url3 absoluteString] navigation:[self navigation:third] viewController:third normalImage:[UIImage imageNamed:@"tabbar_find_normal"] selectedImage:[UIImage imageNamed:@"tabbar_find_select"]];
    
    GifTabBarItem *fourTabBarItem = [[GifTabBarItem alloc]initWithTitle:@"我的" gifUrlString:[url4 absoluteString] navigation:[self navigation:fourth] viewController:fourth normalImage:[UIImage imageNamed:@"tabbar_mine_normal"] selectedImage:[UIImage imageNamed:@"tabbar_mine_select"]];
    
    NSArray *tabItems = @[oneTabBarItem,threeTabBarItem,fourTabBarItem];
    
    GifTabBarController *tab = [[GifTabBarController alloc] initWithTabItems:tabItems];
    
    [WLTRootManager manager].tabbarController = tab;
    
//    [tab.tabBar setShadowImage:[self imageWithColor:UIColorFromRGB(0xE5E5E5) size:CGSizeMake(SCREEN_WIDTH, 0.5)]];
    [tab.tabBar setBackgroundImage:[UIImage new]];
    
    return tab;
}

+ (UINavigationController *)navigation:(UIViewController *)VC {
    UINavigationController *nav  = [[UINavigationController alloc] initWithNavigationBarClass:WLTNavigationBar.class toolbarClass:nil];
    nav.viewControllers =  @[VC];
    return nav;
}

//根据颜色生成图片的函数
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();return image;
}
@end
