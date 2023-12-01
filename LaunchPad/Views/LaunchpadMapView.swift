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
                        CustomAsyncImage(imageURL: pad.imageURL, size: ImageSize.small, scaleMode: ScaleMode.fill)
                            .onTapGesture {
                                path.append(Routes.detailView(pad))
                            }
                            .scaledToFill()
                            .clipShape(.circle)
                            .overlay(RoundedRectangle(cornerRadius: 100)
                                .stroke(.black, lineWidth: 2))

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
    LaunchpadMapView().environmentObject(MapViewModel()).environmentObject(ListViewModel())
}
