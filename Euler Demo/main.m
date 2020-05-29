//
//  main.m
//  Euler Demo
//
//  Created by Jack Mousseau on 5/28/20.
//  Copyright © 2020 Jack Mousseau. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ELRAppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;

    @autoreleasepool {
        appDelegateClassName = NSStringFromClass([ELRAppDelegate class]);
    }

    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
