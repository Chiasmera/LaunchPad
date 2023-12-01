
import SwiftUI


/// A generic view for presenting a group of SpaceX objects as a section
struct LinkSection<T : SpaceXObject>: View {
    var title : String
    var objectList : [T]

    var body: some View {
            Section (title) {
                ForEach (objectList) {o in
                    ObjectLink(object: o)
                }
            }
        
    }
}

#Preview {
    LinkSection(title: "Capsules", objectList: [Launch]())
}
