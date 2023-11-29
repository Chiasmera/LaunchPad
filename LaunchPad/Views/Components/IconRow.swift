//
//  IconRow.swift
//  LaunchPad
//
//  Created by dmu mac 23 on 29/11/2023.
//

import SwiftUI

struct IconRow: View {
    let imageURL : URL?
    let title : String
    let subText : String

    var body: some View {
        HStack {

                CustomAsyncImage(imageURL: imageURL, size: .small)
            

            VStack (alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(subText)
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    IconRow(imageURL: URL(string: "https://d3544la1u8djza.cloudfront.net/APHI/Blog/2016/10_October/persians/Persian+Cat+Facts+History+Personality+and+Care+_+ASPCA+Pet+Health+Insurance+_+white+Persian+cat+resting+on+a+brown+sofa-min.jpg"),
            title: "Cat",
            subText: "i like cats")
}
