//
//  OneViewController.m
//  Demo
//
//  Created by 刘威振 on 16/8/24.
//  Copyright © 2016年 刘威振. All rights reserved.
//

#import "OneViewController.h"
#import "NSObject+ZZTheme.h"
#import "ZZThemeManager.h"

@interface OneViewController ()

@property (weak, nonatomic) IBOutlet UIButton *redButton;
@property (weak, nonatomic) IBOutlet UIButton *greenButton;
@property (weak, nonatomic) IBOutlet UIButton *blueButton;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation OneViewController

- (IBAction)redButtonClick:(id)sender {
    [[ZZThemeManager sharedManager] startTheme:RED];
}

- (IBAction)greenButtonClick:(id)sender {
   [[ZZThemeManager sharedManager] startTheme:GREEN];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor greenColor]} forState:UIControlStateSelected];
}

- (IBAction)blueButtonClick:(id)sender {
    [[ZZThemeManager sharedManager] startTheme:BLUE];
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    // [[ZZThemeManager sharedManager] setAnimationDuration:2];
    
    // [self testCodeTheme];
    [self testJsonTheme];
}

- (void)testCodeTheme {
    // self.view.codeTheme.backgroundColor(RED, [UIColor redColor]);
    
    self.redButton.layer.borderWidth = self.greenButton.layer.borderWidth = self.blueButton.layer.borderWidth = 2;
    self.redButton.layer.codeTheme
    .borderColor(RED, [UIColor redColor])
    .borderColor(GREEN, [UIColor greenColor])
    .borderColor(BLUE, [UIColor blueColor]);
    
    self.greenButton.layer.codeTheme
    .borderColor(RED, [UIColor redColor])
    .borderColor(GREEN, [UIColor greenColor])
    .borderColor(BLUE, [UIColor blueColor]);
    
    self.blueButton.layer.codeTheme
    .borderColor(RED, [UIColor redColor])
    .borderColor(GREEN, [UIColor greenColor])
    .borderColor(BLUE, [UIColor blueColor]);
    
    self.redButton.codeTheme
    .titleColorWithState(RED, [UIColor redColor], UIControlStateNormal)
    .titleColorWithState(GREEN, [UIColor greenColor], UIControlStateNormal)
    .titleColorWithState(BLUE, [UIColor blueColor], UIControlStateNormal);
    
    self.greenButton.codeTheme
    .titleColorWithState(RED, [UIColor redColor], UIControlStateNormal)
    .titleColorWithState(GREEN, [UIColor greenColor], UIControlStateNormal)
    .titleColorWithState(BLUE, [UIColor blueColor], UIControlStateNormal);
    
    self.blueButton.codeTheme
    .titleColorWithState(RED, [UIColor redColor], UIControlStateNormal)
    .titleColorWithState(GREEN, [UIColor greenColor], UIControlStateNormal)
    .titleColorWithState(BLUE, [UIColor blueColor], UIControlStateNormal);
    
    self.label.codeTheme
    .textColor(RED, [UIColor redColor])
    .textColor(GREEN, [UIColor greenColor])
    .textColor(BLUE, [UIColor blueColor]);
    
    self.label.codeTheme.text(RED, @"红色字体").text(GREEN, @"绿色字体").text(BLUE, @"蓝色字体");
}

- (void)testJsonTheme {
    // self.view.jsonTheme.backgroundColor(@"ident1");
    self.redButton.layer.borderWidth = self.greenButton.layer.borderWidth = self.blueButton.layer.borderWidth = 2;
    self.redButton.layer.jsonTheme.borderColor(@"ident1");
    self.greenButton.layer.jsonTheme.borderColor(@"ident1");
    self.blueButton.layer.jsonTheme.borderColor(@"ident1");
    
    self.redButton.jsonTheme.titleColorWithState(@"ident1", UIControlStateNormal);
    self.greenButton.jsonTheme.titleColorWithState(@"ident1", UIControlStateNormal);
    self.blueButton.jsonTheme.titleColorWithState(@"ident1", UIControlStateNormal);
    
    self.label.jsonTheme.textColor(@"ident1");
    
    self.label.jsonTheme.text(@"ident1");
}

@end
