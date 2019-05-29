//
//  GifTabImageView.h
//  GifTabBarController
//
//  Created by ypl on 2018/12/10.
//  Copyright © 2018年 ypl. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GifTabImageView : UIImageView
@property (nonatomic) UIImage *normalImage;
@property (nonatomic) UIImage *selectedImage;
-(instancetype)initWithNormalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage;
-(void)stopAnimating;
-(void)startAnimating;
@end
