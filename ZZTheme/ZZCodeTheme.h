//
//  ZZCodeTheme.h
//  Demo
//
//  Created by 刘威振 on 16/8/24.
//  Copyright © 2016年 刘威振. All rights reserved.
//

#import "ZZBaseTheme.h"

@class ZZCodeTheme;

typedef ZZCodeTheme * (^ZZBlockTypeTagColor)(NSString *tag, UIColor *color);
typedef ZZCodeTheme * (^ZZBlockTypeTagColorState)(NSString *tag, UIColor *color, UIControlState state);
typedef ZZCodeTheme * (^ZZBlockTypeTagKeyPathColor)(NSString *tag, NSString *keyPath, UIColor *color);
typedef ZZCodeTheme * (^ZZBlockTypeTagDictionaryState)(NSString *tag, NSDictionary *dict, UIControlState state);
typedef ZZCodeTheme * (^ZZBlockTypeTagStr)(NSString *tag, NSString *str);
typedef ZZCodeTheme * (^ZZBlockTypeTagStrState)(NSString *tag, NSString *str, UIControlState state);

typedef ZZCodeTheme * (^ZZBlockTypeTagImage)(NSString *tag, id image); // image: 可以是UIImage | imageName | imagePath
typedef ZZCodeTheme * (^ZZBlockTypeTagImageState)(NSString *tag, id image, UIControlState state);
typedef ZZCodeTheme * (^ZZBlockTypeTagKeyPathImage)(NSString *tag, NSString *keyPath, id image);

typedef void (^ZZBlockType)(id item);
typedef ZZCodeTheme * (^ZZBlockTypeTagBlock)(NSString *tag, ZZBlockType block);
typedef ZZCodeTheme * (^ZZBlockTypeTagsBlock)(NSArray<NSString *> *tags, ZZBlockType block);
@interface ZZCodeTheme : ZZBaseTheme

#pragma mark - 自定义 :: Color
/** 设置backgroundColor -> 格式: .backgroundColor(主题标识, UIColor对象) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagColor backgroundColor;

/** 设置textColor -> 格式: .textColor(主题标识, UIColor对象) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagColor textColor;

/** 设置tintColor -> 格式: .tintColor(主题标识, UIColor对象) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagColor tintColor;

/** 设置fillColor -> 格式: .fillColor(主题标识, UIColor对象) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagColor fillColor;

/** 设置strokeColor -> 格式: .strokeColor(主题标识, UIColor对象) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagColor strokeColor;

/** 设置borderColor -> 格式: .borderColor(主题标识, UIColor对象) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagColor borderColor;

/** 设置shadowColor -> 格式: .shadowColor(主题标识, UIColor对象) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagColor shadowColor;

/** 设置onTintColor -> 格式: .onTintColor(主题标识, UIColor对象) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagColor onTintColor;

/** 设置thumbTintColor -> 格式: .thumbTintColor(主题标识, UIColor对象) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagColor thumbTintColor;

/** 设置separatorColor -> 格式: .separatorColor(主题标识, UIColor对象) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagColor separatorColor;

/** 设置barTintColor -> 格式: .barTintColor(主题标识, UIColor对象) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagColor barTintColor;

/** 设置placeholderColor -> 格式: .placeholderColor(主题标识, UIColor对象) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagColor placeholderColor;

/** 设置trackTintColor -> 格式: .trackTintColor(主题标识, UIColor对象) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagColor trackTintColor;

/** 设置progressTintColor -> 格式: .progressTintColor(主题标识, UIColor对象) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagColor progressTintColor;

/** 设置highlightedTextColor -> 格式: .highlightedTextColor(主题标识, UIColor对象) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagColor highlightedTextColor;

/** 设置pageIndicatorTintColor -> 格式: .pageIndicatorTintColor(主题标识, UIColor对象) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagColor pageIndicatorTintColor;

/** 设置currentPageIndicatorTintColor -> 格式: .currentPageIndicatorTintColor(主题标识, UIColor对象) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagColor currentPageIndicatorTintColor;
// -------------------------------------------------------------------------------------

/** 设置按钮标题颜色 -> 格式: .titleColorWithState(主题标识, UIColor对象, UIControlState) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagColorState titleColorWithState;

/** 设置按钮标题阴影色 -> 格式: .titleShadowColorWithState(主题标识, UIColor对象, UIControlState) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagColorState titleShadowColorWithState;

// -------------------------------------------------------------------------------------

#pragma mark - 自定义 :: Image
/** 设置image -> 格式: .image(主题标识, image对象或名字) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagImage image;

/** 设置trackImage -> 格式: .image(主题标识, image对象或名字) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagImage trackImage;

/** 设置progressImage -> 格式: .image(主题标识, image对象或名字) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagImage progressImage;

/** 设置shadowImage -> 格式: .image(主题标识, image对象或名字) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagImage shadowImage;

/** 设置selectedImage -> 格式: .image(主题标识, image对象或名字) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagImage selectedImage;

/** 设置backgroundImage -> 格式: .image(主题标识, image对象或名字) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagImage backgroundImage;

/** 设置backIndicatorImage -> 格式: .image(主题标识, image对象或名字) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagImage backIndicatorImage;

/** 设置backIndicatorTransitionMaskImage -> 格式: .image(主题标识, image对象或名字) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagImage backIndicatorTransitionMaskImage;

/** 设置selectionIndicatorImage -> 格式: .image(主题标识, image对象或名字) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagImage selectionIndicatorImage;

/** 设置scopeBarBackgroundImage -> 格式: .image(主题标识, image对象或名字) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagImage scopeBarBackgroundImage;
// -------------------------------------------------------------------------------------

/** 设置UITabbarItem的titleTextAttributes -> 格式: .titleTextAttributesWithState(主题标识, Dict, UIControlState) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagDictionaryState titleTextAttributesWithState;
// -------------------------------------------------------------------------------------

/** 设置UIButton的图片 -> 格式: .imageWithState(NSString *tag, id image, UIControlState state) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagImageState imageWithState;

/** 设置UIButton的背景色 -> 格式: .backgroundImageWithState(NSString *tag, id image, UIControlState state) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagImageState backgroundImageWithState;
// -------------------------------------------------------------------------------------

/** 设置文本 -> 格式: .text(NSString *tag, NSString *str) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagStr text;
// -------------------------------------------------------------------------------------

/** 设置不同状态下的title -> 格式: .titleWithState(NSString *tag, NSString *str, UIControlState state) */
@property (nonatomic, copy, readonly) ZZBlockTypeTagStrState titleWithState;
// -------------------------------------------------------------------------------------
@end
