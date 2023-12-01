
import SwiftUI


/// Preset sizes for an image
enum ImageSize : CGFloat {
    case small = 60
    case medium = 120
    case large = 180
    case xlarge = 240
}

enum ScaleMode {
    case fit
    case fill
}


/// Custom implementation of an asynchronous image. Does NOT cache image currently, but fetches from provided URL each time view is created. Shows the SpaceX logo in absence of an image
struct CustomAsyncImage: View {
    let imageURL : URL?
    let size : ImageSize
    let scaleMode  : ScaleMode

    var body: some View {
        if let url = imageURL {
            //TODO - Replace with a version that uses a cache, to prevent redownloads when scrolling
            AsyncImage(url: url, content: { phase in
                if let image = phase.image {
                    if (scaleMode == .fit) {
                        image
                            .resizable()
                            .scaledToFit()
                    } else {
                        image
                            .resizable()
                            .scaledToFill()
                    }
                } else if phase.error != nil {
                    Image(.spacexLogoIcon)
                        .resizable()
                        .scaledToFit()
                        .clipShape(.circle)
                        .overlay(RoundedRectangle(cornerRadius: 100)
                            .stroke(.black, lineWidth: 5))
                } else {
                    ProgressView()
                }
            })
            .frame(width: size.rawValue, height: size.rawValue)
        } else {
            Image(.spacexLogoIcon)
                .resizable()
                .scaledToFit()
                .frame(width: ImageSize.small.rawValue, height: ImageSize.small.rawValue)
                .clipShape(.circle)
                .overlay(RoundedRectangle(cornerRadius: 100)
                    .stroke(.black, lineWidth: 3))
        }
    }
}

#Preview {
    CustomAsyncImage(imageURL: URL(string: "https://d3544la1u8djza.cloudfront.net/APHI/Blog/2016/10_October/persians/Persian+Cat+Facts+History+Personality+and+Care+_+ASPCA+Pet+Health+Insurance+_+white+Persian+cat+resting+on+a+brown+sofa-min.jpg"), size: .large, scaleMode: .fit)
}

