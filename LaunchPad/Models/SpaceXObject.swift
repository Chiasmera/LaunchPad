//
//  SpaceXObject.swift
//  LaunchPad
//
//  Created by dmu mac 23 on 29/11/2023.
//

import Foundation


protocol SpaceXObject {
    var id : String {get}
    var title : String {get}
    var description : String {get}
    var imageURL : URL? {get}
}

protocol HasCapsules :SpaceXObject{
    var capsules : [String] {get}

}

protocol HasCrew :SpaceXObject{
    var crew : [Crew] {get}
}

protocol HasLaunchpad  :SpaceXObject{
    var landingpad : [String] {get}
}

protocol HasLaunches :SpaceXObject{
    var launches : [String] {get}
}

protocol HasRocket : SpaceXObject {
    var rocket : String {get}
}



