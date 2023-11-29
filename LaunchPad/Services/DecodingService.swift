//
//  DecodingService.swift
//  LaunchPad
//
//  Created by dmu mac 23 on 30/11/2023.
//

import Foundation

class DecodingService {
    /// Helper method to decode JSON with default set of strategies. Assumes UNIX time and converts from snakecase to camelcase
    /// - Parameters:
    ///   - type: The type of the expected result
    ///   - data: the Data that the method should attempt to decode
    /// - Returns: an object of the given type, decoded from the given data
    static func decodeJSON<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
        return try decoder.decode(type, from: data)
    }
}
