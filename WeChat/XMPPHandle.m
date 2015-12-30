//
//  XMPPHandle.m
//  WeChat
//
//  Created by wuqh on 15/12/29.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "XMPPHandle.h"
#import "XMPPFramework.h"
@interface XMPPHandle()<XMPPStreamDelegate>
{
    AccountModel *_accountModel;
    XMPPResultBlock _resultBlock;
}
@property (nonatomic, strong) XMPPStream *xmppStream;

@end

@implementation XMPPHandle

singleton_implementation(XMPPHandle)

#pragma mark - public
- (void)xmppLoginWith:(AccountModel *)accountModel result:(XMPPResultBlock)resultBlock{
    //不管怎样首先断开连接
    [self.xmppStream disconnect];
    
    _accountModel = accountModel;
    _resultBlock = resultBlock;
    [self connectToHost];
}

- (void)xmppRegisterWith:(AccountModel *)accountModel result:(XMPPResultBlock)resultBlock {
    [self.xmppStream disconnect]; 
    _accountModel = accountModel;
    _resultBlock = resultBlock;
    [self connectToHost];
}

- (void)xmppLogout {
    [self sendOffline];
    [self disconncetFromHost];
}

#pragma mark - private 
- (void)connectToHost {

    self.xmppStream.myJID = [XMPPJID jidWithUser:_accountModel.user domain:@"wuqh.local" resource:@"iOS"];
    self.xmppStream.hostName = @"127.0.0.1";
//    self.xmppStream.hostPort = 5222;默认就是5222
    NSError *error = nil;
    [self.xmppStream connectWithTimeout:XMPPStreamTimeoutNone error:&error];
    if (error) {
        NSLog(@"%@",error);
    }else {
        NSLog(@"连接发送成功成功");
    }
}

- (void)sendPwdToHost {
    NSError *error = nil;
    [self.xmppStream authenticateWithPassword:_accountModel.pwd error:&error];
    if (error) {
        NSLog(@"%@",error);
    }
}

- (void)sendOnline {
    XMPPPresence *presence = [XMPPPresence presence];
    [self.xmppStream sendElement:presence];
}

-(void)sendOffline{
    XMPPPresence *offline = [XMPPPresence presenceWithType:@"unavailable"];
    [self.xmppStream sendElement:offline];
}

-(void)disconncetFromHost{
    [self.xmppStream disconnect];
}

#pragma mark - getter 
- (XMPPStream *)xmppStream {
    if (!_xmppStream) {
        _xmppStream = [[XMPPStream alloc] init];
        [_xmppStream addDelegate:self delegateQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)];
    }
    return _xmppStream;
}

#pragma mark - XMPPStreamDelegate
#pragma mark 建立连接成功
- (void)xmppStreamDidConnect:(XMPPStream *)sender {
    NSLog(@"%s",__func__);
    if (self.isRegisterOperation) {
        NSError *error = nil;
        [self.xmppStream registerWithPassword:_accountModel.pwd error:&error];
        if (error) {
            NSLog(@"%@",error);
        }
    }else {
        [self sendPwdToHost];
    }
}
#pragma mark 与服务器断开连接
- (void)xmppStreamDidDisconnect:(XMPPStream *)sender withError:(NSError *)error {
    NSLog(@"%@",error);
    NSLog(@"%s",__func__);
}
#pragma mark 登陆成功
- (void)xmppStreamDidAuthenticate:(XMPPStream *)sender {
    NSLog(@"%s",__func__) ;
    [self sendOnline];
    if (_resultBlock) {
        _resultBlock(XMPPResultTypeLoginSuccess);
    }
}
#pragma mark 登陆失败
- (void)xmppStream:(XMPPStream *)sender didNotAuthenticate:(DDXMLElement *)error {
    NSLog(@"%s",__func__);
    if (_resultBlock) {
        _resultBlock(XMPPResultTypeLoginFailure);
    }
}
#pragma mark 注册成功
- (void)xmppStreamDidRegister:(XMPPStream *)sender {
    NSLog(@"%s",__func__);
    if (_resultBlock) {
        _resultBlock(XMPPResultTypeRegisterSuccess);
    }
}
#pragma mark 注册失败
- (void)xmppStream:(XMPPStream *)sender didNotRegister:(DDXMLElement *)error {
    NSLog(@"%@",error);
    if (_resultBlock) {
        _resultBlock(XMPPResultTypeRegisterFailure);
    }
}




@end
