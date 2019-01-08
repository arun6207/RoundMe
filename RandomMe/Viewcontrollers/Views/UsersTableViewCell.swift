//
//  UsersTableViewCell.swift
//  RandomMe
//
//  Created by Amuri Arun Kumar on 1/7/19.
//  Copyright © 2019 Amuri Arun Kumar. All rights reserved.
//

import UIKit

class UsersTableViewCell: UITableViewCell {

    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
//    func getUserDeatils(){
//        NetworkManager.shared.getUserDeatils { (user,error) in
//            if let userDetails = user {
//                DispatchQueue.main.async {
//                   self.setUserDetails(userDeatails: userDetails)
//                }
//            }
//            else{
//                print(error ?? "")
//            }
//
//        }
//    }
    func setUserDetails(userDeatails: User) {
        self.userNameLabel.text = userDeatails.results.first?.fullname
        self.userEmailLabel.text = userDeatails.results.first?.email
        if let picture = userDeatails.results.first?.userPic{
            self.userImageView.downloadImageFrom(link: picture, contentMode: .scaleAspectFit)
        }
    }
}
