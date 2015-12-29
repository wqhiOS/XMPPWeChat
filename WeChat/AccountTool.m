//
//  AccountTool.m
//  WeChat
//
//  Created by wuqh on 15/12/29.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "AccountTool.h"

#define AccountFileName [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"account.data"]

@implementation AccountTool

+ (void)saveAccount:(AccountModel *)account {
    [NSKeyedArchiver archiveRootObject:account toFile:AccountFileName];
}

static AccountModel *_account;
+ (AccountModel *)account {
    if (!_account) {
        _account = [NSKeyedUnarchiver unarchiveObjectWithFile:AccountFileName];
    }
    return _account;
}
@end
