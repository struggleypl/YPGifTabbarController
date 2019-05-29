//
//  WLTRootManager.h
//  Wallet
//
//  Created by ypl on 2018/12/11.
//  Copyright © 2018年 JiuXi Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GifTabBarHeader.h"

@interface WLTRootManager : NSObject
+ (instancetype)manager;

+ (GifTabBarController *)rootViewController;

+ (void)replaceFirstController;
@end
