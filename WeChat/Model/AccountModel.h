//
//  AccountModel.h
//  WeChat
//
//  Created by wuqh on 15/12/29.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "BaseModel.h"
#import "Singleton.h"

@interface AccountModel : BaseModel<NSCoding>

/**
 *  账号
 */
@property (nonatomic, copy) NSString *user;
/**
 *  密码
 */
@property (nonatomic, copy) NSString *pwd;
/**
 *  判断用户是否登录
 */
@property(nonatomic,assign,getter=isLogin)BOOL login;

/**
 *  单例
 */
//singleton_interface(AccountModel);




@end
