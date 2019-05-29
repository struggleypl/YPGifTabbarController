//
//  GifTabTapGestureRecognizer.h
//  GifTabBarController
//
//  Created by ypl on 2018/12/10.
//  Copyright © 2018年 ypl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GifTabBarItem.h"
@interface GifTabTapGestureRecognizer : UITapGestureRecognizer
@property (nonatomic, assign) GifTabBarItem *tabBaritem;
@end
