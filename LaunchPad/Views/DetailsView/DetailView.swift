
import SwiftUI


/// Presents a detailed view of the selected SpaceX object, containin additional information and links to other related SpaceX objects
struct DetailView: View {
    @EnvironmentObject var listVM : ListViewModel
    let shownObject : any SpaceXObject
    @Binding var path : [Routes]
    @State var rockets = [Rocket]()
    @State var crews = [Crew]()
    @State var capsules = [Capsule]()
    @State var launches = [Launch]()
    @State var payloads = [Payload]()
    var isFavorite :Bool {
        return listVM.favorites.contains(shownObject.id)
    }

    var body: some View {
        VStack {
            DetailHeaderView(shownObject: shownObject)

            List{
                if  !crews.isEmpty  {
                    LinkSection(title: "Crew", objectList: crews)
                }

                if !rockets.isEmpty {
                    LinkSection(title: "Rocket", objectList: rockets)
                }

                if !capsules.isEmpty {
                    LinkSection(title: "Capsule", objectList: capsules)
                }

                if !payloads.isEmpty {
                    LinkSection(title: "Payloads", objectList: payloads)
                }

                if   !launches.isEmpty  {
                    LinkSection(title: "Launches", objectList: launches)
                }
            }

        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
                if (shownObject is Launch) {
                    FavoriteButton(isFavorite: isFavorite, id: shownObject.id)
                }
                HomeButton(path: $path)
        }
        .task { @MainActor in
            if let rocketed = shownObject as? (any HasRockets) {
                rockets = await listVM.fetchLinked(forIDs: rocketed.rocketIDs)
            }
        }
        .task { @MainActor in
            if let crewed = shownObject as? (any HasCrew) {
                crews = await listVM.fetchLinked(forIDs: crewed.crewIDs)
            }
        }
        .task { @MainActor in
            if let capsuled = shownObject as? (any HasCapsules) {
                capsules = await listVM.fetchLinked(forIDs: capsuled.capsuleIDs)
            }
        }
        .task { @MainActor in
            if let launched = shownObject as? (any HasLaunches) {
                launches = await listVM.fetchLinked(forIDs: launched.launchIDs)
            }
        }
        .task { @MainActor in
            if let payloaded = shownObject as? (any HasPayload) {
                payloads = await listVM.fetchLinked(forIDs: payloaded.payloadIDs)
            }
        }
    }
}


#Preview {
    LaunchListView().environmentObject(ListViewModel())
}
