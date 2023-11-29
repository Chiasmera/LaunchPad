//
//  LaunchPadApp.swift
//  LaunchPad
//
//  Created by dmu mac 23 on 29/11/2023.
//

import SwiftUI

@main
struct LaunchPadApp: App {
    let launchController = LaunchController()
    let launchpadController = LaunchpadController()


    var body: some Scene {
        WindowGroup {
            TabOverView()
                .environmentObject(launchController)
                .environmentObject(launchpadController)

        }
    }
}
