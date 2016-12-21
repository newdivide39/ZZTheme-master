//
//  ZZThemeExtern.h
//  Demo
//
//  Created by 刘威振 on 16/8/24.
//  Copyright © 2016年 刘威振. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const ZZThemeChangingNotificaiton;
extern NSString * const ZZThemeCurrentTag;

// 懒加载宏定义
#define LazyLoad_Common(ClassName, varName) \
- (ClassName *)varName { \
    if (_##varName == nil) { \
        _##varName = [[ClassName alloc] init]; \
    } \
    return _##varName; \
}