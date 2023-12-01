import Foundation


/// Represents a SpaceX Payload
struct Payload : HasLaunches{
    let name : String
    let type : String
    let launch : String
    let id : String

    var launchIDs: [String] {
        return [launch]
    }


    var title: String {
        return name
    }

    var description: String {
        return type
    }

    var imageURL: URL? {
        return nil
    }






}
