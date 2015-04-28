//
//  MainViewController.m
//  PlayWithCodeUI
//
//  Created by Kate Polyakova on 3/29/15.
//  Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import "MainViewController.h"
#import "LoginViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor redColor]];
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showLoginViewController:)];
    [self.view addGestureRecognizer:gesture];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self showLoginViewController:nil];
}


-(void)showLoginViewController: (id)sender{
    LoginViewController *childViewController = [[LoginViewController alloc] init];
    [self presentViewController:childViewController animated:YES completion:nil];
    
    
    
}



@end
