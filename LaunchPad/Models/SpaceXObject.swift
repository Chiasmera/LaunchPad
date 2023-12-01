import Foundation

/// Indicates that the inheriting object is fetched from the SpaceX API
protocol SpaceXObject : Displayable, Identifiable, Codable {
    var id : String {get}
}

/// Indicates that the object can be displayed in the app by title, description and an image
protocol Displayable {
    var title : String {get}
    var description : String {get}
    var shortInfo : String {get}
    var imageURL : URL? {get}
}

/// Indicates that the inheriting object may have linked capsules in the API. Requires the object to have a list of String IDs representing capsules.
protocol HasCapsules : SpaceXObject{
    /// A list of IDs pointing at capsule objects in the SpaceX API
    var capsuleIDs : [String] {get}
}

/// Indicates that the inheriting object may have linked crew in the API. Requires the object to have a list of String IDs representing crew.
protocol HasCrew : SpaceXObject{
    /// A list of IDs pointing at crew objects in the SpaceX API
    var crewIDs : [String] {get}

}

/// Indicates that the inheriting object may have linked launchpads in the API. Requires the object to have a list of String IDs representing launchpads
protocol HasLaunchpad  : SpaceXObject{
    /// A list of IDs pointing at launchpad objects in the SpaceX API
    var launchpadIDs : [String] {get}

}

/// Indicates that the inheriting object may have linked launches in the API. Requires the object to have a list of String IDs representing launches
protocol HasLaunches : SpaceXObject{
    /// A list of IDs pointing at launch objects in the SpaceX API
    var launchIDs : [String] {get}

}

/// Indicates that the inheriting object may have linked rockets in the API. Requires the object to have a list of String IDs representing rockets
protocol HasRockets : SpaceXObject {
    /// A list of IDs pointing at rocket objects in the SpaceX API
    var rocketIDs : [String] {get}

}

/// Indicates that the inheriting object may have linked payloads in the API. Requires the object to have a list of String IDs representing payloads
protocol HasPayload : SpaceXObject {
    /// A list of IDs pointing at payload objects in the SpaceX API
    var payloadIDs : [String] {get}

}


