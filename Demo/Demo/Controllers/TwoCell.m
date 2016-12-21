//
//  TwoCell.m
//  Demo
//
//  Created by 刘威振 on 8/26/16.
//  Copyright © 2016 刘威振. All rights reserved.
//

#import "TwoCell.h"
#import "NSObject+ZZTheme.h"

@interface TwoCell ()

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation TwoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // [self testCodeTheme];
    [self testJsonTheme];
}

- (void)testCodeTheme {
    self.icon.codeTheme
    .image(RED, @"image_2.jpg")
    .image(GREEN, @"image_3.jpg")
    .image(BLUE, @"image_4.jpg");
    
    self.label.codeTheme
    .textColor(RED, [UIColor redColor])
    .textColor(GREEN, [UIColor greenColor])
    .textColor(BLUE, [UIColor blueColor]);
}

- (void)testJsonTheme {
    self.icon.jsonTheme.image(@"ident1");
    self.label.jsonTheme.textColor(@"ident1");
}

@end
