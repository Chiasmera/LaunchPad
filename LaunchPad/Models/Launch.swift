
import Foundation

/// Represents a SpaceX Launch
struct Launch : HasCrew, HasCapsules, HasRockets, HasPayload {
    let links: Links
    var rocketID: String
    let details: String?
    let crewAssignment: [CrewAssignment]
    let capsuleIDs: [String]
    let payloadIDs: [String]
    let name: String
    let dateUnix: Date
    let id: String

    enum CodingKeys: String, CodingKey {
        case links, details, name,dateUnix,id
        case rocketID = "rocket"
        case crewAssignment = "crew"
        case capsuleIDs = "capsules"
        case payloadIDs = "payloads"
    }

    // Formatted date for convenience
//    var dateString : String {
//        return DateFormatter.localizedString(from: dateUnix, dateStyle: .short, timeStyle: .short)
//    }

    var title: String {
        return name
    }

    var crewIDs: [String] {
        return crewAssignment.map { $0.id }
    }

    var shortInfo : String {return DateFormatter.localizedString(from: dateUnix, dateStyle: .short, timeStyle: .short)}

    var description: String {
        return details ?? ""
    }

    var imageURL: URL? {
        return links.patch.large
    }

    var rocketIDs : [String] {
        return [rocketID]
    }

}


/// Nested object from API containing image links to Path images
struct Links: Codable {
    let patch: Patch
}


/// Nested object from API containing image URLs for Patches
struct Patch: Codable {
    let small: URL?
    let large: URL?
}
