//
//  WLTNavigationBar.m
//  Wallet
//
//  Created by CheckRan on 2018/4/12.
//  Copyright © 2018年 JiuXi Technology. All rights reserved.
//

#import "WLTNavigationBar.h"
#import "WLTDefine.h"

@implementation WLTNavigationBar
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.translucent = false;
        self.tintColor = kThemeColor;
    }
    return self;
}

@end
