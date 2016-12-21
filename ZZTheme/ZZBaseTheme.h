//
//  ZZBaseTheme.h
//  Demo
//
//  Created by 刘威振 on 16/8/24.
//  Copyright © 2016年 刘威振. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ZZThemeExtern.h"
#import "NSString+ZZConvert.h"

@interface ZZBaseTheme : NSObject

@property (nonatomic) CGFloat changeDuration;
@property (nonatomic, weak) NSObject *view;

/** 基本颜色 */
@property (nonatomic) NSMutableDictionary *info1;
/** 按钮标题色 */
@property (nonatomic) NSMutableDictionary *info2;
/** 按钮阴影色 */
@property (nonatomic) NSMutableDictionary *info3;
/** 按钮图片 */
@property (nonatomic) NSMutableDictionary *info4;
/** 按钮背景图片 */
@property (nonatomic) NSMutableDictionary *info5;
/** 图片 */
@property (nonatomic) NSMutableDictionary *info6;

// TODO://
// Noted: UITabBarItem titleTextAttributes比较特殊，待后续处理
/** UITabBarItem titleTextAttributes */
@property (nonatomic) NSMutableDictionary *info7;

/** 文本 */
@property (nonatomic) NSMutableDictionary *info8;

/** 按钮标题 */
@property (nonatomic) NSMutableDictionary *info9;

- (void)manageInfos;
- (void)manageInfo1;
- (void)manageInfo2;
- (void)manageInfo3;
- (void)manageInfo4;
- (void)manageInfo5;
- (void)manageInfo6;
- (void)manageInfo7;
- (void)manageInfo8;
- (void)manageInfo9;

@end
