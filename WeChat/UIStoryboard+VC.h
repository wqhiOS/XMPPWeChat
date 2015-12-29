//
//  UIStoryboard+VC.h
//  WeChat
//
//  Created by wuqh on 15/12/29.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIStoryboard (VC)

/**
 * 显示Storybaord的第一个控制器到窗口
 */
+(void)showInitialVCWithName:(NSString *)name;

/**
 * 得到控制器
 */
+(id)initialVCWithName:(NSString *)name;

@end
