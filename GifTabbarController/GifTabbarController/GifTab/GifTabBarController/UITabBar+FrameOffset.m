//
//  UITabBar+FrameOffset.m
//  MobiledataShare
//
//  Created by 陈联斌 on 2018/11/27.
//  Copyright © 2018 JiuXi Technology. All rights reserved.
//

#import "UITabBar+FrameOffset.h"
#import <objc/runtime.h>

CG_INLINE BOOL
//交换方法
OverrideImplementation(Class targetClass, SEL targetSelector, id (^implementationBlock)(Class originClass, SEL originCMD, IMP originIMP)) { Method originMethod = class_getInstanceMethod(targetClass, targetSelector); if (!originMethod) { return NO; } IMP originIMP = method_getImplementation(originMethod); method_setImplementation(originMethod, imp_implementationWithBlock(implementationBlock(targetClass, targetSelector, originIMP))); return YES; }

@implementation UITabBar (FrameOffset)
+ (void)load {
    static dispatch_once_t onceToken; dispatch_once(&onceToken, ^{
        if (@available(iOS 12.1, *)) {
            //交换setFrame方法，忽略size为空的情况
            OverrideImplementation(NSClassFromString(@"UITabBarButton"), @selector(setFrame:), ^id(__unsafe_unretained Class originClass, SEL originCMD, IMP originIMP) {
                return ^(UIView *selfObject, CGRect firstArgv) { if ([selfObject isKindOfClass:originClass]) {
    
                    if (!CGRectIsEmpty(selfObject.frame) && CGRectIsEmpty(firstArgv)) { return; } }
    
                    void (*originSelectorIMP)(id, SEL, CGRect);
    
                    originSelectorIMP = (void (*)(id, SEL, CGRect))originIMP;
    
                    originSelectorIMP(selfObject, originCMD, firstArgv);
            
                };
            
            });
            
        }
        
    });
    
}
    

@end
