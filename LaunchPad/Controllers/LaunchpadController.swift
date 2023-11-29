//
//  LaunchpadController.swift
//  LaunchPad
//
//  Created by dmu mac 23 on 30/11/2023.
//

import Foundation

class LaunchpadController : ObservableObject {
    @Published private(set) var launchpads = [Launchpad]()

    init () {
        fetchLaunchpads()
    }

    func fetchLaunchpads() {
        let ALLLAUNCHPADS = "https://api.spacexdata.com/v4/launchpads"
        Task {
            guard let padData = await NetworkService.fetch(from: ALLLAUNCHPADS) else { return }

            do {
                let padResult = try DecodingService.decodeJSON([Launchpad].self, from: padData)

                Task.detached { @MainActor in
                    self.launchpads = padResult
                }

            } catch {
                print("JSON decoding failed. No Launchpads has been fetched.")
            }
        }
    }
}
