//
//  ZZThemeManager.m
//  Demo
//
//  Created by 刘威振 on 16/8/24.
//  Copyright © 2016年 刘威振. All rights reserved.
//

#import "ZZThemeManager.h"
#import "ZZThemeExtern.h"

@interface ZZThemeManager ()

@end

@implementation ZZThemeManager

- (instancetype)init {
    if (self = [super init]) {
        NSString *currentTag = [[NSUserDefaults standardUserDefaults] objectForKey:ZZThemeCurrentTag];
        if (currentTag) {
            self.currentTag = currentTag;
        }
    }
    return self;
}

+ (instancetype)sharedManager {
    static ZZThemeManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ZZThemeManager alloc] init];
    });
    return manager;
}

- (void)defaultTheme:(NSString *)tag {
    if (![self currentTag] ) {
        [self setCurrentTag:tag];
    }
}

- (void)startTheme:(NSString *)tag {
    NSAssert([self.allTags containsObject:tag], @"所启用的主题不存在 - 请检查是否添加了主题: %@", tag);
    if ([self.currentTag isEqualToString:tag]) return;
    self.currentTag = tag;
    [[NSNotificationCenter defaultCenter] postNotificationName:ZZThemeChangingNotificaiton object:nil];
}

- (void)addTag:(NSString *)tag {
    NSAssert(tag.length > 0, @"主题不可为空");
    [self.allTags addObject:tag];
}

- (void)setCurrentTag:(NSString *)currentTag {
    _currentTag = currentTag;
    if ([self.allTags containsObject:currentTag] == NO) {
        [self.allTags addObject:currentTag];
    }
    [[NSUserDefaults standardUserDefaults] setObject:currentTag forKey:ZZThemeCurrentTag];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)addTheme:(NSString *)themeTag jsonData:(NSData *)jsonData {
    if (themeTag == nil || jsonData == nil || jsonData.length <= 0) return;
    NSError *jsonError = nil;
    NSDictionary *themeDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&jsonError];
    NSAssert(!jsonError, @"添加的主题json配置数据解析错误 - 错误描述");
    NSAssert(themeDict, @"添加的主题json配置数据解析为空 - 请检查");
    [self.allTags addObject:themeTag];
    [self.info setObject:themeDict forKey:themeTag];
}

- (NSString *)getColorStrValue:(NSString *)key {
    return [self getStrValueWithStyle:@"UIColor" key:key];
}

- (NSString *)getImageStrValue:(NSString *)key {
    return [self getStrValueWithStyle:@"UIImage" key:key];
}

- (NSString *)getTextStrValue:(NSString *)key {
    return [self getStrValueWithStyle:@"NSString" key:key];
}

- (NSString *)getOtherStrValue:(NSString *)key {
    return [self getStrValueWithStyle:@"other" key:key];
}

- (NSString *)getStrValueWithStyle:(NSString *)style key:(NSString *)key {
    NSDictionary *themeDict = self.info[[[ZZThemeManager sharedManager] currentTag]];
    NSAssert(themeDict, @"未取得相关主题: %@ key: %@", [[ZZThemeManager sharedManager] currentTag], key);
    NSDictionary *styleDict = [themeDict objectForKey:style];
    return [styleDict objectForKey:key];
}

LazyLoad_Common(NSMutableSet, allTags)
LazyLoad_Common(NSMutableDictionary, info)

@end
