import Foundation

struct Beer: Codable {
    var id: Int
    var name: String?
    var tagline: String?
    var first_brewed: String?
    var description: String?
    var image_url: String?
    var abv: Float?
    var ibu: Float?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case tagline = "tagline"
        case first_brewed = "first_brewed"
        case description = "description"
        case image_url = "image_url"
        case abv = "abv"
        case ibu = "ibu"
    }
}

