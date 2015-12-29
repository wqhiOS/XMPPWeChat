//
//  UIStoryboard+VC.m
//  WeChat
//
//  Created by wuqh on 15/12/29.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "UIStoryboard+VC.h"

@implementation UIStoryboard (VC)

+(void)showInitialVCWithName:(NSString *)name{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
   
    [UIApplication sharedApplication].keyWindow.rootViewController = storyboard.instantiateInitialViewController;
}

+(id)initialVCWithName:(NSString *)name{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
    return [storyboard instantiateInitialViewController];
}

@end
