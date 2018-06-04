//
//  ZTOritationSupport.m
//  ZTExtension
//
//  Created by 黄露 on 2018/6/4.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import "ZTOritationSupport.h"

@implementation ZTOritationSupport

+ (void) saveCurrentWindowOrientation:(UIInterfaceOrientation)orientation {
    switch (orientation) {
        case UIInterfaceOrientationLandscapeLeft:
            [[NSUserDefaults standardUserDefaults]setObject:@(Orientations_left) forKey:@"orientationLandscape"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            break;
        case UIInterfaceOrientationLandscapeRight:
            [[NSUserDefaults standardUserDefaults]setObject:@(Orientations_right) forKey:@"orientationLandscape"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            break;
        case UIInterfaceOrientationPortrait:
            [[NSUserDefaults standardUserDefaults]setObject:@(Orientations_Portrait) forKey:@"orientationLandscape"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            break;
        default:
            break;
    }
}

+ (UIInterfaceOrientationMask) currentWindowOrientation {
    UIInterfaceOrientationMask  orientationMask  = UIInterfaceOrientationMaskPortrait;
    NSNumber *orientationnum  =[[NSUserDefaults standardUserDefaults]objectForKey:@"orientationLandscape"];
    
    if(orientationnum)
    {
        Orientations orientationStatus = [orientationnum integerValue];
        switch (orientationStatus) {
            case Orientations_MaskAll:
            {
                orientationMask = UIInterfaceOrientationMaskAll;
            }
                break;
            case Orientations_Portrait:
            {
                orientationMask = UIInterfaceOrientationMaskPortrait;
            }
                break;
            case Orientations_left:
            {
                orientationMask = UIInterfaceOrientationMaskLandscapeLeft;
            }
                break;
            case Orientations_right:
            {
                orientationMask = UIInterfaceOrientationMaskLandscapeRight;
            }
                break;
            case Orientations_Landscape:
            {
                orientationMask = UIInterfaceOrientationMaskLandscape;
            }
                break;
            default:
                orientationMask = UIInterfaceOrientationMaskPortrait;
                break;
        }
    }
    return orientationMask;
}

@end
