//
//  LandingPad.swift
//  LaunchPad
//
//  Created by dmu mac 23 on 29/11/2023.
//

import Foundation


/// Represents a SpaceX Launchpad
struct Launchpad : HasLaunches, HasRockets {
    let images : Images
    let name: String
    let fullName : String
    let latitude: Double
    let longitude: Double
    let rocketIDs : [String]
    let launchIDs : [String]
    let details : String
    let id: String

    enum CodingKeys: String, CodingKey {
        case images, name, fullName, latitude, longitude, details, id
        case launchIDs = "launches"
        case rocketIDs = "rockets"
    }

    struct Images : Codable{
        let large : [URL]
    }

    var title: String {
        return fullName
    }

    var description: String {
        return details
    }

    var imageURL: URL? {
        return images.large.first
    }

}
