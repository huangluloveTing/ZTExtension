//
//  UIColor+ZTHex.m
//  ZTExtension
//
//  Created by 黄露 on 2017/11/17.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#import "UIColor+ZTHex.h"

@implementation UIColor (ZTHex)

// 透明度固定为1，以0x开头的十六进制转换成的颜色
+ (UIColor*) colorWithHex:(long)hexColor;
{
    return [UIColor colorWithHex:hexColor alpha:1.];
}

// 0x开头的十六进制转换成的颜色,透明度可调整
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity
{
    float red = ((float)((hexColor & 0xFF0000) >> 16))/255.0;
    float green = ((float)((hexColor & 0xFF00) >> 8))/255.0;
    float blue = ((float)(hexColor & 0xFF))/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:opacity];
}

// 颜色转换三：iOS中十六进制的颜色（以#开头）转换为UIColor
+ (UIColor *) colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // 判断前缀并剪切掉
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

+ (UIColor *) getPixelColorAtLocation:(CGPoint)location inImage:(UIImage *)image {
    UIColor* color = nil;
//    CGImageRef inImage = image.CGImage;
//    CGContextRef cgctx = [self createARGBBitmapContextFromImage:image];
//
//    if (cgctx == NULL) {
//        return nil; /* error */
//    }
//    size_t w = CGImageGetWidth(inImage);
//    size_t h = CGImageGetHeight(inImage);
//    CGRect rect = {{0,0},{w,h}};
//
//    CGContextDrawImage(cgctx, rect, inImage);
//    unsigned char* data = CGBitmapContextGetData (cgctx);
//    if (data != NULL) {
//        int offset = 4*((w*round(point.y))+round(point.x));
//        int alpha =  data[offset];
//        int red = data[offset+1];
//        int green = data[offset+2];
//        int blue = data[offset+3];
//        color = [UIColor colorWithRed:(red/255.0f) green:(green/255.0f) blue:
//                 (blue/255.0f) alpha:(alpha/255.0f)];
//    }
//    CGContextRelease(cgctx);
//    if (data) {
//        free(data);
//    }
    return color;
}

@end
