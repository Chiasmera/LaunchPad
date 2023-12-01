
import Foundation

enum Routes : Hashable, Equatable{

    case detailView(any SpaceXObject)

    func hash(into hasher: inout Hasher) {
        switch self {
        case .detailView(let object): hasher.combine(object.id)
        }
    }

    static func == (lhs: Routes, rhs: Routes) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
}


