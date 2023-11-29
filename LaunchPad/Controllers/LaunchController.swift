//
//  LaunchVW.swift
//  LaunchPad
//
//  Created by dmu mac 23 on 29/11/2023.
//

import Foundation

class LaunchController : ObservableObject{
    @Published private(set) var launches = [Launch]()
    @Published private(set) var favoriteLaunches = [String]()
    @Published private(set) var currentCapsules = [Capsule]()

    init () {
        fetchLaunches()

    }

    func fetchCapsule(forObject object: any HasCapsules) {
        let CAPSULEBASEURL = "https://api.spacexdata.com/v4/capsules/?id="
        currentCapsules.removeAll()
        for capsuleID in object.capsules {
            Task {
                guard let capsuleData = await NetworkService.fetch(from: CAPSULEBASEURL + capsuleID) else {return}
                do {
                    let capsuleResult = try DecodingService.decodeJSON(Capsule.self, from: capsuleData)
                    Task.detached { @MainActor in
                        self.currentCapsules.append(capsuleResult)
                    }
                } catch {
                    print("JSON decoding failed. No Launches has been fetched.")
                }
            }
        }
    }

    //TODO
    func loadFavorites () {

    }

    func fetchLaunches() {
        let ALLLAUNCHES = "https://api.spacexdata.com/v5/launches"
        Task {
            guard let launchData = await NetworkService.fetch(from: ALLLAUNCHES) else { return }

            do {
                let launchResult = try DecodingService.decodeJSON([Launch].self, from: launchData)
                let sortedLaunches = launchResult.sorted(by: { a, b in
                    a.dateUnix > b.dateUnix
                })

                Task.detached { @MainActor in
                    self.launches = sortedLaunches
                }

            } catch {
                print("JSON decoding failed. No Launches has been fetched.")
            }
        }
    }




}
