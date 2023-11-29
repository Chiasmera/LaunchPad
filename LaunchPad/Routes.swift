//
//  NavigationController.swift
//  LaunchPad
//
//  Created by dmu mac 23 on 30/11/2023.
//

import Foundation

enum Routes : Hashable, Equatable{

    case detailView(any SpaceXObject)

    func hash(into hasher: inout Hasher) {
        switch self {
        case .detailView(let object): hasher.combine(object.id)
        }
    }

    static func == (lhs: Routes, rhs: Routes) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
}


