import UIKit

struct PhotoEntity: Decodable {
    var id: Int
    var albumId: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}
