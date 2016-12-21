//
//  RootViewController.m
//  Demo
//
//  Created by 刘威振 on 16/8/24.
//  Copyright © 2016年 刘威振. All rights reserved.
//

#import "RootViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "NSObject+ZZTheme.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (instancetype)init {
    if (self = [super init]) {
        [self testJsonTheme];
        // [self testCodeTheme];
    }
    return self;
}

- (void)testJsonTheme {
    OneViewController *vc1 = [[OneViewController alloc] init];
    UITabBarItem *item = [[UITabBarItem alloc] init];
    item.title = @"Alipay";
    item.jsonTheme.image(@"ident6");
    item.jsonTheme.selectedImage(@"ident3");
    item.jsonTheme.titleTextAttributesWithState(@{NSForegroundColorAttributeName : @"ident1"}, UIControlStateSelected);
    vc1.tabBarItem = item;
    
    TwoViewController *vc2 = [[TwoViewController alloc] init];
    item       = [[UITabBarItem alloc] init];
    item.title = @"JD";
    item.jsonTheme.image(@"ident7");
    item.jsonTheme.selectedImage(@"ident4");
    item.jsonTheme.titleTextAttributesWithState(@{NSForegroundColorAttributeName : @"ident1"}, UIControlStateSelected);
    vc2.tabBarItem = item;
    UINavigationController *nivController = [[UINavigationController alloc] initWithRootViewController:vc2];
    
    ThreeViewController *vc3 = [[ThreeViewController alloc] init];
    item       = [[UITabBarItem alloc] init];
    item.title = @"QQ";
    item.jsonTheme.image(@"ident8");
    item.jsonTheme.selectedImage(@"ident5");
    item.jsonTheme.titleTextAttributesWithState(@{NSForegroundColorAttributeName : @"ident1"}, UIControlStateSelected);
    vc3.tabBarItem = item;
    self.viewControllers = @[vc1, nivController, vc3];
}

- (void)testCodeTheme {
    OneViewController *vc1 = [[OneViewController alloc] init];
    UITabBarItem *item = [[UITabBarItem alloc] init];
    item.title = @"Alipay";
    UIImage *image = [[UIImage imageNamed:@"支付宝_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item.image = image;
    item.codeTheme
    .selectedImage(RED, [[UIImage imageNamed:@"支付宝_red"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal])
    .selectedImage(GREEN, [[UIImage imageNamed:@"支付宝_green"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal])
    .selectedImage(BLUE, [[UIImage imageNamed:@"支付宝_blue"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]);
    item.codeTheme
    .titleTextAttributesWithState(RED, @{NSForegroundColorAttributeName : [UIColor redColor]}, UIControlStateSelected)
    .titleTextAttributesWithState(GREEN, @{NSForegroundColorAttributeName : [UIColor greenColor]}, UIControlStateSelected)
    .titleTextAttributesWithState(BLUE, @{NSForegroundColorAttributeName : [UIColor blueColor]}, UIControlStateSelected);
    vc1.tabBarItem = item;
    
    
    TwoViewController *vc2 = [[TwoViewController alloc] init];
    image      = [[UIImage imageNamed:@"京东_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item       = [[UITabBarItem alloc] init];
    item.title = @"JD";
    item.image = image;
    item.codeTheme
    .selectedImage(RED, [[UIImage imageNamed:@"京东_red"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal])
    .selectedImage(GREEN, [[UIImage imageNamed:@"京东_green"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal])
    .selectedImage(BLUE, [[UIImage imageNamed:@"京东_blue"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]);
    // 设置item标题颜色
    item.codeTheme
    .titleTextAttributesWithState(RED, @{NSForegroundColorAttributeName : [UIColor redColor]}, UIControlStateSelected)
    .titleTextAttributesWithState(GREEN, @{NSForegroundColorAttributeName : [UIColor greenColor]}, UIControlStateSelected)
    .titleTextAttributesWithState(BLUE, @{NSForegroundColorAttributeName : [UIColor blueColor]}, UIControlStateSelected);
    vc2.tabBarItem = item;
    
    UINavigationController *nivController = [[UINavigationController alloc] initWithRootViewController:vc2];
    
    ThreeViewController *vc3 = [[ThreeViewController alloc] init];
    image      = [[UIImage imageNamed:@"qq_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item       = [[UITabBarItem alloc] init];
    item.title = @"QQ";
    item.image = image;
    
    // 设置item标题颜色
    item.codeTheme
    .titleTextAttributesWithState(RED, @{NSForegroundColorAttributeName : [UIColor redColor]}, UIControlStateSelected)
    .titleTextAttributesWithState(GREEN, @{NSForegroundColorAttributeName : [UIColor greenColor]}, UIControlStateSelected)
    .titleTextAttributesWithState(BLUE, @{NSForegroundColorAttributeName : [UIColor blueColor]}, UIControlStateSelected);
    
    item.codeTheme
    .selectedImage(RED, [[UIImage imageNamed:@"qq_red"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal])
    .selectedImage(GREEN, [[UIImage imageNamed:@"qq_green"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal])
    .selectedImage(BLUE, [[UIImage imageNamed:@"qq_blue"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]);
    vc3.tabBarItem = item;
    self.viewControllers = @[vc1, nivController, vc3];
}

@end
