# Euler

Euler determines device orientation using an [`ARSession`](https://apple.co/2TON0jw).

```swift
// Create a tracker.
let orientationTracker = OrientationTracker()

// Add each frame provided by ARKit.
orientationTracker.add(frame: frame)

// Access the current orientation...
orientationTracker.orientation

// or listen for orientation change notifications.
NotificationCenter.default.addObserver(
    self,
    selector: #selector(orientationDidChange(_:)),
    name: .ELROrientationDidChange,
    object: nil
)
```