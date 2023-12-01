
import Foundation


/// Responsible for managing the state of lists of launches, including the sub-list of favorites
class ListViewModel : ObservableObject{
    private var storage = StorageService.instance
    @Published private(set) var favorites = [String]()
    @Published private(set) var launches = [Launch]()

    init () {
        fetchLaunches()
        addFavoriteListener()
    }

    deinit {
        removeFavoriteListener()
    }

    /// Adds an ID to the persisted list of favorites
    /// - Parameter id: String representing the id of a Launch
    func addFavorite(id: String) {
        storage.addFavorite(favoriteID: id)
    }


    /// Removes an id from the persisted list of favorites
    /// - Parameter id: String representing the id of a Launch
    func removeFavorite(id: String) {
        storage.removeFavorite(favoriteID:id)
    }


    /// Adds a listener to the persisted list of favorites
    private func addFavoriteListener () {
        storage.addFavoriteListener(updateHandler: onUpdatedFavorites(updatedValues:))
    }


    /// Removes the current listener on the persisted list of favorites
    private func removeFavoriteListener() {
        storage.removeFavoriteListener()
    }


    /// Updates the favorites list to match the recieved argument. Is called by the listener when the list is updated.
    /// - Parameter updatedValues: updated list of Strings representing IDs of favorite launches
    private func onUpdatedFavorites(updatedValues : [String]) {
        favorites = updatedValues
    }


    /// Retrieves data from the provided SpaceX endpoint and decodes it to an object of the provided type
    /// - Parameter url: URL endpoint of the SpaceX API
    /// - Returns: returns an instance of the specified object, or Nil if either no data was recieved, or there was an error in the decoding
    func fetchAndDecode<T : Codable> (url : String) async -> T? {
        guard let data = await NetworkService.fetch(from: url) else { return nil }
        do {
            let result = try DecodingService.decodeJSON(T.self, from: data)
            return result
        } catch {
            print("JSON decoding failed. No objects has been fetched from \(url)")
            return nil
        }
    }
    

    /// Attempts to fetch an array of the specified type, by fetching and decoding from the SpaceX API endpoint corresponding to that type.
    /// - Parameter ids: A list of String IDs representing objects of the provided type
    /// - Returns: A list of successfully retrieved objects, or an empty list if no IDs could be retrieved successfully
    func fetchLinked<T : SpaceXObject>(forIDs ids: [String]) async -> [T] {
        var urlbase : String
        switch T.self {
        case is Launch.Type:
            urlbase = APIEndpoints.launches.rawValue
        case is Capsule.Type:
            urlbase = APIEndpoints.capsule.rawValue
        case is Crew.Type:
            urlbase = APIEndpoints.crew.rawValue
        case is Rocket.Type:
            urlbase = APIEndpoints.rocket.rawValue
        case is Launchpad.Type:
            urlbase = APIEndpoints.launchPad.rawValue
        case is Payload.Type:
            urlbase = APIEndpoints.payload.rawValue
        default:
            return []
        }

        var resultList = [T]()
        for id in ids {
            if let result : T = await fetchAndDecode(url: urlbase + id) {
                resultList.append(result)
            }
        }
        return resultList
    }



    /// Fetches all launches from the SpaceX API
    func fetchLaunches() {
        Task (priority: .high ) {
        guard let launches : [Launch] = await fetchAndDecode(url: APIEndpoints.launches.rawValue) else {return}
        let sortedLaunches = launches.sorted(by: { a, b in
            a.dateUnix > b.dateUnix
        })
        Task.detached { @MainActor in
                            self.launches = sortedLaunches
                        }
        }
    }
}




