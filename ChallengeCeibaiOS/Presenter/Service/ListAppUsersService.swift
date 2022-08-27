//
//  ListAppUsersService.swift
//  ChallengeCeibaiOS
//
//  Created by Xio iOS on 26/08/22.
//

import UIKit

 public class ListAppUsersService {
    
    private let apisEndPoint: APIsEndPoint
    private let apiCeiba: APICeiba
    
    init(apisEndPoint: APIsEndPoint = APIsEndPoint(),
         apiCeiba: APICeiba = APICeiba()) {
        self.apisEndPoint = apisEndPoint
        self.apiCeiba = apiCeiba
    }
    
    func loadingUsersList(completionHandler: @escaping ([UserInventoryModel]) -> Void) {
        
        let url = apisEndPoint.createMainPoint(idValue: "/users")
        apiCeiba.genericRequest(urlAPI: url) { (result: [UserInventoryModel]) in
            completionHandler(result)
        }
    }
    
}

