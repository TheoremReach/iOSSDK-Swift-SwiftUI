//
//  TheoremReachiOSExampleAppApp.swift
//  TheoremReachiOSExampleApp (SwiftUI Version)
//
//  SwiftUI app with TheoremReach SDK integration via UIApplicationDelegateAdaptor
//  Copyright © 2017 theoremreach. All rights reserved.
//

import SwiftUI

@main
struct TheoremReachiOSExampleAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appDelegate)
        }
    }
}
