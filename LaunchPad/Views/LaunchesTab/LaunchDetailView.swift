//
//  LaunchDetailView.swift
//  LaunchPad
//
//  Created by dmu mac 23 on 29/11/2023.
//

import SwiftUI

struct LaunchDetailView: View {
    @EnvironmentObject var launchVM : LaunchController
    let current : any SpaceXObject
    @Binding var path : [Routes]

    var body: some View {


        VStack{

                CustomAsyncImage(imageURL: current.imageURL, size: .large)
            Text(current.title)
                .font(.title)

            Text(current.description)

            if (current is (any HasLaunches)) {
                Text("Launches")
                let launch = current as! any HasLaunches
                Text(launch.launches.first ?? "Empty Launches")
            }

            if (current is (any HasCapsules)) {
                ForEach (launchVM.currentCapsules) {capsule in
                    Text("hej")

                }
            }


        }
        .padding()
        .toolbar {
            ToolbarItem {
                Button{
                    path.removeAll()
                } label: {
                    Image(systemName: "house.fill")
                }
            }


        }
        .navigationTitle(current.title)
    }
}




//#Preview {
//    LaunchDetailView(
//        current: LAUNCH).environmentObject(LaunchController())
//}
