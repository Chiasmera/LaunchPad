
import SwiftUI

enum ImageSize : CGFloat {
    case small = 60
    case medium = 100
    case large = 200
}


/// Custom implementation of an asynchronous image. Does NOT cache image currently, but fetches from provided URL each time view is created. Shows the SpaceX logo in absence of an image
struct CustomAsyncImage: View {
    let imageURL : URL?
    let size : ImageSize

    var body: some View {
        if let url = imageURL {
            //TODO - Replace with a version that uses a cache, to prevent redownloads when scrolling
            AsyncImage(url: url, content: { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else if phase.error != nil {
                    Image(.spacexLogoIcon)
                        .resizable()
                        .scaledToFit()
                } else {
                    ProgressView()
                }
            })
            .clipShape(Circle())
            .frame(width: size.rawValue, height: size.rawValue)
            
        } else {
            Image(.spacexLogoIcon)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: size.rawValue, height: size.rawValue)
        }
    }
}

#Preview {
    CustomAsyncImage(imageURL: URL(string: "https://d3544la1u8djza.cloudfront.net/APHI/Blog/2016/10_October/persians/Persian+Cat+Facts+History+Personality+and+Care+_+ASPCA+Pet+Health+Insurance+_+white+Persian+cat+resting+on+a+brown+sofa-min.jpg"), size: .small)
}
