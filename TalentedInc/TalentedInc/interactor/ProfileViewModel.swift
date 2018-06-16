//
//  ProfileViewModel.swift
//  TalentedInc
//
//  Created by Admin on 6/16/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ProfileViewModel: UICollectionViewCell {
    
    @IBOutlet var profileClient: ProfileClient!
    var myUser: User?
    
    func getUser(completion: @escaping ()->()) {
        profileClient.getUser(userId: 2, completion: { user in
            self.myUser = user
            completion()
        })
    }
    
    func getCategory(indexPath: IndexPath) -> CategoryCollection {
        return (myUser?.categoryCollection![indexPath.item])!
    }
}
