//
//  APIsEndPoint.swift
//  ChallengeCeibaiOS
//
//  Created by Xio iOS on 26/08/22.
//

import Foundation

class APIsEndPoint {
    
    private let mainPoint = "https://jsonplaceholder.typicode.com"
    
    func createMainPoint(idValue: String) -> String {
        
        let urlString = mainPoint + idValue
        return urlString
    }
}
