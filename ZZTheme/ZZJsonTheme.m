//
//  ZZJsonTheme.m
//  Demo
//
//  Created by 刘威振 on 16/8/24.
//  Copyright © 2016年 刘威振. All rights reserved.
//

#import "ZZJsonTheme.h"
#import "ZZThemeManager.h"
#import "NSObject+ZZTheme.h"

@interface ZZJsonTheme ()

@property (nonatomic, copy, readonly) ZZBlockTypeKeyPathIdentifier addKeyPathColorIdentifier;
@property (nonatomic, copy, readonly) ZZBlockTypeKeyPathIdentifier addKeyPathImageIdentifier;
@end

@implementation ZZJsonTheme

#define ZZBlockTypeIdentifier(blockName, keyPath) \
- (ZZBlockTypeIdentifier)blockName { \
    __weak typeof(self) weakSelf = self; \
    NSString *keyPathStr = keyPath == nil ? NSStringFromSelector(_cmd) : keyPath; \
    return ^(NSString *identifier) { \
        return weakSelf.addKeyPathColorIdentifier(keyPathStr, identifier); \
    }; \
}

ZZBlockTypeIdentifier(backgroundColor, nil)
ZZBlockTypeIdentifier(textColor, nil)
ZZBlockTypeIdentifier(tintColor, nil)
ZZBlockTypeIdentifier(fillColor, nil)
ZZBlockTypeIdentifier(strokeColor, nil)
ZZBlockTypeIdentifier(borderColor, nil)
ZZBlockTypeIdentifier(shadowColor, nil)
ZZBlockTypeIdentifier(onTintColor, nil)
ZZBlockTypeIdentifier(thumbTintColor, nil)
ZZBlockTypeIdentifier(separatorColor, nil)
ZZBlockTypeIdentifier(barTintColor, nil)
ZZBlockTypeIdentifier(placeholderColor, @"_placeholderLabel.textColor")
ZZBlockTypeIdentifier(trackTintColor, nil)
ZZBlockTypeIdentifier(progressTintColor, nil)
ZZBlockTypeIdentifier(highlightedTextColor, nil)
ZZBlockTypeIdentifier(pageIndicatorTintColor, nil)
ZZBlockTypeIdentifier(currentPageIndicatorTintColor, nil)

- (ZZBlockTypeKeyPathIdentifier)addKeyPathColorIdentifier {
    __weak typeof(self) weakSelf = self;
    // ie: keyPath: backgroundColor identifier: @"ident1"
    return ^(NSString *keyPath, NSString *identifier) {
        // 给配置字典赋值
        [weakSelf.info1 setObject:identifier forKey:keyPath];
        if ([[ZZThemeManager sharedManager] currentTag]) {
            UIColor *color = [[[ZZThemeManager sharedManager] getColorStrValue:identifier] zz_toColor];
            if ([weakSelf.view zz_isCGColorWithKeyPath:keyPath]) {
                [weakSelf.view setValue:(id)[color CGColor] forKeyPath:keyPath];
            } else {
                [weakSelf.view setValue:color forKey:keyPath];
            }
        }
        return weakSelf;
    };
}

// typedef ZZJsonTheme * (^ZZBlockTypeIdentifierState)(NSString *identifier, UIControlState state);
// 传入：(@"ident1", UIControlStateNormal)

- (ZZBlockTypeIdentifierState)titleColorWithState {
    __weak typeof(self) weakSelf = self;
    return ^(NSString *identifier, UIControlState state) {
        NSAssert([weakSelf.view isKindOfClass:[UIButton class]], @"JsonTheme: 设置titleColorWithState的对象应该是UIButton");
        NSMutableDictionary *info = weakSelf.info2;
        [info setObject:identifier forKey:@(state)];
        UIColor *color = [[[ZZThemeManager sharedManager] getColorStrValue:identifier] zz_toColor];
        [(UIButton *)weakSelf.view setTitleColor:color forState:state];
        return weakSelf;
    };
}

- (ZZBlockTypeIdentifierState)titleShadowColorWithState {
    __weak typeof(self) weakSelf = self;
    return ^(NSString *identifier, UIControlState state) {
        NSAssert([weakSelf.view isKindOfClass:[UIButton class]], @"JsonTheme: 设置titleShadowColorWithState的对象应该是UIButton");
        NSMutableDictionary *info = weakSelf.info3;
        [info setObject:identifier forKey:@(state)];
        UIColor *color = [[[ZZThemeManager sharedManager] getColorStrValue:identifier] zz_toColor];
        [(UIButton *)weakSelf.view setTitleShadowColor:color forState:state];
        return weakSelf;
    };
}

- (ZZBlockTypeIdentifierState)imageWithState {
    __weak typeof(self) weakSelf = self;
    return ^(NSString *identifier, UIControlState state) {
        NSAssert([weakSelf.view isKindOfClass:[UIButton class]], @"JsonTheme: 设置imageWithState的对象应该是UIButton");
        NSMutableDictionary *info = weakSelf.info4;
        [info setObject:identifier forKey:@(state)];
        UIImage *image = [identifier zz_toImage];
        [(UIButton *)weakSelf.view setImage:image forState:state];
        return weakSelf;
    };
}

- (ZZBlockTypeIdentifierState)backgroundImageWithState {
    __weak typeof(self) weakSelf = self;
    return ^(NSString *identifier, UIControlState state) {
        NSAssert([weakSelf.view isKindOfClass:[UIButton class]], @"JsonTheme: 设置backgroundImageWithState的对象应该是UIButton");
        NSMutableDictionary *info = weakSelf.info5;
        [info setObject:identifier forKey:@(state)];
        UIImage *image = [identifier zz_toImage];
        [(UIButton *)weakSelf.view setBackgroundImage:image forState:state];
        return weakSelf;
    };
}

- (ZZBlockTypeDictionaryState)titleTextAttributesWithState {
    __weak typeof(self) weakSelf = self;
    // 传入值，如：@{NSForegroundColorAttributeName:@"ident1"}
    return ^(NSDictionary *dict, UIControlState state) {
        // [weakSelf.info7 setDictionary:dict];
        // [weakSelf.info7 setValuesForKeysWithDictionary:dict];
        [weakSelf.info7 setObject:dict forKey:@(state)];
        
        NSMutableDictionary *info = [[NSMutableDictionary alloc] init];
        for (NSString *key in dict.allKeys) {
            if ([key isEqualToString:NSForegroundColorAttributeName]) { // 暂且判断此一层
                UIColor *color = [[[ZZThemeManager sharedManager] getColorStrValue:dict[key]] zz_toColor];
                [info setObject:color forKey:key];
            }
        }
        [(UITabBarItem *)self.view setTitleTextAttributes:info forState:state];
    
        return weakSelf;
    };
}

#define ZZBlockTypeIdentifier_image(blockName, keyPath) \
- (ZZBlockTypeIdentifier)blockName { \
    __weak typeof(self) weakSelf = self; \
    NSString *keyPathStr = keyPath == nil ? NSStringFromSelector(_cmd) : keyPath; \
    return ^(NSString *identifier) { \
        return weakSelf.addKeyPathImageIdentifier(keyPathStr, identifier); \
    }; \
}

ZZBlockTypeIdentifier_image(image, nil)
ZZBlockTypeIdentifier_image(trackImage, nil)
ZZBlockTypeIdentifier_image(progressImage, nil)
ZZBlockTypeIdentifier_image(shadowImage, nil)
ZZBlockTypeIdentifier_image(selectedImage, nil)
ZZBlockTypeIdentifier_image(backgroundImage, nil)
ZZBlockTypeIdentifier_image(backIndicatorImage, nil)
ZZBlockTypeIdentifier_image(backIndicatorTransitionMaskImage, nil)
ZZBlockTypeIdentifier_image(selectionIndicatorImage, nil)
ZZBlockTypeIdentifier_image(scopeBarBackgroundImage, nil)

- (ZZBlockTypeKeyPathIdentifier)addKeyPathImageIdentifier {
    __weak typeof(self) weakSelf = self;
    return ^(NSString *keyPath, NSString *identifier) {
        [weakSelf.info6 setValue:identifier forKey:keyPath];
        UIImage *image = [[[ZZThemeManager sharedManager] getImageStrValue:identifier] zz_toImage];
        if ([weakSelf.view isKindOfClass:[UITabBarItem class]]) {
            image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        }
        [weakSelf.view setValue:image forKey:keyPath];
        return weakSelf;
    };
}

- (ZZBlockTypeIdentifier)text {
    __weak typeof(self) weakSelf = self;
    return ^(NSString *identifier) {
        [weakSelf.info8 setValue:identifier forKey:@"text"];
        [weakSelf manageInfo8];
        return weakSelf;
    };
}

- (ZZBlockTypeIdentifierState)titleWithState {
    __weak typeof(self) weakSelf = self;
    return ^(NSString *identifier, UIControlState state) {
        [weakSelf.info9 setObject:identifier forKey:@(state)];
        [weakSelf manageInfo9];
        return weakSelf;
    };
}

#pragma mark - 根据字典配置信息刷新视图

- (void)manageInfo1 {
    if ([[ZZThemeManager sharedManager] currentTag]) {
        for (NSString *key in self.info1) {
            UIColor *color = [[[ZZThemeManager sharedManager] getColorStrValue:self.info1[key]] zz_toColor];
            if ([self.view zz_isCGColorWithKeyPath:key]) {
                [self.view setValue:(id)[color CGColor] forKey:key];
            } else {
                [self.view setValue:color forKey:key];
            }
        }
    }
}

- (void)manageInfo2 {
    if ([[ZZThemeManager sharedManager] currentTag]) {
        for (NSNumber *key in self.info2) {
            UIColor *color = [[[ZZThemeManager sharedManager] getColorStrValue:self.info2[key]] zz_toColor];
            [(UIButton *)self.view setTitleColor:color forState:[key unsignedIntegerValue]];
        }
    }
}

- (void)manageInfo3 {
    if ([[ZZThemeManager sharedManager] currentTag]) {
        for (NSNumber *key in self.info3) {
            UIColor *color = [[[ZZThemeManager sharedManager] getColorStrValue:self.info3[key]] zz_toColor];
            [(UIButton *)self.view setTitleShadowColor:color forState:[key unsignedIntegerValue]];
        }
    }
}

- (void)manageInfo4 {
    if ([[ZZThemeManager sharedManager] currentTag]) {
        for (NSNumber *key in self.info4) {
            UIImage *image = [[[ZZThemeManager sharedManager] getImageStrValue:self.info4[key]] zz_toImage];
            [(UIButton *)self.view setImage:image forState:[key unsignedIntegerValue]];
        }
    }
}

- (void)manageInfo5 {
    if ([[ZZThemeManager sharedManager] currentTag]) {
        for (NSNumber *key in self.info5) {
            UIImage *image = [[[ZZThemeManager sharedManager] getImageStrValue:self.info5[key]] zz_toImage];
            [(UIButton *)self.view setBackgroundImage:image forState:[key unsignedIntegerValue]];
        }
    }
}

- (void)manageInfo6 {
    if ([[ZZThemeManager sharedManager] currentTag]) {
        for (NSString *key in self.info6) {
            UIImage *image = [[[ZZThemeManager sharedManager] getImageStrValue:self.info6[key]] zz_toImage];
            if ([self.view isKindOfClass:[UITabBarItem class]]) {
                image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            }
            [self.view setValue:image forKey:key];
        }
    }
}

- (void)manageInfo7 {
    if ([[ZZThemeManager sharedManager] currentTag]) {
        for (NSNumber *key in self.info7.allKeys) {
            NSUInteger state = [key integerValue]; // UIControlStateSelected
            
            NSDictionary *dict = self.info7[key]; // @{NSForegroundColorAttributeName:@"ident1"}
            NSMutableDictionary *info = [[NSMutableDictionary alloc] init];
            for (NSString *strKey in dict.allKeys) {
                if ([strKey isEqualToString:NSForegroundColorAttributeName]) { // 暂且判断此一层
                    UIColor *color = [[[ZZThemeManager sharedManager] getColorStrValue:dict[strKey]] zz_toColor];
                    [info setObject:color forKey:strKey];
                }
            }
            
            [(UITabBarItem *)self.view setTitleTextAttributes:info forState:state];
        }
    }
}

- (void)manageInfo8 {
    if ([[ZZThemeManager sharedManager] currentTag]) {
        for (NSString *key in self.info8) {
            [self.view setValue:[[ZZThemeManager sharedManager] getTextStrValue:self.info8[key]] forKey:key];
        }
    }
}

- (void)manageInfo9 {
    if ([[ZZThemeManager sharedManager] currentTag]) {
        for (NSNumber *key in self.info9) {
            NSString *identifier = [self.info9 objectForKey:key];
            [(UIButton *)self.view setTitle:[[ZZThemeManager sharedManager] getTextStrValue:identifier] forState:[key unsignedIntegerValue]];
        }
    }
}

@end
