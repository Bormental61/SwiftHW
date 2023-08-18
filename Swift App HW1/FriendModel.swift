struct FriendsModel: Decodable {
    var responce: Friends
}

struct Friends: Decodable {
    var items: [Friends]
}

struct Friend: Decodable {
    var id: Int
    var firstName: String?
    var lastName: String?
    var photo: String?

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first-name"
        case lastName = "last_name"
        case photo = "photo_50"
    }
}