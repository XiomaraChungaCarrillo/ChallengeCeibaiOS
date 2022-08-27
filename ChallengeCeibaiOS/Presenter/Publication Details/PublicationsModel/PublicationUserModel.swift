//
//  PublicationUserModel.swift
//  ChallengeCeibaiOS
//
//  Created by Xio iOS on 27/08/22.
//

import Foundation

struct PublicationUserModel: Decodable {
    let userId: Int?
    let id: Int?
    let title: String?
    let body: String?
    
    enum CodingKeys: String, CodingKey {
        case userId
        case id
        case title
        case body
    }
    
    init(userId: Int, id: Int, title: String, body: String) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let userId: Int = try container.decode(Int.self, forKey: .userId)
        let id: Int = try container.decode(Int.self, forKey: .id)

        let title: String = try container.decode(String.self, forKey: .title)
        let body: String = try container.decode(String.self, forKey: .body)
        
        self.init(userId: userId, id: id, title: title, body: body)
    }
}
