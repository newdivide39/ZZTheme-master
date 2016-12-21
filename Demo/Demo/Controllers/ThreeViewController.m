//
//  ThreeViewController.m
//  Demo
//
//  Created by 刘威振 on 16/8/24.
//  Copyright © 2016年 刘威振. All rights reserved.
//

#import "ThreeViewController.h"
#import "NSObject+ZZTheme.h"

@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    // [self testCodeTheme];
    [self testJsonTheme];
}

- (void)testCodeTheme {
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width - 20, 50)];
    pageControl.numberOfPages = 8;
    pageControl.currentPage = 2;
    self.view.backgroundColor = [UIColor darkGrayColor];
    pageControl.pageIndicatorTintColor = [UIColor yellowColor];
    pageControl.codeTheme.currentPageIndicatorTintColor(RED, [UIColor redColor]).currentPageIndicatorTintColor(GREEN, [UIColor greenColor]).currentPageIndicatorTintColor(BLUE, [UIColor blueColor]);
    [self.view addSubview:pageControl];
}

- (void)testJsonTheme {
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width - 20, 50)];
    pageControl.numberOfPages = 8;
    pageControl.currentPage = 2;
    self.view.backgroundColor = [UIColor darkGrayColor];
    pageControl.pageIndicatorTintColor = [UIColor yellowColor];
    pageControl.jsonTheme.currentPageIndicatorTintColor(@"ident1");
    [self.view addSubview:pageControl];
}

@end
