# TheoremReach iOS-SDK (Swift + SwiftUI Version)

**This is the Swift + SwiftUI migration of the TheoremReach iOS SDK example app.**

The original Objective-C version can be found in the `iOSSDK` directory. The Swift + Storyboard version can be found in `iOSSDK-Swift-Storyboard`. This SwiftUI version demonstrates the same functionality using modern SwiftUI architecture.

For additional information, please see the [TheoremReach iOS SDK Integration](https://theoremreach.com/docs/ios).

## Project Structure

- **Language:** Swift
- **UI Framework:** SwiftUI
- **Min iOS Version:** iOS 14.0+  (iOS 15.0+ recommended for best SwiftUI support)
- **Packages:** TheoremReachSDK (this SDK's Swift package, from `iOSSDK`) and PlaytimeMonetize (adjoe's, for Playtime)
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
### v3.6.2
- The status bar over the reward center follows its title: dark content when the title is darker than the title bar,
  and light when it's lighter. With a title all but invisible on the bar (an app that hides the toolbar can leave it
  white on a light one), it follows the bar, whichever contrasts more. `rewardCenterStatusBarStyle` gives that style
  to an app that turns view controller based status bar appearance off, to set while the reward center is open
- The framework carries no purpose strings (NS...UsageDescription). It had four, which iOS never reads from a
  framework, and App Review's automated check stops an app over a vague one in any framework it embeds
- The example takes the Swift package from 3.6.2

### v3.6.0
- A Swift package: in Xcode, add `https://github.com/TheoremReach/iOSSDK` and its TheoremReachSDK product
- Ads open in the browser, not in the reward center
- Links to other apps (the App Store's itms-apps:, mailto:, tel: and an app's own scheme) on the reward center's
  pages open in the app that takes them, and an App Store page (apps.apple.com), where an offer's link often ends,
  opens the App Store. Links to your app's own schemes don't
- The xcframework includes its debug symbols (dSYMs), so crash reports name the SDK's code
- A thin loading bar replaces the loading spinner. `setLoadingBarColor:` sets its color, #FC178D by default.
  `initWithApiKey:` resets the colors, this one included, so set them after it
- `setMmpProvider:installId:` (Swift: `setMmpInstallId(provider:installId:)`) passes the install id a mobile
  measurement partner, such as Apptrove, gave the install to the reward center. Call it before the first
  `showRewardCenter`
- `showRewardCenterFromViewController:` and `showRewardCenter:fromViewController:` (Swift: `showRewardCenter(from:)` and
  `showRewardCenter(_:from:)`) present the reward center from your own view controller, for scene-based apps
- Callbacks arrive on the main thread, so move network or other long work in them off it. A reward is confirmed only
  after `onReward:` returns
- User ids are sent percent-encoded, so ids with +, &, ; or # arrive intact. A user whose id has one of them may show
  up as a new user after the update
- The color setters ignore an invalid color and keep the previous one. They take #RGB, #ARGB, #RRGGBB and #AARRGGBB,
  with or without the #
- Playtime needs adjoe 4.3 to 4.5. With Playtime turned on and no adjoe 4.3 to 4.5, the Playtime card no longer
  waits: the wall hears that no games are available, and a launch gets the usual error
- The reward center reloads if its web content process ends; a second time within ten seconds, it stays blank with X
  showing. A cancelled page load no longer shows "Unexpected Error" or leaves the loading bar
- "Unexpected Error", for a page that can't load, offers Close beside Try Again, so a respondent who's offline can
  get back to your app
- Edge swipes go back and forward in the reward center
- The close and refresh buttons are built in, with VoiceOver names, instead of downloaded before each open
- `rewardCenterViewController` is nil once the reward center closes
- `setWebViewInspectable:` lets Safari's Web Inspector attach to the reward center in your debug builds
- Removed: `TRSurveyView`'s `activityIndicator`, `overlay` and `sendPlaytimeInitialized`, and `TRSurveyViewController`'s
  `initPlaytime:`. `TRSurveyView`'s `delegate` is weak

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

## Swift Package Manager:

In Xcode, choose File > Add Package Dependencies, enter `https://github.com/TheoremReach/iOSSDK`, and add the
**TheoremReachSDK** product to your app's target.

## Cocoapods:

Add the following to your `podfile`

  ```groovy
  pod 'TheoremReach', '3.6.2'
  ```

  #### Manual:

  Download the latest version of the [TheoremReach iOS SDK](https://github.com/theoremreach/iOSSDK) and add the **TheoremReachSDK.xcframework** to your project. Follow the integration guide to setup your application to use TheoremReach.

## Other platforms:

[TheoremReach Android SDK Integration](https://theoremreach.com/docs/android)

[TheoremReach Unity SDK Integration](https://theoremreach.com/docs/unity)

[TheoremReach Javascript Web SDK Integration](https://theoremreach.com/docs/web)

## License

The example's code is under the MIT License; see [LICENSE](LICENSE). The SDKs it uses aren't covered by it: the TheoremReach SDK, from its Swift package, is licensed under the [TheoremReach Publisher Terms and Conditions](https://info.theoremreach.com/terms-of-service/), and adjoe's PlaytimeMonetize is under adjoe's terms.
