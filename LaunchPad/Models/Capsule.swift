
import Foundation


/// Represents a SpaceX Capsule
struct Capsule : HasLaunches {
    let lastUpdate : String?
    let launchIDs : [String]
    let serial : String
    let status: String?
    let type : String
    let id : String

    enum CodingKeys: String, CodingKey {
        case lastUpdate, serial, status,type,id
        case launchIDs = "launches"
    }


    var title: String {
        return serial
    }

    var description: String {
        return status ?? ""
    }

    var imageURL: URL? {
        return nil
    }

}
