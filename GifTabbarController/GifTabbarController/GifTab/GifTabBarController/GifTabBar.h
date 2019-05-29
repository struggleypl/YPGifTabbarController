//
//  GifTabBar.h
//  GifTabBarController
//
//  Created by ypl on 2018/12/10.
//  Copyright © 2018年 ypl. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol GifTabBarDelegate <NSObject>

-(void)selectedIndex:(NSInteger)selectedIndex;

@end

@interface GifTabBar : UITabBar
@property (nonatomic, strong) NSArray *tabItems;
@property (nonatomic, weak) id<GifTabBarDelegate> delegates;
@end
