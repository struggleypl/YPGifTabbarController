//
//  WLTDefine.h
//  Wallet
//
//  Created by CheckRan on 2018/4/9.
//  Copyright © 2018年 JiuXi Technology. All rights reserved.
//

#ifndef WLTDefine_h
#define WLTDefine_h

// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) (UIColorFromRGBA(rgbValue,1))

#define UIColorFromRGBA(rgbValue,alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue]

//带有RGBA的颜色设置
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

#define kHDWMaxIndex 1000

#define kADFColor (UIColorFromRGB(0xFD6B0C))

#define kThemeColor (UIColorFromRGB(0x0070FF))
#define kThemeColor_halfAplha (UIColorFromRGBA(0x0070FF,0.5))

#define kThemeBackgroundColor (UIColorFromRGB(0xFAFAFA))

#define kWhiteColor (UIColorFromRGB(0xFFFFFF))

#define kFontColor (UIColorFromRGB(0x262A33))
#define kSubFontColor (UIColorFromRGB(0x999999))
#define kThirdFontColor (UIColorFromRGB(0x666666))
#define kDisableBackColor UIColorFromRGB(0xE5E5E5)
#define kPlaceHolderColor UIColorFromRGB(0xCCCCCC)


#define kSemiboldFontWithSize(s) [UIFont fontWithName:@"PingFangSC-Semibold" size:(s)]
#define kRegularFontWithSize(s) [UIFont fontWithName:@"PingFangSC-Regular" size:(s)]
#define kMediumFontWithSize(s) [UIFont fontWithName:@"PingFangSC-Medium" size:(s)]
#define kBebasFontWithSize(s) [UIFont fontWithName:@"Bebas" size:(s)]

#endif /* WLTDefine_h */
