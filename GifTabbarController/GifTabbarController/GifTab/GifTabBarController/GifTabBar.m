//
//  GifTabBar.m
//  GifTabBarController
//
//  Created by ypl on 2018/12/10.
//  Copyright © 2018年 ypl. All rights reserved.
//

#import "GifTabBar.h"
#import "GifTabTapGestureRecognizer.h"
#import "GifTabBarItem.h"
#import "FLAnimatedImage.h"

#import "GifTabBarView.h"
#import "WLTDefine.h"

@interface GifTabBar()
@property (nonatomic, strong) NSMutableArray *animatedImageViewArray;
@property (nonatomic, strong) GifTabBarView *lastSelecteTabBarView;
@end

@implementation GifTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init{
    self = [super init];
    if (self) {
        _animatedImageViewArray = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect rect = self.bounds;
    CGFloat centerX = rect.size.width / self.items.count / 2;
    CGFloat centerY = rect.size.height / 2 - 5;
    CGFloat spacingX = rect.size.width / self.items.count;
    CGFloat width = rect.size.width / self.items.count;
    for (int i = 0; i < [_animatedImageViewArray count]; i++) {
        GifTabBarView *item = _animatedImageViewArray[i];
        item.frame = CGRectMake(0, 0, width, rect.size.height + 10);
        item.center = CGPointMake(centerX, centerY);
        centerX += spacingX;
        [item stopAnimating];
        [self bringSubviewToFront:item];
    }
}

- (void)updateConstraints{
    
    [super updateConstraints];
}

- (void)setItems:(nullable NSArray<UITabBarItem *> *)items animated:(BOOL)animated{
    for (GifTabBarItem *item in _tabItems) {
        GifTabBarView *tabItemView = [[GifTabBarView alloc]initWithGifTabBarItem:item];
        NSInteger index = [_tabItems indexOfObject:item];
        tabItemView.tag = index;
        if (index==0) {
            if (_lastSelecteTabBarView==nil) {
                _lastSelecteTabBarView = tabItemView;
            }
            tabItemView.titleLabel.textColor = kThemeColor;
            tabItemView.animatedImageView.hidden = YES;
            tabItemView.tabImageView.hidden = NO;
            tabItemView.tabImageView.image = item.selectedGifImage;
        }else{
            tabItemView.titleLabel.textColor = UIColorFromRGB(0xBEC6D6);
            tabItemView.animatedImageView.hidden = YES;
            tabItemView.tabImageView.hidden = NO;
            tabItemView.tabImageView.image = item.normalImage;
        }
        GifTabTapGestureRecognizer *tap = [[GifTabTapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTabBarItem:)];
        tap.tabBaritem = item;
        [tabItemView addGestureRecognizer:tap];

        [self addSubview:tabItemView];
        [_animatedImageViewArray addObject:tabItemView];
    }
    
    [super setItems:items animated:animated];
    
}

- (void)tapTabBarItem:(GifTabTapGestureRecognizer *)sender{
    GifTabBarView *tabbar = (GifTabBarView *)sender.view;
    if (_lastSelecteTabBarView.tag==tabbar.tag) {
        return;
    }
    for (int index = 0; index<_tabItems.count; index++) {
        GifTabBarView *tabbarView = _animatedImageViewArray[index];
        GifTabBarItem *item = _tabItems[index];
        if (tabbar.tag==index) {
            tabbarView.titleLabel.textColor = kThemeColor;
            tabbarView.animatedImageView.animatedImage = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:[NSURL URLWithString:sender.tabBaritem.gifUrlString]]];
            [tabbarView startAnimating];
            __weak typeof(tabbarView) weakTabbar = tabbarView;
            tabbarView.animatedImageView.loopCompletionBlock = ^(NSUInteger loopCountRemaining){
                [weakTabbar stopAnimating];
                weakTabbar.animatedImageView.hidden = YES;
                weakTabbar.tabImageView.hidden = NO;
                weakTabbar.tabImageView.image = item.selectedGifImage;
            };
        }else{
            tabbarView.titleLabel.textColor = UIColorFromRGB(0xBEC6D6);
            tabbarView.animatedImageView.hidden = YES;
            tabbarView.tabImageView.hidden = NO;
            tabbarView.tabImageView.image = item.normalImage;
        }
    }
    _lastSelecteTabBarView = tabbar;
    if (self.delegates && [self.delegates respondsToSelector:@selector(selectedIndex:)]) {
        [self.delegates selectedIndex:tabbar.tag];
    }
}

@end
