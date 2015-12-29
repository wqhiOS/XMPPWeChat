//
//  LoginViewController.m
//  WeChat
//
//  Created by wuqh on 15/12/29.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "LoginViewController.h"
#import "XMPPHandle.h"
#import "AccountTool.h"

@interface LoginViewController ()
{
    AccountModel *_account;
}
@property (weak, nonatomic) IBOutlet UITextField *userField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;

@end

@implementation LoginViewController

- (void)dealloc {
    NSLog(@"%s",__func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - action
- (IBAction)loginBtnClick:(id)sender {
    AccountModel *account = [[AccountModel alloc] init];
    account.user = self.userField.text;
    account.pwd = self.pwdField.text;
    _account = account;

    __weak typeof(self) weakSelf = self;
    [[XMPPHandle sharedXMPPHandle] xmppLoginWith:account result:^(XMPPResultType resultType) {
        [weakSelf handleXMPPResultType:resultType];
    }];
}

#pragma mark - private
- (void)handleXMPPResultType:(XMPPResultType)resultType {
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (resultType  == XMPPResultTypeLoginSucess) {
            [UIStoryboard showInitialVCWithName:@"Main"];
            _account.login = YES;
            [AccountTool saveAccount:_account];
            
        }else {
            
        }
        
    });
}


@end
