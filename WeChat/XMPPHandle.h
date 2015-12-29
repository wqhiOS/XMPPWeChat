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
    XMPPResultTypeLoginSucess,//登录成功
    XMPPResultTypeLoginFailure//登录失败
}XMPPResultType;

/**
 *  与服务器交互的结果
 */
typedef void (^XMPPResultBlock)(XMPPResultType);

@interface XMPPHandle : NSObject

@property (nonatomic, copy) XMPPResultBlock resultBlock;

/**
 *  单例
 */
singleton_interface(XMPPHandle)

//- (void)xmppLogin:(XMPPResultBlock)resultBlock;
/**
 *  用户登陆
 */
- (void)xmppLoginWith:(AccountModel *)accountModel result:(XMPPResultBlock)resultBlock;
@end
