//
//  ObjectLinkRow.swift
//  LaunchPad
//
//  Created by dmu mac 23 on 30/11/2023.
//

import SwiftUI

struct ObjectLinkRow: View {
    let title : String
    let subText : String
    let imageURL : URL? = nil
//    let destination : () -> Destination

    
    var body: some View {
        NavigationLink {
            Text("Placeholder")

        } label: {
            IconRow(imageURL: imageURL, title: title, subText: subText)
        }
    }
}

#Preview {
    ObjectLinkRow(title: "Test launch", subText: "this is a date")
}
