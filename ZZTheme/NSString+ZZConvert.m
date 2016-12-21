//
//  NSString+ZZThemeColor.m
//  Demo
//
//  Created by 刘威振 on 8/25/16.
//  Copyright © 2016 刘威振. All rights reserved.
//

#import "NSString+ZZConvert.h"

@implementation NSString (ZZConvert)

- (UIColor *)zz_toColor {
    NSAssert(self.length > 0, @"字符串转UIColor对象失败");
    NSString *colorString = [[self stringByReplacingOccurrencesOfString:@"#" withString: @""] uppercaseString];
    
    CGFloat alpha, red, blue, green;
    
    switch ([colorString length]) {
        case 0:
            return nil;
        case 3: // #RGB
            alpha = 1.0f;
            red   = [self colorComponentFrom:colorString start: 0 length: 1];
            green = [self colorComponentFrom: colorString start: 1 length: 1];
            blue  = [self colorComponentFrom: colorString start: 2 length: 1];
            break;
        case 4: // #ARGB
            alpha = [self colorComponentFrom: colorString start: 0 length: 1];
            red   = [self colorComponentFrom: colorString start: 1 length: 1];
            green = [self colorComponentFrom: colorString start: 2 length: 1];
            blue  = [self colorComponentFrom: colorString start: 3 length: 1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 2];
            green = [self colorComponentFrom: colorString start: 2 length: 2];
            blue  = [self colorComponentFrom: colorString start: 4 length: 2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom: colorString start: 0 length: 2];
            red   = [self colorComponentFrom: colorString start: 2 length: 2];
            green = [self colorComponentFrom: colorString start: 4 length: 2];
            blue  = [self colorComponentFrom: colorString start: 6 length: 2];
            break;
        default:
            alpha = 0, red = 0, blue = 0, green = 0;
            break;
    }
    
    return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
}

- (CGFloat) colorComponentFrom:(NSString *)string start:(NSUInteger)start length:(NSUInteger) length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0f;
}

- (UIImage *)zz_toImage {
    UIImage *image = [UIImage imageNamed:self];
    if (!image) {
        image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:self ofType:nil]];
        // image = 从沙盒中取
    }
    NSAssert(image, @"未得到图片");
    return image;
}

@end
