import Foundation


/// Responsible for handling the state of the Map View,
class MapViewModel : ObservableObject {
    @Published private(set) var launchpads = [Launchpad]()

    init () {
        fetchLaunchpads()
    }


    /// Fetches and decodes all launchpads and assigns them to the Published list
    private func fetchLaunchpads() {
        Task (priority: .high ) {
        guard let launchpad : [Launchpad] = await fetchAndDecode(url: APIEndpoints.launchPad.rawValue) else {return}
        Task.detached { @MainActor in
                            self.launchpads = launchpad
                        }
        }
    }


    /// Fetches and Decodes from a url, returning a genereic object, using the appropriate services
    /// - Parameter url: URL of the fetch request
    /// - Returns: a generic of the specified type
    private func fetchAndDecode<T : Codable> (url : String) async -> T? {
        guard let data = await NetworkService.fetch(from: url) else { return nil }
        do {
            let result = try DecodingService.decodeJSON(T.self, from: data)
            return result
        } catch {
            print("JSON decoding failed. No objects has been fetched from \(url)")
            return nil
        }
    }
}
