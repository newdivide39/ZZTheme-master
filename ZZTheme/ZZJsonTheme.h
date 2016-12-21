//
//  ZZJsonTheme.h
//  Demo
//
//  Created by 刘威振 on 16/8/24.
//  Copyright © 2016年 刘威振. All rights reserved.
//

#import "ZZBaseTheme.h"
@class ZZJsonTheme;

typedef ZZJsonTheme * (^ZZBlockTypeIdentifier)(NSString *identifier);
typedef ZZJsonTheme * (^ZZBlockTypeIdentifierState)(NSString *identifier, UIControlState state);
typedef ZZJsonTheme * (^ZZBlockTypeKeyPathIdentifier)(NSString *keyPath, NSString *identifier);
typedef ZZJsonTheme * (^ZZBlockTypeDictionaryState)(NSDictionary *dict, UIControlState state);

@interface ZZJsonTheme : ZZBaseTheme

#pragma mark - JSON方式 :: Color
/** 设置backgroundColor -> 格式: .backgroundColor(@@"identifier") */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifier backgroundColor;

/** 设置textColor -> 格式: .textColor(@@"identifier") */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifier textColor;

/** 设置tintColor -> 格式: .tintColor(@@"identifier") */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifier tintColor;

/** 设置fillColor -> 格式: .fillColor(@@"identifier") */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifier fillColor;

/** 设置strokeColor -> 格式: .strokeColor(@@"identifier") */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifier strokeColor;

/** 设置borderColor -> 格式: .borderColor(@@"identifier") */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifier borderColor;

/** 设置shadowColor -> 格式: .shadowColor(@@"identifier") */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifier shadowColor;

/** 设置onTintColor -> 格式: .onTintColor(@@"identifier") */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifier onTintColor;

/** 设置thumbTintColor -> 格式: .thumbTintColor(@@"identifier") */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifier thumbTintColor;

/** 设置separatorColor -> 格式: .separatorColor(@@"identifier") */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifier separatorColor;

/** 设置barTintColor -> 格式: .barTintColor(@@"identifier") */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifier barTintColor;

/** 设置placeholderColor -> 格式: .placeholderColor(@@"identifier") */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifier placeholderColor;

/** 设置trackTintColor -> 格式: .trackTintColor(@@"identifier") */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifier trackTintColor;

/** 设置progressTintColor -> 格式: .progressTintColor(@@"identifier") */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifier progressTintColor;

/** 设置highlightedTextColor -> 格式: .highlightedTextColor(@@"identifier") */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifier highlightedTextColor;

/** 设置pageIndicatorTintColor -> 格式: .pageIndicatorTintColor(@@"identifier") */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifier pageIndicatorTintColor;

/** 设置currentPageIndicatorTintColor -> 格式: .currentPageIndicatorTintColor(@@"identifier") */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifier currentPageIndicatorTintColor;
// -------------------------------------------------------------------------------------

/** 设置按钮标题颜色 -> 格式: .titleColorWithState(NSString *identifier, UIControlState state) */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifierState titleColorWithState;

/** 设置按钮标题阴颜色 -> 格式: .titleShadowColorWithState(NSString *identifier, UIControlState state) */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifierState titleShadowColorWithState;
// -------------------------------------------------------------------------------------

/** 设置文本 -> 格式: .text(@@"identifier") */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifier text;
// -------------------------------------------------------------------------------------

/** 设置UIButton不同状态下的title -> 格式: .titleWithState(NSString *identifier, UIControlState state) */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifierState titleWithState;

#pragma mark - JSON方式 :: Image
/** 设置image -> 格式: .image(@@"identifier") */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifier image;

/** 设置trackImage -> 格式: .trackImage(@@"identifier") */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifier trackImage;

/** 设置trackImage -> 格式: .trackImage(@@"identifier") */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifier progressImage;

/** 设置shadowImage -> 格式: .trackImage(@@"identifier") */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifier shadowImage;

/** 设置shadowImage -> 格式: .selectedImage(@@"identifier") */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifier selectedImage;

/** 设置shadowImage -> 格式: .backgroundImage(@@"identifier") */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifier backgroundImage;

/** 设置backIndicatorImage -> 格式: .backIndicatorImage(@@"identifier") */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifier backIndicatorImage;

/** 设置backIndicatorTransitionMaskImage -> 格式: .backIndicatorTransitionMaskImage(@@"identifier") */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifier backIndicatorTransitionMaskImage;

/** 设置selectionIndicatorImage -> 格式: .selectionIndicatorImage(@@"identifier") */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifier selectionIndicatorImage;

/** 设置scopeBarBackgroundImage -> 格式: .scopeBarBackgroundImage(@@"identifier") */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifier scopeBarBackgroundImage;
// -------------------------------------------------------------------------------------

/** 设置UIButton的image -> 格式: .imageWithState(@@"identifier", UIControlState) */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifierState imageWithState;

/** 设置UIButton的backgroundImageWithState -> 格式: .backgroundImageWithState(@@"identifier", UIControlState) */
@property (nonatomic, copy, readonly) ZZBlockTypeIdentifierState backgroundImageWithState;
// -------------------------------------------------------------------------------------

/** 设置UIButton的titleTextAttributesWithState -> 格式: .titleTextAttributesWithState(Dict, UIControlState) */
@property (nonatomic, copy, readonly) ZZBlockTypeDictionaryState titleTextAttributesWithState;
// -------------------------------------------------------------------------------------

@end
