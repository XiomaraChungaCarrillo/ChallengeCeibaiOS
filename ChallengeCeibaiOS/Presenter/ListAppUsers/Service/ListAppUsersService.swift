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
}

// MARK: - Upload Users List
extension ListAppUsersService {
    
    func loadingUsersList(completionHandler: @escaping ([UserInventoryModel]) -> Void) {
        
        let url = apisEndPoint.createMainPoint(idValue: "/users")
        apiCeiba.genericRequest(urlAPI: url) { (result: [UserInventoryModel]) in
            completionHandler(result)
        }
    }
}

// MARK: - Load User Posts
extension ListAppUsersService {
    func loadingUserPublications(_ valueUserID: Int,completionHandler: @escaping ([PublicationUserModel]) -> Void) {
        
        let url = apisEndPoint.createMainPoint(idValue: "/posts?userId=\(valueUserID)")
        apiCeiba.genericRequest(urlAPI: url) { (result: [PublicationUserModel]) in
            completionHandler(result)
        }
    }
}
