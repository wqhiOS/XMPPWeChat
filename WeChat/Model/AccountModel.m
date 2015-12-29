//
//  AccountModel.m
//  WeChat
//
//  Created by wuqh on 15/12/29.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "AccountModel.h"

@implementation AccountModel

//singleton_implementation(AccountModel)

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_user forKey:@"user"];
    [aCoder encodeObject:_pwd forKey:@"pwd"];
    [aCoder encodeObject:@(_login) forKey:@"login"];

}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        _user = [aDecoder decodeObjectForKey:@"user"];
        _pwd = [aDecoder decodeObjectForKey:@"pwd"];
        _login = [[aDecoder decodeObjectForKey:@"login"] integerValue];
    }
    return self;
}

@end
