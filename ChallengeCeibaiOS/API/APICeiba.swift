//
//  APICeiba.swift
//  ChallengeCeibaiOS
//
//  Created by Xio iOS on 26/08/22.
//

import Alamofire

class APICeiba {
    
    func genericRequest<T: Decodable>(
        urlAPI: String,
        completionHandler: @escaping (T) -> Void) {
        AF.request(urlAPI).responseJSON { (serviceResponse) in
           switch serviceResponse.result {
           case .success:
               do {
                   guard let genericData = serviceResponse.data else {return}
                   let encryptedData = try JSONDecoder().decode(T.self, from: genericData)
                   completionHandler(encryptedData)
               } catch {
                   return
               }
           case let .failure(serviceError):
               print(serviceError)
           }
        }
    }
}
