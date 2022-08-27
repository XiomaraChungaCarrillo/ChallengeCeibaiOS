//
//  CompanyPropertiesModel.swift
//  ChallengeCeibaiOS
//
//  Created by Xio iOS on 26/08/22.
//

struct CompanyPropertiesModel: Decodable {
    let name: String?
    let catchPhrase: String?
    let bs: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case catchPhrase
        case bs
    }
    
    init(name: String, catchPhrase: String, bs: String) {
        self.name = name
        self.catchPhrase = catchPhrase
        self.bs = bs
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let name: String = try container.decode(String.self, forKey: .name)
        let catchPhrase: String = try container.decode(String.self, forKey: .catchPhrase)
        let bs: String = try container.decode(String.self, forKey: .bs)
        
        self.init(name: name, catchPhrase: catchPhrase, bs: bs)
    }
}
