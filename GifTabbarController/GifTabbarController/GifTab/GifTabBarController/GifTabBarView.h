//
//  GifTabBarView.h
//  GifTabBarController
//
//  Created by ypl on 2018/12/10.
//  Copyright © 2018年 ypl. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "GifTabImageView.h"
#import "FLAnimatedImage.h"
#import "GifTabBarItem.h"

@interface GifTabBarView : UIView
@property (nonatomic) FLAnimatedImageView *animatedImageView;
@property (nonatomic) GifTabImageView *tabImageView;
@property (nonatomic) UILabel *titleLabel;
@property (nonatomic) GifTabBarItem *tabBarItem;
-(instancetype)initWithGifTabBarItem:(GifTabBarItem *)item;
-(void)stopAnimating;
-(void)startAnimating;
@end
