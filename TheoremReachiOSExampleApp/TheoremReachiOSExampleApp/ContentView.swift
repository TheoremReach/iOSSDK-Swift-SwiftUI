//
//  ContentView.swift
//  TheoremReachiOSExampleApp (SwiftUI Version)
//
//  SwiftUI UI for TheoremReach SDK integration
//  Copyright © 2017 theoremreach. All rights reserved.
//

import SwiftUI
import TheoremReachSDK

struct ContentView: View {
    @EnvironmentObject var appDelegate: AppDelegate

    var body: some View {
        ZStack {
            // Background color
            Color(hex: "#1B0C47")
                .ignoresSafeArea()

            VStack(spacing: 30) {
                Spacer()

                // Logo/App Icon
                Image("AppIcon")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .cornerRadius(20)
                    .shadow(radius: 10)

                // Title
                Text("TheoremReach Demo App")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Spacer()

                // Survey button
                Button(action: launchTheoremReach) {
                    Text("Take Surveys!")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: 200)
                        .background(Color.blue)
                        .cornerRadius(10)
                }

                // Survey availability indicator
                if appDelegate.surveyAvailable {
                    Text("Surveys Available!")
                        .foregroundColor(.green)
                        .font(.caption)
                } else {
                    Text("No surveys available")
                        .foregroundColor(.gray)
                        .font(.caption)
                }

                Spacer()
            }
            .padding()
        }
    }

    func launchTheoremReach() {
        // Get root view controller for presentation
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = windowScene.windows.first?.rootViewController else {
            print("ERROR: Could not get root view controller")
            return
        }

        // Launch TheoremReach SDK
        TheoremReach.getInstance().showRewardCenter(from: rootViewController)
    }
}

// MARK: - Helper Extensions

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        scanner.scanHexInt64(&hexNumber)

        let r = Double((hexNumber & 0xff0000) >> 16) / 255
        let g = Double((hexNumber & 0x00ff00) >> 8) / 255
        let b = Double(hexNumber & 0x0000ff) / 255

        self.init(red: r, green: g, blue: b)
    }
}

#Preview {
    ContentView()
        .environmentObject(AppDelegate())
}
