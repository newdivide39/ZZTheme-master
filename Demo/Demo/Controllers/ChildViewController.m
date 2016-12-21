//
//  ChildViewController.m
//  Demo
//
//  Created by 刘威振 on 8/26/16.
//  Copyright © 2016 刘威振. All rights reserved.
//

#import "ChildViewController.h"
#import "NSObject+ZZTheme.h"
#import "ZZThemeManager.h"

@interface ChildViewController ()


@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // [self testJsonTheme];
    [self testCodeTheme];
}

- (IBAction)redButtonClick:(id)sender {
     [[ZZThemeManager sharedManager] startTheme:RED];
}

- (IBAction)greenButtonClick:(id)sender {
     [[ZZThemeManager sharedManager] startTheme:GREEN];
}

- (IBAction)blueButtonClick:(id)sender {
     [[ZZThemeManager sharedManager] startTheme:BLUE];
}

- (void)testJsonTheme {
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton.frame = CGRectMake(0, 0, 70, 40);
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    backButton.jsonTheme.titleWithState(@"ident1", UIControlStateNormal);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    self.view.jsonTheme.backgroundColor(@"ident1");
    self.imageView.jsonTheme.image(@"ident9");
}

- (void)testCodeTheme {
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton.frame = CGRectMake(0, 0, 70, 40);
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    backButton.codeTheme.titleWithState(RED, @"红色主题", UIControlStateNormal)
    .titleWithState(GREEN, @"绿色主题", UIControlStateNormal)
    .titleWithState(BLUE, @"蓝色主题", UIControlStateNormal);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    self.view.codeTheme.backgroundColor(RED, [UIColor redColor])
    .backgroundColor(GREEN, [UIColor greenColor])
    .backgroundColor(BLUE, [UIColor blueColor]);
    
    self.imageView.codeTheme
    .image(RED, [UIImage imageNamed:@"image_2.jpg"])
    .image(GREEN, [UIImage imageNamed:@"image_3.jpg"])
    .image(BLUE, [UIImage imageNamed:@"image_5.jpg"]);
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
