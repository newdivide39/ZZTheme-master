//
//  ZZBaseTheme.m
//  Demo
//
//  Created by 刘威振 on 16/8/24.
//  Copyright © 2016年 刘威振. All rights reserved.
//

#import "ZZBaseTheme.h"
#import <objc/runtime.h>

@implementation ZZBaseTheme
@synthesize info1 = _info1;
@synthesize info2 = _info2;
@synthesize info3 = _info3;
@synthesize info4 = _info4;
@synthesize info5 = _info5;
@synthesize info6 = _info6;
@synthesize info7 = _info7;
@synthesize info8 = _info8;
@synthesize info9 = _info9;

- (void)manageInfos {
    [self manageInfo1];
    [self manageInfo2];
    [self manageInfo3];
    [self manageInfo4];
    [self manageInfo5];
    [self manageInfo6];
    [self manageInfo7];
    [self manageInfo8];
    [self manageInfo9];
}

- (void)manageInfo1 {}
- (void)manageInfo2 {}
- (void)manageInfo3 {}
- (void)manageInfo4 {}
- (void)manageInfo5 {}
- (void)manageInfo6 {}
- (void)manageInfo7 {}
- (void)manageInfo8 {}
- (void)manageInfo9 {}

#pragma mark - 懒加载
LazyLoad_Common(NSMutableDictionary, info1)
LazyLoad_Common(NSMutableDictionary, info2)
LazyLoad_Common(NSMutableDictionary, info3)
LazyLoad_Common(NSMutableDictionary, info4)
LazyLoad_Common(NSMutableDictionary, info5)
LazyLoad_Common(NSMutableDictionary, info6)
LazyLoad_Common(NSMutableDictionary, info7)
LazyLoad_Common(NSMutableDictionary, info8)
LazyLoad_Common(NSMutableDictionary, info9)

@end
