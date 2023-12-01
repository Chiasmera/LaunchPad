
import SwiftUI


/// Button that adds or removes the provided ID string to the list of favorites when clicked
struct FavoriteButton: View {
    @EnvironmentObject var listVM : ListViewModel
    @State var isFavorite : Bool
    var id : String

    var body: some View {
        Button{
            if isFavorite {
                listVM.removeFavorite(id: id)
            } else {
                listVM.addFavorite(id: id)
            }
        } label: {
            Image(systemName: isFavorite ? "star.fill" : "star")
                .tint(Color.yellow)
        }
    }
}

#Preview {
    FavoriteButton(isFavorite: true, id: "testid")
}
