//
//  LocationDetailsModel.swift
//  ChallengeCeibaiOS
//
//  Created by Xio iOS on 26/08/22.
//

struct LocationDetailsModel: Decodable {
    let street: String?
    let suite: String?
    let city: String?
    let zipcode: String?
    let geo: DetailLocationModel?
    
    
    enum CodingKeys: String, CodingKey {
        case street
        case suite
        case city
        case zipcode
        case geo
    }
    
    init(street: String, suite: String, city: String, zipcode: String, geo: DetailLocationModel) {
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode
        self.geo = geo
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let street: String = try container.decode(String.self, forKey: .street)
        let suite: String = try container.decode(String.self, forKey: .suite)
        let city: String = try container.decode(String.self, forKey: .city)
        let zipcode: String = try container.decode(String.self, forKey: .zipcode)
        let geo: DetailLocationModel = try container.decode(DetailLocationModel.self, forKey: .geo)
        
        self.init(street: street, suite: suite, city: city, zipcode: zipcode, geo: geo)
    }
}




