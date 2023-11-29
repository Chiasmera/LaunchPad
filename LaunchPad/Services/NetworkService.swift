//
//  NetworkService.swift
//  LaunchPad
//
//  Created by dmu mac 23 on 29/11/2023.
//

import Foundation

enum NetworkError : Error {
    case emptyData
    case noResponse
    case statusCode(code: Int)
    case invalidURL
}

class NetworkService {

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
}
