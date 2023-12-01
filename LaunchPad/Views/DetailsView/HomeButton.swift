
import SwiftUI


/// Button which navigates to the root view of the given path when clicked
struct HomeButton: View {
    @Binding var path : [Routes]

    var body: some View {
        Button{
            path.removeAll()
        } label: {
            Image(systemName: "house.fill")
        }
    }
}
