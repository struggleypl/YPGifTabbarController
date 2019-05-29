//
//  GifTabImageView.m
//  GifTabBarController
//
//  Created by ypl on 2018/12/10.
//  Copyright © 2018年 ypl. All rights reserved.
//

#import "GifTabImageView.h"

@implementation GifTabImageView

-(instancetype)initWithNormalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _normalImage = normalImage;
        _selectedImage = selectedImage;
        self.image = _normalImage;
    }
    return self;
}

-(void)stopAnimating{
    if (_selectedImage != nil) {
        self.image = _selectedImage;
    }
    [self setHidden:NO];
}

-(void)startAnimating{
    [self setHidden:YES];
}

@end
