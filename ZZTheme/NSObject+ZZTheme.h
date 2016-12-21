//
//  UIView+ZZTheme.h
//  Demo
//
//  Created by 刘威振 on 16/8/24.
//  Copyright © 2016年 刘威振. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZZJsonTheme.h"
#import "ZZCodeTheme.h"

@interface NSObject (ZZTheme)

@property (nonatomic) ZZJsonTheme *jsonTheme;
@property (nonatomic) ZZCodeTheme *codeTheme;

- (BOOL)zz_isCGColorWithKeyPath:(NSString *)keyPath;

@end
