//
//  XMPPHandle.h
//  WeChat
//
//  Created by wuqh on 15/12/29.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"
#import "AccountModel.h"

typedef enum {
    XMPPResultTypeLoginSuccess,//登录成功
    XMPPResultTypeLoginFailure,//登录失败
    XMPPResultTypeRegisterSuccess,
    XMPPResultTypeRegisterFailure
}XMPPResultType;

/**
 *  与服务器交互的结果
 */
typedef void (^XMPPResultBlock)(XMPPResultType);

@interface XMPPHandle : NSObject

@property (nonatomic, assign, getter=isRegisterOperation) BOOL registerOperation;
@property (nonatomic, copy) XMPPResultBlock resultBlock;

/**
 *  单例
 */
singleton_interface(XMPPHandle)

/**
 *  用户登陆
 */
- (void)xmppLoginWith:(AccountModel *)accountModel result:(XMPPResultBlock)resultBlock;
/**
 *  用户注册
 */
- (void)xmppRegisterWith:(AccountModel *)accountModel result:(XMPPResultBlock)resultBlock;
/**
 *  注销
 */
- (void)xmppLogout;
@end
