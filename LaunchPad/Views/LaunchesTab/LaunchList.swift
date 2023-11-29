//
//  LaunchList.swift
//  LaunchPad
//
//  Created by dmu mac 23 on 29/11/2023.
//

import SwiftUI

struct LaunchList: View {
    @EnvironmentObject var launchVW : LaunchController
    @State var path : [Routes] = []


    var body: some View {
        NavigationStack (path: $path) {
            List {
                ForEach(launchVW.launches) { launch in
                    NavigationLink(value: Routes.detailView(launch)) {
                        IconRow(
                            imageURL: launch.links.patch.small,
                            title: launch.name,
                            subText: launch.dateString
                        )
                    }
                    .navigationDestination(for: Routes.self) { route in
                        switch route {
                        case .detailView(let object):
                            LaunchDetailView(current: object, path: $path  )
                        }
                    }
                }
                .navigationTitle("Launches")
            }
        }
    }
}

//#Preview {
//    LaunchList().environmentObject(LaunchController())
//}

