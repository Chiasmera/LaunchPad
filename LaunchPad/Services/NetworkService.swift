//
//  NetworkService.swift
//  LaunchPad
//
//  Created by dmu mac 23 on 29/11/2023.
//

import Foundation

/// Default endpoints for the SpaceX API
enum APIEndpoints : String {
    case launches = "https://api.spacexdata.com/v5/launches/"
    case capsule = "https://api.spacexdata.com/v4/capsules/"
    case crew = "https://api.spacexdata.com/v4/crew/"
    case rocket = "https://api.spacexdata.com/v4/rockets/"
    case launchPad = "https://api.spacexdata.com/v4/launchpads/"
    case payload = "https://api.spacexdata.com/v4/payloads/"

}

/// Service class managing network requests for the whole app
class NetworkService {
    /// executes a HTTP Get request for the provided URL and returns the recieved data. Prints an error code, but otherwise just returns nil on exceptions
    /// - Parameter urlString: String representation of an URL
    /// - Returns: data recieved from the request og Nil if an error was thrown
    static func fetch (from urlString: String) async -> Data? {
        do {
            let session = URLSession.shared
            guard let url = URL(string: urlString) else { throw NetworkError.invalidURL }
            let (data, response) = try await session.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse else {throw NetworkError.noResponse}

            if httpResponse.statusCode != 200 {
                throw NetworkError.statusCode(code: httpResponse.statusCode)
            }
            return data

        } catch NetworkError.noResponse {
            print("Recieved no response from \(urlString)")
        }catch NetworkError.statusCode(let code) {
            print("Could not fetch data from url \(urlString). Returned status code \(code)")
        } catch NetworkError.invalidURL {
            print("Provided string could not be converted to URL. String: \(urlString)")
        } catch {
            print("Unknown error occured while fetching from url \(urlString)")

        }
        return nil
    }

    /// Custom error types specific for the NetworkService class
    enum NetworkError : Error {
        case emptyData
        case noResponse
        case statusCode(code: Int)
        case invalidURL
    }
}
