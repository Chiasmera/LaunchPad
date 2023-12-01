import SwiftUI
import MapKit


/// View presenting a map with clickable annotations for each SpaceX launchpad
struct LaunchpadMapView: View {
    @EnvironmentObject var launchpadController : MapViewModel
    @State var path = [Routes]()

    var body: some View {
        NavigationStack (path: $path) {
            Map (initialPosition: .automatic) {
                ForEach (launchpadController.launchpads) { pad in
                    Annotation(pad.fullName, coordinate: CLLocationCoordinate2D(latitude: pad.latitude, longitude: pad.longitude)) {
                        CustomAsyncImage(imageURL: pad.imageURL, size: .medium)
                            .onTapGesture {
                                path.append(Routes.detailView(pad))
                            }
                    }
                }
            }
            .navigationDestination(for: Routes.self) { route in
                switch route {
                case .detailView(let object):
                    DetailView(shownObject: object, path: $path  )
                }
            }
        }
    }
}

#Preview {
    LaunchpadMapView().environmentObject(MapViewModel())
}
