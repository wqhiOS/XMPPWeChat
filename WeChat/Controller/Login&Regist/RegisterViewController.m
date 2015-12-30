//
//  RegisterViewController.m
//  WeChat
//
//  Created by wuqh on 15/12/29.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "RegisterViewController.h"
#import "XMPPHandle.h"

@interface RegisterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cancelRegister:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)registerBtnClick:(id)sender {
    AccountModel *account = [[AccountModel alloc] init];
    account.user = self.userField.text ;
    account.pwd = self.pwdField.text;
    [XMPPHandle sharedXMPPHandle].registerOperation = YES;
    [[XMPPHandle sharedXMPPHandle] xmppRegisterWith:account result:^(XMPPResultType resultType) {
        if (resultType == XMPPResultTypeRegisterSuccess) {
            NSLog(@"注册成功");
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
