//
//  DetailLocationModel.swift
//  ChallengeCeibaiOS
//
//  Created by Xio iOS on 27/08/22.
//

struct DetailLocationModel: Decodable {
    let lat: String?
    let lng: String?
    
    enum CodingKeys: String, CodingKey {
        case lat
        case lng
    }
    
    init(lat: String, lng: String) {
        self.lat = lat
        self.lng = lng
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let lat: String = try container.decode(String.self, forKey: .lat)
        let lng: String = try container.decode(String.self, forKey: .lng)
        
        self.init(lat: lat, lng: lng)
    }
}
