//
//  ELRSceneDelegate.m
//  Euler Demo
//
//  Created by Jack Mousseau on 5/28/20.
//  Copyright © 2020 Jack Mousseau. All rights reserved.
//

#import "ELRSceneDelegate.h"
#import "Euler_Demo-Swift.h"

@implementation ELRSceneDelegate

- (void)scene:(UIScene *)scene
willConnectToSession:(UISceneSession *)session
      options:(UISceneConnectionOptions *)connectionOptions {
    if (![scene isKindOfClass:[UIWindowScene class]]) {
        return;
    }

    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
    self.window.rootViewController = [[OrientationViewController alloc] init];
    [self.window makeKeyAndVisible];
}

@end
