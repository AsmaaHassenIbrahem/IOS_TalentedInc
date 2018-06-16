//
//  ProfileViewController.swift
//  TalentedInc
//
//  Created by Admin on 6/13/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import SDWebImage

class ProfileViewController: UITableViewController, UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet var interestsCollectionView: UICollectionView!
    @IBOutlet var profileTableView: UITableView!
    @IBOutlet var profileImg: UIImageView!
    @IBOutlet var followersLbl: UILabel!
    @IBOutlet var followingLbl: UILabel!
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var phoneLbl: UILabel!
    @IBOutlet var cityLbl: UILabel!
    @IBOutlet var mailLbl: UILabel!
    @IBOutlet var birthdayLbl: UILabel!
    @IBOutlet var firstPortofolio: UIImageView!
    @IBOutlet var secondPortofolio: UIImageView!
    @IBOutlet var videoUrl: UILabel!
    
    @IBOutlet var profileViewModel: ProfileViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        profileViewModel.getUser(completion: {
            DispatchQueue.main.async {
                self.setViews()
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (profileViewModel.myUserFromApi?.categoryCollection?.count) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "interestCell", for: indexPath) as! InterestCollectionViewCell
        let category = profileViewModel.getCategory(indexPath: indexPath)
        cell.interestLbl.text = category.name
        cell.interetsImg.layer.cornerRadius = cell.interetsImg.frame.height/2
        cell.interetsImg.clipsToBounds = true
        cell.interetsImg.sd_setImage(with: URL(string: category.imageUrl!), placeholderImage: UIImage(named: "placeholder.png"))
        return cell
    }
    
    func setViews(){
        let user = profileViewModel.myUserFromApi
        profileImg.sd_setImage(with: URL(string: (user?.imgUrl)!), placeholderImage: UIImage(named: "placeholder.png"))
        followersLbl.text = String((user?.followersNumber)!)
        followingLbl.text = String((user?.followingNumber)!)
        nameLbl.text = "\(user?.firstName ?? "") \(user?.lastName ?? "")"
        phoneLbl.text = user?.phone
        cityLbl.text = user?.city
        mailLbl.text = user?.email
        birthdayLbl.text = user?.userDob
        interestsCollectionView.reloadData()
    }
    
}
