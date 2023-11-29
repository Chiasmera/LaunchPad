//
//  LaunchpadMapView.swift
//  LaunchPad
//
//  Created by dmu mac 23 on 30/11/2023.
//

import SwiftUI
import MapKit


struct LaunchpadMapView: View {
    @EnvironmentObject var launchpadController : LaunchpadController
    @State private var selectedPad : Launchpad?
    @State var path = [Routes]()

    var body: some View {
        NavigationStack (path: $path) {
            Map (initialPosition: .automatic) {
                ForEach (launchpadController.launchpads) { pad in
                    Annotation(pad.fullName, coordinate: CLLocationCoordinate2D(latitude: pad.latitude, longitude: pad.longitude)) {
                        CustomAsyncImage(imageURL: pad.imageURL, size: .medium)
                            .onTapGesture {
                                selectedPad = pad
                            }
                    }
                }
            }
            .sheet(item: $selectedPad) { pad in
                LaunchDetailView(current: pad, path: $path)

            }
        }
    }
}

#Preview {
    LaunchpadMapView().environmentObject(LaunchpadController())
}
