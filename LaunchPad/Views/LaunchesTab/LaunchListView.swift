
import SwiftUI


/// A view displaying all current launches
struct LaunchListView: View {
    @EnvironmentObject var launchController : ListViewModel
    @State var path : [Routes] = []
    var favoritesOnly : Bool = false


    var body: some View {
        NavigationStack (path: $path) {
            List {
                ForEach(launchController.launches) { launch in
                    if !favoritesOnly || launchController.favorites.contains(launch.id) {
                        NavigationLink(value: Routes.detailView(launch)) {
                            IconRow(
                                imageURL: launch.links.patch.small,
                                title: launch.name,
                                subText: launch.shortInfo
                            )

                        }
                    }

                }
                .navigationTitle(favoritesOnly ? "Favorites" : "Launches")
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
    LaunchListView().environmentObject(ListViewModel())
}
