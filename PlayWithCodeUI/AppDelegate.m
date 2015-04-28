//
//  AppDelegate.m
//  PlayWithCodeUI
//
//  Created by Kate Polyakova on 3/29/15.
//  Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    CGSize screenSize  = [UIScreen mainScreen].bounds.size;
    CGRect frame = CGRectMake(0, 0, screenSize.width, screenSize.height);
    
    // создаем главное окно
    self.window = [[UIWindow alloc] initWithFrame:frame];
    [self.window makeKeyAndVisible];
    
    MainViewController *mainViewController = [[MainViewController alloc] init];
    self.window.rootViewController = mainViewController;
    
    
    
    return YES;
}



@end
