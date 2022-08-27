//
//  UserDetailsModel.swift
//  ChallengeCeibaiOS
//
//  Created by Xio iOS on 26/08/22.
//

import Foundation

struct UserInventoryModel: Decodable {
    let id: Int?
    let name: String?
    let username: String?
    let email: String?
    let address: LocationDetailsModel?
    let phone: String?
    let website: String?
    let company: CompanyPropertiesModel?
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case username
        case email
        case address
        case phone
        case website
        case company
    }
    
    init(id: Int, name: String, username: String, email: String, address: LocationDetailsModel, phone: String, website: String, company: CompanyPropertiesModel ) {
        self.id = id
        self.name = name
        self.username = username
        self.email = email
        self.address = address
        self.phone = phone
        self.website = website
        self.company = company
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id: Int = try container.decode(Int.self, forKey: .id)
        let name: String = try container.decode(String.self, forKey: .name)
        let username: String = try container.decode(String.self, forKey: .username)
        let email: String = try container.decode(String.self, forKey: .email)
        let address: LocationDetailsModel = try container.decode(LocationDetailsModel.self, forKey: .address)
        let phone: String = try container.decode(String.self, forKey: .phone)
        let website: String = try container.decode(String.self, forKey: .website)
        let company: CompanyPropertiesModel = try container.decode(CompanyPropertiesModel.self, forKey: .company)
        
        self.init(id: id, name: name, username: username, email: email, address: address, phone: phone, website: website, company: company)
    }
}

