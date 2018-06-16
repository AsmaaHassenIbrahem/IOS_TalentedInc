//
//  ProfileClient.swift
//  TalentedInc
//
//  Created by Admin on 6/16/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Alamofire

class ProfileClient: NSObject {
    
    func getUser(userId: Int, completion: @escaping (User)->()) {
        
        Alamofire.request("https://e8aa5794-d1f6-452a-beee-868d9fc794f6.mock.pstmn.io/\(userId)/user").responseJSON { response in
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print("Data: \(utf8Text)")
                do{
                    let decoder = JSONDecoder()
                    let user = try decoder.decode(User.self, from: data)
                    print(user.firstName ?? "")
                    completion(user)
                }catch let err{
                    print("Err",err)
                }
            }
        }
    }
}
