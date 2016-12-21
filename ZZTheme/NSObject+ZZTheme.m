//
//  UIView+ZZTheme.m
//  Demo
//
//  Created by 刘威振 on 16/8/24.
//  Copyright © 2016年 刘威振. All rights reserved.
//

#import "NSObject+ZZTheme.h"
#import <objc/runtime.h>
#import "ZZThemeExtern.h"
#import "ZZThemeManager.h"

@implementation NSObject (ZZTheme)

// dealloc -> zz_dealloc
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray *selStringsArray = @[@"dealloc"];
        [selStringsArray enumerateObjectsUsingBlock:^(NSString *selString, NSUInteger idx, BOOL *stop) {
            NSString *zzSelString = [@"zz_" stringByAppendingString:selString];
            Method originalMethod = class_getInstanceMethod(self, NSSelectorFromString(selString));
            Method zzMethod = class_getInstanceMethod(self, NSSelectorFromString(zzSelString));
            method_exchangeImplementations(originalMethod, zzMethod);
        }];
    });
}

- (ZZJsonTheme *)jsonTheme {
    ZZJsonTheme *theme = objc_getAssociatedObject(self, _cmd);
    if (!theme) {
        NSAssert(![self isKindOfClass:[ZZJsonTheme class]], @"Class error: ZZTheme");
        theme = [[ZZJsonTheme alloc] init];
        self.jsonTheme = theme;
        self.jsonTheme.view = self;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(zz_themeChangingNotificaiton:) name:ZZThemeChangingNotificaiton object:nil];
    }
    
    return theme;
}

- (void)setJsonTheme:(ZZJsonTheme *)jsonTheme {
    if (jsonTheme) {
        objc_setAssociatedObject(self, @selector(jsonTheme), jsonTheme, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (ZZCodeTheme *)codeTheme {
    ZZCodeTheme *theme = objc_getAssociatedObject(self, _cmd);
    if (!theme) {
        NSAssert(![self isKindOfClass:[ZZCodeTheme class]], @"Class error: ZZTheme");
        theme = [[ZZCodeTheme alloc] init];
        self.codeTheme = theme;
        self.codeTheme.view = self;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(zz_themeChangingNotificaiton:) name:ZZThemeChangingNotificaiton object:nil];
    }
    
    return theme;
}

- (void)setCodeTheme:(ZZCodeTheme *)codeTheme {
    if (codeTheme) {
         objc_setAssociatedObject(self, @selector(codeTheme), codeTheme, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

// 接到通知，触发
- (void)zz_themeChangingNotificaiton:(NSNotification *)notification {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self zz_change];
    });
}

- (void)zz_change {
    ZZCodeTheme *codeTheme = objc_getAssociatedObject(self, @selector(codeTheme));
    if (codeTheme) {
        [codeTheme manageInfos];
    }
    
    ZZJsonTheme *jsonTheme = objc_getAssociatedObject(self, @selector(jsonTheme));
    if (jsonTheme) {
        [jsonTheme manageInfos];
    }
}

- (BOOL)zz_isCGColorWithKeyPath:(NSString *)keyPath {
    objc_property_t property = class_getProperty([self class], [keyPath UTF8String]);
    if (property != NULL) {
        return ([[NSString stringWithUTF8String:property_getAttributes(property)] isEqualToString:@"T^{CGColor=}"]) ? YES : NO;
    }
    return NO;
}

- (BOOL)isZZTheme {
    return objc_getAssociatedObject(self, @selector(codeTheme)) || objc_getAssociatedObject(self, @selector(jsonTheme));
}

- (void)zz_dealloc {
    if ([self isZZTheme]) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:ZZThemeChangingNotificaiton object:nil];
        objc_removeAssociatedObjects(self);
    }
    [self zz_dealloc];
}

@end
