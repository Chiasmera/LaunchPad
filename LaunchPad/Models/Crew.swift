
import Foundation


/// Nested object required for decoding of a Crew ID from the SpaceX API
struct CrewAssignment: Codable  {
    let id: String
    let role: String

    enum CodingKeys: String, CodingKey {
        case id = "crew"
        case role
    }
}


/// Represents a SpaceX Crew member
struct Crew : HasLaunches {
    let name : String
    let agency : String
    let image : URL?
    let launchIDs : [String]
    let status : String
    let id : String

    enum CodingKeys: String, CodingKey {
        case name, agency, image, status, id
        case launchIDs = "launches"
    }


    var title: String {
        return name
    }

    var description: String {
        return agency
    }

    var imageURL: URL? {
        return image
    }
}
