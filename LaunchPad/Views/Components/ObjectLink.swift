
import SwiftUI


/// A generic view for presenting a SpaceX object as a clickable link 
struct ObjectLink: View {
    let object : any SpaceXObject


    var body: some View {
        NavigationLink(value: Routes.detailView(object)) {
            Text(object.title)
        }
    }
}
