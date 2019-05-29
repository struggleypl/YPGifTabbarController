//
//  GifTabBarItem.h
//  GifTabBarController
//
//  Created by ypl on 2018/12/10.
//  Copyright © 2018年 ypl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GifTabBarItem : UITabBarItem
@property (nonatomic, assign) UIViewController *viewController;
@property (nonatomic) UINavigationController *navigation;
@property (nonatomic) NSString *tabTitle;
@property (nonatomic) NSString *gifUrlString;
@property (nonatomic) UIImage *normalImage;
@property (nonatomic) UIImage *selectedGifImage;

- (instancetype)initWithTitle:(NSString *)title gifUrlString:(NSString *)gifUrlString viewController:(UIViewController *)viewController;
- (instancetype)initWithTitle:(NSString *)title gifUrlString:(NSString *)gifUrlString viewController:(UIViewController *)viewController normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage ;

- (instancetype)initWithTitle:(NSString *)title gifUrlString:(NSString *)gifUrlString navigation:(UINavigationController *)navigation viewController:(UIViewController *)viewController normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage ;
@end
