//
//  ELRAppDelegate.m
//  Euler Demo
//
//  Created by Jack Mousseau on 5/28/20.
//  Copyright © 2020 Jack Mousseau. All rights reserved.
//

#import "ELRAppDelegate.h"

@implementation ELRAppDelegate


- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return YES;
}

#pragma mark - Scene Session Lifecycle

- (UISceneConfiguration *)application:(UIApplication *)application
configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession
                              options:(UISceneConnectionOptions *)options {
    return [[UISceneConfiguration alloc] initWithName:@"Euler"
                                          sessionRole:connectingSceneSession.role];
}

@end
