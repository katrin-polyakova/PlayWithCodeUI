//
//  LoginViewController.m
//  PlayWithCodeUI
//
//  Created by Kate Polyakova on 3/29/15.
//  Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import "LoginViewController.h"
#import "NSString+Utils.h"

@interface LoginViewController ()

@property(nonatomic, strong) UITextField *emailField;
@property(nonatomic, strong) UITextField *passField;
@property(nonatomic, strong) UITextField *passConfirmField;
@property(nonatomic, strong) UIButton *loginButton;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor greenColor]];
    
//    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide:)];
//    [self.view addGestureRecognizer:gesture];

    [self setupSubviews];
}

- (void)setupSubviews {
    // create subview
    self.emailField = [[UITextField alloc] initWithFrame:CGRectMake(10, 30, 250, 22)];
    self.passField = [[UITextField alloc] initWithFrame:CGRectMake(10, 62, 250, 22)];
    self.passConfirmField = [[UITextField alloc] initWithFrame:CGRectMake(10, 94, 250, 22)];
    self.loginButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 126, 80, 22)];

    //add as subviews to parent view
//    [self.view addSubview:self.emailField];
//    [self.view addSubview:self.passField];
//    [self.view addSubview:self.passConfirmField];
//    [self.view addSubview:self.loginButton];

    [@[self.emailField, self.passField, self.passConfirmField, self.loginButton]
            enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                [self.view addSubview:obj];
            }];

    //configure text fields
    [@[self.emailField, self.passField, self.passConfirmField]
            enumerateObjectsUsingBlock:^(UITextField * obj, NSUInteger idx, BOOL *stop) {
                obj.borderStyle = UITextBorderStyleRoundedRect;
            }];

    self.emailField.placeholder = NSLocalizedString(@"email.field.placeholder", nil);
            //@"Email";
    self.passField.placeholder = NSLocalizedString(@"password.field.placeholder", nil);
            //@"Password";
    self.passConfirmField.placeholder = NSLocalizedString(@"confirm.field.placeholder", nil);
            //@" Confirm Password";

    self.passField.secureTextEntry = YES;
    self.passConfirmField.secureTextEntry = YES;

    [self.loginButton setTitle:NSLocalizedString(@"login.button.title", nil) forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];

    self.loginButton.enabled = NO;


    [self.emailField addTarget:self action:@selector(validateInput:) forControlEvents:UIControlEventEditingChanged];
    [self.passField addTarget:self action:@selector(validateInput:) forControlEvents:UIControlEventEditingChanged];
    [self.passConfirmField addTarget:self action:@selector(validateInput:) forControlEvents:UIControlEventEditingChanged];

}

- (void)validateInput:(UITextField *)sender {
    BOOL isEmailValid = [self.emailField.text validateEmail];
    BOOL isPasswordValid = [self validatePassword:self.passField.text];
    BOOL isConfirmPasswordValid = [self.passConfirmField.text isEqualToString:self.passField.text];

    self.emailField.textColor = isEmailValid ? [UIColor blackColor]:[UIColor redColor];
    self.passField.textColor = isPasswordValid ? [UIColor blackColor]:[UIColor redColor];
    self.passConfirmField.textColor = isConfirmPasswordValid ? [UIColor blackColor]:[UIColor redColor];

    self.loginButton.enabled = isEmailValid && isPasswordValid && isConfirmPasswordValid;

}

//- (void)confirmPasswordDidChange:(UITextField *)sender
//{
//    BOOL isConfirmPasswordValid = [sender.text isEqualToString:self.passField.text];
//    sender.textColor = isConfirmPasswordValid ? [UIColor blackColor]:[UIColor redColor];
//}
//- (void)passwordDidChange:(UITextField *)sender
//{
//    BOOL isPasswordValid = [self validatePassword:sender.text];
//    sender.textColor = isPasswordValid ? [UIColor blackColor]:[UIColor redColor];
//
//}
//-(void)emailDidChange:(UITextField *)sender
//{
//    BOOL isEmailValid = [sender.text validateEmail];
//    sender.textColor = isEmailValid ? [UIColor blackColor]:[UIColor redColor];
//}


- (BOOL)validatePassword:(NSString *)text
{
    BOOL isLengthValid = text.length >6 && text.length <500;
    BOOL containsAtLeastOneCap = [text rangeOfCharacterFromSet:[NSCharacterSet uppercaseLetterCharacterSet]].location != NSNotFound;

    return isLengthValid&&containsAtLeastOneCap;
}




@end
