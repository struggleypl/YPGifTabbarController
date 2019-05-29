//
//  GifTabBarItem.m
//  GifTabBarController
//
//  Created by ypl on 2018/12/10.
//  Copyright © 2018年 ypl. All rights reserved.
//

#import "GifTabBarItem.h"

@implementation GifTabBarItem

- (instancetype)initWithTitle:(NSString *)title gifUrlString:(NSString *)gifUrlString viewController:(UIViewController *)viewController{
    self = [super init];
    if (self) {
        _tabTitle = title;
        _gifUrlString = gifUrlString;
        _viewController = viewController;
    }
    return self;
}


- (instancetype)initWithTitle:(NSString *)title gifUrlString:(NSString *)gifUrlString viewController:(UIViewController *)viewController normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage {
    self = [super init];
    if (self) {
        _tabTitle = title;
        _gifUrlString = gifUrlString;
        _viewController = viewController;
        _normalImage = normalImage;
        _selectedGifImage = selectedImage;
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title gifUrlString:(NSString *)gifUrlString navigation:(UINavigationController *)navigation viewController:(UIViewController *)viewController normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage {
    self = [super init];
    if (self) {
        _tabTitle = title;
        _gifUrlString = gifUrlString;
        _viewController = viewController;
        _navigation = navigation;
        _normalImage = normalImage;
        _selectedGifImage = selectedImage;
    }
    return self;
}

@end
