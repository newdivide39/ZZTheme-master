//
//  ZZCodeTheme.m
//  Demo
//
//  Created by 刘威振 on 16/8/24.
//  Copyright © 2016年 刘威振. All rights reserved.
//

#import "ZZCodeTheme.h"
#import "ZZThemeManager.h"
#import "NSObject+ZZTheme.h"
#import "NSString+ZZConvert.h"

@interface ZZCodeTheme ()

@property (nonatomic, copy, readonly) ZZBlockTypeTagKeyPathColor addKeyPathColor;
@property (nonatomic, copy, readonly) ZZBlockTypeTagKeyPathImage addKeyPathImage;
@end

@implementation ZZCodeTheme

#define ZZBlockTypeTagColor(blockName, keyPath) \
- (ZZBlockTypeTagColor)blockName { \
    __weak typeof(self) weakSelf = self; \
    NSString *keyPathStr = keyPath == nil ? NSStringFromSelector(_cmd) : keyPath; \
    return ^(NSString *tag, UIColor *color) { \
        return weakSelf.addKeyPathColor(tag, keyPathStr, color); \
    }; \
}

ZZBlockTypeTagColor(backgroundColor, nil)
ZZBlockTypeTagColor(textColor, nil)
ZZBlockTypeTagColor(tintColor, nil)
ZZBlockTypeTagColor(fillColor, nil)
ZZBlockTypeTagColor(strokeColor, nil)
ZZBlockTypeTagColor(borderColor, nil)
ZZBlockTypeTagColor(shadowColor, nil)
ZZBlockTypeTagColor(onTintColor, nil)
ZZBlockTypeTagColor(thumbTintColor, nil)
ZZBlockTypeTagColor(separatorColor, nil)
ZZBlockTypeTagColor(barTintColor, nil)
ZZBlockTypeTagColor(placeholderColor, @"_placeholderLabel.textColor")
ZZBlockTypeTagColor(trackTintColor, nil)
ZZBlockTypeTagColor(progressTintColor, nil)
ZZBlockTypeTagColor(highlightedTextColor, nil)
ZZBlockTypeTagColor(pageIndicatorTintColor, nil)
ZZBlockTypeTagColor(currentPageIndicatorTintColor, nil)

- (ZZBlockTypeTagKeyPathColor)addKeyPathColor {
    __weak typeof(self) weakSelf = self;
    return ^(NSString *tag, NSString *keyPath, UIColor *color) {
        // 给配置字典赋值
        [[ZZThemeManager sharedManager] addTag:tag];
        NSMutableDictionary *info = [weakSelf.info1 objectForKey:keyPath];
        if (!info) info = [[NSMutableDictionary alloc] init];
        [info setObject:color forKey:tag];
        [weakSelf.info1 setObject:info forKey:keyPath];
        if ([[[ZZThemeManager sharedManager] currentTag] isEqualToString:tag]) { // 如果主题相同，则改变
            if ([weakSelf.view zz_isCGColorWithKeyPath:keyPath]) {
                [weakSelf.view setValue:(id)[color CGColor] forKey:keyPath];
            } else {
                [weakSelf.view setValue:color forKey:keyPath];
            }
        }
        return weakSelf;
    };
}

- (ZZBlockTypeTagColorState)titleColorWithState {
    __weak typeof(self) weakSelf = self;
    return ^(NSString *tag, UIColor *color, UIControlState state) {
        NSAssert([weakSelf.view isKindOfClass:[UIButton class]], @"设置titleColorWithState的对象应该是UIButton");
        [[ZZThemeManager sharedManager] addTag:tag];
        NSMutableDictionary *info = weakSelf.info2[tag];
        if (!info) {
            info = [[NSMutableDictionary alloc] init];
            [weakSelf.info2 setObject:info forKey:tag];
        }
        [info setObject:color forKey:@(state)];
        if ([[[ZZThemeManager sharedManager] currentTag] isEqualToString:tag]) { // 如果主题相同，则改变
            [(UIButton *)weakSelf.view setTitleColor:color forState:state];
        }

        return weakSelf;
    };
}

- (ZZBlockTypeTagColorState)titleShadowColorWithState {
    __weak typeof(self) weakSelf = self;
    return ^(NSString *tag, UIColor *color, UIControlState state) {
        NSAssert([weakSelf.view isKindOfClass:[UIButton class]], @"设置titleShadowColorWithState的对象应该是UIButton");
        NSMutableDictionary *info = weakSelf.info3[tag];
        if (!info) {
            info = [[NSMutableDictionary alloc] init];
            [weakSelf.info3 setObject:info forKey:tag];
        }
        [info setObject:color forKey:@(state)];
        if ([[[ZZThemeManager sharedManager] currentTag] isEqualToString:tag]) { // 如果主题相同，则改变
            [(UIButton *)weakSelf.view setTitleShadowColor:color forState:state];
        }
        return weakSelf;
    };
}

- (ZZBlockTypeTagImageState)imageWithState {
    __weak typeof(self) weakSelf = self;
    return ^(NSString *tag, id image, UIControlState state) {
        NSAssert([weakSelf.view isKindOfClass:[UIButton class]], @"设置imageWithState的对象应该是UIButton");
        NSMutableDictionary *info = weakSelf.info4[tag];
        if (!info) {
            info = [[NSMutableDictionary alloc] init];
            [weakSelf.info4 setObject:info forKey:tag];
        }
        [info setObject:image forKey:@(state)];
        if ([[[ZZThemeManager sharedManager] currentTag] isEqualToString:tag]) { // 如果主题相同，则改变
            UIImage *i = [image isKindOfClass:[UIImage class]] ? image : [image zz_toImage];
            [(UIButton *)weakSelf.view setImage:i forState:state];
        }
        return weakSelf;
    };
}

- (ZZBlockTypeTagImageState)backgroundImageWithState {
    __weak typeof(self) weakSelf = self;
    return ^(NSString *tag, id image, UIControlState state) {
        NSAssert([weakSelf.view isKindOfClass:[UIButton class]], @"设置imageWithState的对象应该是UIButton");
        NSMutableDictionary *info = weakSelf.info5[tag];
        if (!info) {
            info = [[NSMutableDictionary alloc] init];
            [weakSelf.info5 setObject:info forKey:tag];
        }
        [info setObject:image forKey:@(state)];
        if ([[[ZZThemeManager sharedManager] currentTag] isEqualToString:tag]) { // 如果主题相同，则改变
            UIImage *i = [image isKindOfClass:[UIImage class]] ? image : [image zz_toImage];
            [(UIButton *)weakSelf.view setBackgroundImage:i forState:state];
        }
        return weakSelf;
    };
}

- (ZZBlockTypeTagDictionaryState)titleTextAttributesWithState {
    __weak typeof(self) weakSelf = self;
    return ^(NSString *tag, NSDictionary *dict, UIControlState state) {
        [[ZZThemeManager sharedManager] addTag:tag];
        NSMutableDictionary *info = [weakSelf.info7 objectForKey:tag];
        if (!info) {
            info = [[NSMutableDictionary alloc] init];
            [weakSelf.info7 setObject:info forKey:tag];
        }
        [info setObject:dict forKey:@(state)];
        if ([[[ZZThemeManager sharedManager] currentTag] isEqualToString:tag]) { // 如果主题相同，则改变
            [(UITabBarItem *)weakSelf.view setTitleTextAttributes:dict forState:state];
        }
        return weakSelf;
    };
}

#define ZZBlockTypeTagImage(blockName, keyPath) \
- (ZZBlockTypeTagImage)blockName { \
    __weak typeof(self) weakSelf = self; \
    NSString *keyPathStr = keyPath == nil ? NSStringFromSelector(_cmd) : keyPath; \
    return ^(NSString *tag, id image) { \
        return weakSelf.addKeyPathImage(tag, keyPathStr, image); \
    }; \
}

ZZBlockTypeTagImage(image, nil)
ZZBlockTypeTagImage(trackImage, nil)
ZZBlockTypeTagImage(progressImage, nil)
ZZBlockTypeTagImage(shadowImage, nil)
ZZBlockTypeTagImage(selectedImage, nil)
ZZBlockTypeTagImage(backgroundImage, nil)
ZZBlockTypeTagImage(backIndicatorImage, nil)
ZZBlockTypeTagImage(backIndicatorTransitionMaskImage, nil)
ZZBlockTypeTagImage(selectionIndicatorImage, nil)
ZZBlockTypeTagImage(scopeBarBackgroundImage, nil)

- (ZZBlockTypeTagKeyPathImage)addKeyPathImage {
    __weak typeof(self) weakSelf = self;
    return ^(NSString *tag, NSString *keyPath, id image) {
        [[ZZThemeManager sharedManager] addTag:tag];
        NSMutableDictionary *info = [weakSelf.info6 objectForKey:keyPath];
        if (!info) {
            info = [[NSMutableDictionary alloc] init];
            [weakSelf.info6 setObject:info forKey:keyPath];
        }
        [info setObject:image forKey:tag];
        if ([[[ZZThemeManager sharedManager] currentTag] isEqualToString:tag]) { // 如果主题相同，则改变
            UIImage *i = [image isKindOfClass:[UIImage class]] ? image : [image zz_toImage];
            [weakSelf.view setValue:i forKey:keyPath];
        }
        return weakSelf;
    };
}

- (ZZBlockTypeTagStr)text {
    __weak typeof(self) weakSelf = self;
    return ^(NSString *tag, NSString *str) {
        [[ZZThemeManager sharedManager] addTag:tag];
        [weakSelf.info8 setValue:str forKey:tag];
        [weakSelf manageInfo8];
        return weakSelf;
    };
}

- (ZZBlockTypeTagStrState)titleWithState {
    __weak typeof(self) weakSelf = self;
    return ^(NSString *tag, NSString *str, UIControlState state) {
        NSAssert([weakSelf.view isKindOfClass:[UIButton class]], @"设置titleWithState的对象应该是UIButton");
        [[ZZThemeManager sharedManager] addTag:tag];
        NSMutableDictionary *info = [weakSelf.info9 objectForKey:tag];
        if (!info) {
            info = [[NSMutableDictionary alloc] init];
            [weakSelf.info9 setObject:info forKey:tag];
        }
        [info setObject:str forKey:@(state)];
        [self manageInfo9];
        
        return weakSelf;
    };
}

#pragma mark - 根据字典配置信息刷新视图

- (void)manageInfo1 {
    for (NSString *keyPath in self.info1) {
        NSMutableDictionary *info = [self.info1 objectForKey:keyPath];
        UIColor *color = [info objectForKey:[[ZZThemeManager sharedManager] currentTag]];
        if (color) {
            if ([self.view zz_isCGColorWithKeyPath:keyPath]) {
                [self.view setValue:(id)[color CGColor] forKey:keyPath];
            } else {
                [self.view setValue:color forKey:keyPath];
            }
        }
    }
}

- (void)manageInfo2 {
    NSDictionary *info = [self.info2 objectForKey:[[ZZThemeManager sharedManager] currentTag]];
    if (info) {
        for (NSNumber *key in info) {
            UIControlState state = [key unsignedIntegerValue];
            [(UIButton *)self.view setTitleColor:info[key] forState:state];
        }
    }
}

- (void)manageInfo3 {
    NSDictionary *info = [self.info3 objectForKey:[[ZZThemeManager sharedManager] currentTag]];
    if (info) {
        for (NSNumber *key in info) {
            UIControlState state = [key unsignedIntegerValue];
            [(UIButton *)self.view setTitleShadowColor:info[key] forState:state];
        }
    }
}

- (void)manageInfo4 {
    NSDictionary *info = [self.info4 objectForKey:[[ZZThemeManager sharedManager] currentTag]];
    if (info) {
        for (NSNumber *key in info) {
            UIControlState state = [key unsignedIntegerValue];
            [(UIButton *)self.view setImage:info[key] forState:state];
        }
    }
}

- (void)manageInfo5 {
    NSDictionary *info = [self.info5 objectForKey:[[ZZThemeManager sharedManager] currentTag]];
    if (info) {
        for (NSNumber *key in info) {
            UIControlState state = [key unsignedIntegerValue];
            [(UIButton *)self.view setBackgroundImage:info[key] forState:state];
        }
    }
}

- (void)manageInfo6 {
    NSDictionary *info = self.info6;
    for (NSString *key in info) {
        NSDictionary *dict = [info objectForKey:key];
        id value = [dict objectForKey:[[ZZThemeManager sharedManager] currentTag]];
        if (value) {
            UIImage *image = [value isKindOfClass:[UIImage class]] ? value : [value zz_toImage];
            [self.view setValue:image forKey:key];
        }
    }
}

- (void)manageInfo7 {
    NSDictionary *info = self.info7;
    NSDictionary *dict = [info objectForKey:[[ZZThemeManager sharedManager] currentTag]];
    if (dict) {
        for (NSNumber *stateKey in dict.allKeys) {
            UIControlState state = [stateKey unsignedIntegerValue];
            [(UITabBarItem *)self.view setTitleTextAttributes:dict[stateKey] forState:state];
        }
    }
}

- (void)manageInfo8 {
    NSString *text = [self.info8 objectForKey:[[ZZThemeManager sharedManager] currentTag]];
    if (text) {
        [self.view setValue:text forKey:@"text"];
    }
}

- (void)manageInfo9 {
    NSDictionary *info = self.info9;
    NSDictionary *dict = [info objectForKey:[[ZZThemeManager sharedManager] currentTag]];
    if (dict) {
        for (NSNumber *stateKey in dict.allKeys) {
            UIControlState state = [stateKey unsignedIntegerValue];
            [(UIButton *)self.view setTitle:dict[stateKey] forState:state];
        }
    }
}

@end
