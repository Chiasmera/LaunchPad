//
//  Launch.swift
//  LaunchPad
//
//  Created by dmu mac 23 on 29/11/2023.
//

import Foundation


struct Launch : Codable, Identifiable, HasCrew, HasCapsules, HasRocket {
    let links: Links
    var rocket: String
    let details: String?
    let crew: [Crew]
    let capsules: [String]
    let name: String
    let dateUnix: Date
    let id: String

    var dateString : String {
        return DateFormatter.localizedString(from: dateUnix, dateStyle: .short, timeStyle: .short)
    }

    var title: String {
        return name
    }

    var description: String {
        return details ?? ""
    }

    var imageURL: URL? {
        return links.patch.large
    }

}

struct Links: Codable {
    let patch: Patch
}

struct Patch: Codable {
    let small: URL?
    let large: URL?
}
