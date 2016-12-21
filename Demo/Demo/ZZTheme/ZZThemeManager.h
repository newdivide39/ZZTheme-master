//
//  ZZThemeManager.h
//  Demo
//
//  Created by 刘威振 on 16/8/24.
//  Copyright © 2016年 刘威振. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZZThemeManager : NSObject

@property (nonatomic, copy) NSString *currentTag;
@property (nonatomic) NSMutableDictionary *info;
@property (nonatomic) NSMutableSet *allTags;

/**
 *  获取单例对象
 *
 *  @return ZZThemeManager对象
 */
+ (instancetype)sharedManager;

/**
 *  默认主题
 *
 *  @param tag 主题标识
 */
- (void)defaultTheme:(NSString *)tag;

/**
 *  开启主题
 *
 *  @param tag 主题标识
 */
- (void)startTheme:(NSString *)tag;

/**
 *  增加主题标识，即住allTags里面增加对象
 *
 *  @param tag 主题标识
 */
- (void)addTag:(NSString *)tag;

/**
 *  增加主题
 *
 *  @param themeTag 主题标识
 *  @param jsonData json数据
 */
- (void)addTheme:(NSString *)themeTag jsonData:(NSData *)jsonData;

- (NSString *)getColorStrValue:(NSString *)key;
- (NSString *)getImageStrValue:(NSString *)key;
- (NSString *)getOtherStrValue:(NSString *)key;
- (NSString *)getTextStrValue:(NSString *)key;

@end
