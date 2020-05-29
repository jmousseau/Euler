//
//  ELROrientationTracker.m
//  Euler
//
//  Created by Jack Mousseau on 5/28/20.
//  Copyright © 2020 Jack Mousseau. All rights reserved.
//

#import "ELROrientationTracker.h"

/// The notification posted when the orientation trackers's orientation changes.
NSString * _Nonnull const ELROrientationDidChangeNotification = @"ELROrientationDidChangeNotification";

/// 3 * PI / 14
#define ELR_3_PI_14 0.67319

/// 4 * PI / 14
#define ELR_4_PI_14 0.89759

/// 10 * PI / 14
#define ELR_10_PI_14 2.24399

/// 11 * PI / 14
#define ELR_11_PI_14 2.46839

/// 17 * PI / 14
#define ELR_17_PI_14 3.81479

/// 18 * PI / 14
#define ELR_18_PI_14 4.03919

/// 24 * PI / 14
#define ELR_24_PI_14 5.38558

/// An orientation tracker that determines device orientation using AR frames.
@interface ELROrientationTracker ()

/// The current interface orientation.
@property (nonatomic) UIInterfaceOrientation orientation;

@end

@implementation ELROrientationTracker

- (instancetype)init {
    if (self = [super init]) {
        _orientation = UIInterfaceOrientationUnknown;
    }
    return self;
}

- (void)addFrame:(ARFrame *)frame {
    // Ensure the device isn't "flat".
    if (fabs(frame.camera.eulerAngles.x) > ELR_4_PI_14) {
        return;
    }

    float rotation = frame.camera.eulerAngles.z;

    if (rotation < 0) {
        rotation = fabs(rotation);
    } else {
        rotation = 2 * M_PI - rotation;
    }

    UIInterfaceOrientation previousOrientation = self.orientation;

    if (rotation > ELR_4_PI_14 && rotation < ELR_10_PI_14) {
        self.orientation = UIInterfaceOrientationPortrait;
    } else if (rotation > ELR_11_PI_14 && rotation < ELR_17_PI_14) {
        self.orientation = UIInterfaceOrientationLandscapeRight;
    } else if (rotation > ELR_18_PI_14 && rotation < ELR_24_PI_14) {
        self.orientation = UIInterfaceOrientationPortraitUpsideDown;
    }  if ((rotation > ELR_24_PI_14 && rotation < 0) ||
           (rotation < ELR_3_PI_14 && rotation >= 0)) {
        self.orientation = UIInterfaceOrientationLandscapeLeft;
    }

    if (self.orientation != previousOrientation) {
        [NSNotificationCenter.defaultCenter postNotificationName:ELROrientationDidChangeNotification
                                                          object:@(self.orientation)];
    }
}

@end
