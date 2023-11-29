//
//  NavigationView.swift
//  LaunchPad
//
//  Created by dmu mac 23 on 30/11/2023.
//

import SwiftUI

struct TabOverView: View {
    var body: some View {
        TabView {
            LaunchList()
                .tabItem {
                    Label(
                        title: { Text("Launches") },
                        icon: { Image(systemName: "airplane.departure") }
                    )
                }

            LaunchpadMapView()
                .tabItem {
                    Label(
                        title: { Text("Pads") },
                        icon: { Image(systemName: "globe.europe.africa.fill") }
                    )
                }

            Text("Favorites")
                .tabItem {
                    Label(
                        title: { Text("Favorites") },
                        icon: { Image(systemName: "star") }
                    )
                }
        }
    }
}

#Preview {
    TabOverView()
        .environmentObject(LaunchController())
        .environmentObject(LaunchpadController())
}
