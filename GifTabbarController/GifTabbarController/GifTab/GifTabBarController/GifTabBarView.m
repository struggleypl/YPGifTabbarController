//
//  GifTabBarView.m
//  GifTabBarController
//
//  Created by ypl on 2018/12/10.
//  Copyright © 2018年 ypl. All rights reserved.
//

#import "GifTabBarView.h"
#import "Masonry.h"
#import "WLTDefine.h"

#define gif_ISIPHOME ([UIApplication sharedApplication].statusBarFrame.size.height == 44 ? 1 : 0)
@interface GifTabBarView()

@end

@implementation GifTabBarView

-(instancetype)initWithGifTabBarItem:(GifTabBarItem *)item{
    self = [super init];
    if (self) {
        _tabBarItem = item;
        _animatedImageView = [[FLAnimatedImageView alloc]init];
        _animatedImageView.userInteractionEnabled = YES;
        _animatedImageView.animatedImage = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.gifUrlString]]];
        
        _tabImageView = [[GifTabImageView alloc]initWithNormalImage:item.normalImage selectedImage:nil];
        
        [_animatedImageView setHidden:(item.normalImage!=nil)];
    
        __weak GifTabBarView *weakSelf = self;
        _animatedImageView.loopCompletionBlock = ^(NSUInteger loopCountRemaining){
            [weakSelf stopAnimating];
        };
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:11.0];
        _titleLabel.text = item.tabTitle;
        _titleLabel.textColor = UIColorFromRGB(0xBEC6D6);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_animatedImageView];
        [self addSubview:_tabImageView];
        [self addSubview:_titleLabel];
        [self setNeedsUpdateConstraints];

    }
    return self;
}

- (void)updateConstraints{
    [_animatedImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.height.and.width.mas_equalTo(24);
        if (gif_ISIPHOME) {
            make.top.equalTo(@20);
        }else{
            make.centerY.equalTo(self.mas_centerY);
        }
    }];
    [_tabImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.height.and.width.mas_equalTo(24);
        if (gif_ISIPHOME) {
            make.top.equalTo(@20);
        }else{
            make.centerY.equalTo(self.mas_centerY);
        }
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(13);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(_animatedImageView.mas_bottom).offset(2);
    }];
    [super updateConstraints];

}

-(void)stopAnimating{
    [_animatedImageView stopAnimating];
    if (_tabImageView.selectedImage != nil) {
        [_animatedImageView setHidden:YES];
        [_tabImageView stopAnimating];
    }
    
}

-(void)startAnimating{
    [_tabImageView startAnimating];
    [_animatedImageView setHidden:NO];
    [_animatedImageView startAnimating];
}

@end
