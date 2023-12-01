
import SwiftUI
import FirebaseCore

@main
struct LaunchPadApp: App {
    let listVM : ListViewModel
    let mapVM : MapViewModel


    init() {
        FirebaseApp.configure()
        listVM = ListViewModel()
        mapVM = MapViewModel()
    }

    var body: some Scene {
        WindowGroup {
            TabOverView()
                .environmentObject(listVM)
                .environmentObject(mapVM)

        }
    }
}

