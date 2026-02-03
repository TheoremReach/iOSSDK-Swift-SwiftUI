//
//  AppDelegate.swift
//  TheoremReachiOSExampleApp (SwiftUI Version)
//
//  Adapted for SwiftUI with UIApplicationDelegateAdaptor
//  Copyright © 2017 theoremreach. All rights reserved.
//

import UIKit
import SwiftUI
import TheoremReachSDK
import WebKit
import AppTrackingTransparency

class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {

    @Published var surveyAvailable: Bool = false
    @Published var didBecomeActive: Bool = false

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // PlaytimeMonetize styling
        if let frameworkVCClass = NSClassFromString("PlaytimeMonetize.WebOfferwallViewController"),
           let wkScrollClass = NSClassFromString("WKScrollView") as? UIAppearance.Type {
            if let appearanceClass = wkScrollClass.appearance(whenContainedInInstancesOf: [frameworkVCClass]) as? UIView {
                appearanceClass.backgroundColor = TheoremReach.colorWithHexString("#1B0C47")
            }
        } else {
            if NSClassFromString("PlaytimeMonetize.WebOfferwallViewController") == nil {
                print("WARNING: Could not find framework VC class for styling.")
            }
            if NSClassFromString("WKScrollView") == nil {
                print("WARNING: Could not find 'WKScrollView' class for styling.")
            }
        }

        // Initialize TheoremReach SDK
        initializeTheoremReachSDK()

        // Request IDFA permissions after a delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.askForIDFAPermissions()
        }

        return true
    }

    func initializeTheoremReachSDK() {
        TheoremReach.initWithApiKey("9148c4176f36f5302eb0a56695eb", userId: "23344342252")

        let tr = TheoremReach.getInstance()
        tr.setRewardListenerDelegate(self)
        tr.setSurveyListenerDelegate(self)
        tr.setSurveyAvailableDelegate(self)

        // Customize navigation bar look
        tr.navigationBarTextColor = "#FFFFFF"
        tr.navigationBarText = "Demo Title"
        tr.navigationBarColor = "#211548"
        tr.setAdjoePlaytimeEnabled(true)
    }

    func askForIDFAPermissions() {
        ATTrackingManager.requestTrackingAuthorization { authStatus in
            switch authStatus {
            case .notDetermined:
                print("authStatus Not Determined.")
            case .restricted:
                print("authStatus Restricted.")
            case .denied:
                print("You have denied WizardBucks the right to retrieve your IDFA.")
            case .authorized:
                print("You have allowed WizardBucks to retrieve your IDFA.")
            @unknown default:
                print("authStatus Unknown.")
            }
        }
    }

    // MARK: - UIApplicationDelegate Lifecycle Methods

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused while the application was inactive.
        DispatchQueue.main.async {
            self.didBecomeActive = true
        }
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate.
    }
}

// MARK: - TheoremReach Delegate Protocols

extension AppDelegate: TheoremReachRewardDelegate {
    func onReward(_ quantity: NSNumber) {
        // Award user the content!
        print("TheoremReach onReward: \(quantity)")
    }
}

extension AppDelegate: TheoremReachSurveyDelegate {
    func onRewardCenterOpened() {
        // Reward center opened! Time to take surveys!
        print("TheoremReach onRewardCenterOpened")
    }

    func onRewardCenterClosed() {
        // Reward center closed! Back to the app to use our coins!
        print("TheoremReach onRewardCenterClosed")
    }

    func onRewardCenterViewSet() {
        print("TheoremReach onRewardCenterViewSet")
    }

    func onSessionIdSet() {
        print("TheoremReach onSessionIdSet")
    }
}

extension AppDelegate: TheoremReachSurveyAvailableDelegate {
    func theoremreachSurveyAvailable(_ surveyAvailable: Bool) {
        DispatchQueue.main.async {
            self.surveyAvailable = surveyAvailable
            if surveyAvailable {
                print("TheoremReach Survey Available!")
            } else {
                print("TheoremReach Survey Not Available!")
            }
        }
    }
}
