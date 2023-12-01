import Foundation


/// Represents a SpaceX Rocket
struct Rocket : SpaceXObject {
    let flickrImages : [URL?]
    let name : String
    let description : String
    let id : String

    var title: String { return name}

    var shortInfo: String { "" }

    var imageURL: URL? { return flickrImages.first ?? nil}

}

