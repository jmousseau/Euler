//
//  ELROrientationTracker.h
//  Euler
//
//  Created by Jack Mousseau on 5/28/20.
//  Copyright © 2020 Jack Mousseau. All rights reserved.
//

#import <ARKit/ARKit.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/// The notification posted when the orientation trackers's orientation changes.
///
/// The notification's object will be a UIInterfaceOrientation as an NSNumber.
FOUNDATION_EXPORT NSString * _Nullable const ELROrientationDidChangeNotification;

/// An orientation tracker that determines device orientation using AR frames.
NS_SWIFT_NAME(OrientationTracker)
@interface ELROrientationTracker : NSObject

/// The current interface orientation.
@property (nonatomic, readonly) UIInterfaceOrientation orientation;

/// Add a given AR frame to the tracker.
///
/// @param frame The frame to add.
- (void)addFrame:(nonnull ARFrame *)frame NS_SWIFT_NAME(add(frame:));

@end
