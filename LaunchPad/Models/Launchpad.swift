//
//  LandingPad.swift
//  LaunchPad
//
//  Created by dmu mac 23 on 29/11/2023.
//

import Foundation

struct Launchpad : Codable, Identifiable, HasLaunches {
    let images : Images
    let name: String
    let fullName : String
    let latitude: Double
    let longitude: Double
    let launches : [String]
    let details : String
    let id: String

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
