import SwiftUI


/// The Main view of the App. Presents 3 tabs: a list of launches, a map of launchpads and a list of favorite launches
struct TabOverView: View {
    var body: some View {
        TabView {
            LaunchListView()
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

            LaunchListView(favoritesOnly: true)
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
        .environmentObject(ListViewModel())
        .environmentObject(MapViewModel())
}
