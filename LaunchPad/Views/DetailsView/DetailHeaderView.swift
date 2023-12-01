//
//  DetailHeaderView.swift
//  LaunchPad
//
//  Created by dmu mac 23 on 01/12/2023.
//

import SwiftUI


/// View presenting general information about a SpaceX object, meant for use as a header on a detail page
struct DetailHeaderView: View {
    var shownObject : any SpaceXObject

    var body: some View {
        VStack{
            VStack (alignment: .center) {
                CustomAsyncImage(imageURL: shownObject.imageURL, size: ImageSize.large, scaleMode: .fit)

                Text(shownObject.title)
                    .font(.title)

                Text(shownObject.shortInfo)
                    .font(.body)
            }
            if !shownObject.description.isEmpty{
                Text(shownObject.description)
                    .font(.caption)
                    .padding()
            }
        }

    }
}
