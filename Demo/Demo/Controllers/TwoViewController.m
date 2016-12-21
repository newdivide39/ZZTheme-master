//
//  TwoViewController.m
//  Demo
//
//  Created by 刘威振 on 16/8/24.
//  Copyright © 2016年 刘威振. All rights reserved.
//

#import "TwoViewController.h"
#import "TwoCell.h"
#import "NSObject+ZZTheme.h"
#import "ChildViewController.h"

@interface TwoViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"都是月亮惹的祸";;
    
    // [self testCodeTheme];
    [self testJsonTheme];
}

- (void)testJsonTheme {
    self.navigationController.navigationBar.jsonTheme.barTintColor(@"ident1");
}

- (void)testCodeTheme {
    self.navigationController.navigationBar.codeTheme
    .barTintColor(RED, [UIColor redColor])
    .barTintColor(GREEN, [UIColor greenColor])
    .barTintColor(BLUE, [UIColor blueColor]);
}

#pragma mark - <UITableViewDelegate, UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    TwoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TwoCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ChildViewController *controller = [[ChildViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
