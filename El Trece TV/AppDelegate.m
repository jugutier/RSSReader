//
//  AppDelegate.m
//  El Trece TV
//
//  Created by Julian Gutierrez Ferrara on 1/5/16.
//  Copyright (c) 2016 Artear. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    ARMainViewController* mainVC = [[ARMainViewController alloc]init];
    [self.window setRootViewController:mainVC];
    [self.window makeKeyAndVisible];
    return YES;
}
@end
