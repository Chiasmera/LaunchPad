//
//  Capsule.swift
//  LaunchPad
//
//  Created by dmu mac 23 on 29/11/2023.
//

import Foundation

struct Capsule : Codable, Identifiable, HasLaunches {
    let lastUpdate : String
    let launches : [String]
    let serial : String
    let status: String
    let type : String
    let id : String

    var title: String {
        return serial
    }

    var description: String {
        return status
    }

    var imageURL: URL? {
        return nil
    }

}
