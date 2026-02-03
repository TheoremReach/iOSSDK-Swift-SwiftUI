# TheoremReach iOS-SDK (Swift + SwiftUI Version)

**This is the Swift + SwiftUI migration of the TheoremReach iOS SDK example app.**

The original Objective-C version can be found in the `iOSSDK` directory. The Swift + Storyboard version can be found in `iOSSDK-Swift-Storyboard`. This SwiftUI version demonstrates the same functionality using modern SwiftUI architecture.

For additional information, please see the [TheoremReach iOS SDK Integration](https://theoremreach.com/docs/ios).

## Project Structure

- **Language:** Swift
- **UI Framework:** SwiftUI
- **Min iOS Version:** iOS 14.0+  (iOS 15.0+ recommended for best SwiftUI support)
- **Frameworks:** TheoremReachSDK.xcframework, PlaytimeMonetize.xcframework
- **Architecture:** SwiftUI App with UIApplicationDelegateAdaptor for SDK integration

## Key Features

- Modern SwiftUI declarative UI
- UIApplicationDelegateAdaptor for legacy SDK integration
- @Published properties for reactive state management
- Environment object injection for app-wide state
- SwiftUI-compatible color extensions
- Support for all device orientations

## Implementation Notes

### SDK Integration
TheoremReach SDK (Objective-C based) is integrated using `UIApplicationDelegateAdaptor`:
- AppDelegate handles SDK initialization and delegate protocols
- @Published properties make SDK state available to SwiftUI views
- @EnvironmentObject provides app-wide access to AppDelegate

### UI Architecture
- **ContentView**: Main SwiftUI view with purple background and survey button
- **AppDelegate**: Observable object managing SDK lifecycle
- **Color Extension**: Hex color support for SwiftUI

## Changelog
### v3.5.8
- Miscellaneous updates

### v3.5.7
- Remove bitcode

### v3.5.6
- Updated version tracking and default colors

### v3.5.5
- Fix close and refresh buttons for iPhone 8 and earlier

### v3.5.4
- Better third party login support

### v3.5.3
- Fix issue with redirecting to offers

### v3.5.2
- Fix visual issue in landscape

### v3.5.1
- Added getIsSurveyAvailable

### v3.5.0
- Minor performance improvements

### v3.4.4
- Correctly lookup sdk version

### v3.4.3
- Use xcframework

### v3.4.2
- Fix code signing issue

### v3.4.1
- Fix LC_VERSION_MIN_IPHONEOS to now be 14.0 error

### v3.4.0
- Future proof for iOS 14
- Fix iPadOS display issue with the reward center viewcontroller

### v3.3.6
- Fixing iPad bug for iOS 13

## Cocoapods:

Add the following to your `podfile`

  ```groovy
  pod 'TheoremReach', '3.4.3'
  ```

  #### Manual:

  Download the latest version of the [TheoremReach iOS SDK](https://github.com/theoremreach/iOSSDK) and add the **TheoremReachSDK.xcframework** to your project. Follow the integration guide to setup your application to use TheoremReach.

## Other platforms:

[TheoremReach Android SDK Integration](https://theoremreach.com/docs/android)

[TheoremReach Unity SDK Integration](https://theoremreach.com/docs/unity)

[TheoremReach Javascript Web SDK Integration](https://theoremreach.com/docs/web)  
