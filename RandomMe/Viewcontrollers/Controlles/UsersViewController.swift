//
//  UsersViewController.swift
//  RandomMe
//
//  Created by Amuri Arun Kumar on 1/7/19.
//  Copyright © 2019 Amuri Arun Kumar. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {

    @IBOutlet weak var userstableView: UITableView!
    var users: [User] = [User]()
    struct Constants {
        static let  maxNumberOfUsersToDispaly: Int = 3
        static let usersTableViewCell:String = "UsersTableViewCell"
    }
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUserTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    self.getUsersDeatils(maxUsers: Constants.maxNumberOfUsersToDispaly)
    }
    //MARK: - UsersTableview Configuratiom
    func configureUserTableView() {
        self.userstableView.dataSource = self
        self.userstableView.tableFooterView = UIView()
        self.userstableView.rowHeight  = 100.0
    }
     //MARK: - GetUsers
    func getUsersDeatils(maxUsers: Int) {
        for _ in 1...maxUsers { //we can also use dispatch groups for the same scenario
            NetworkManager.shared.getUserDeatils { (user,error) in
                if let userDetails = user {
                    self.users.append(userDetails)
                    DispatchQueue.main.async {
                        self.userstableView.reloadData()
                    }
                }
                else{
                    print(error ?? "")
                }

            }
        }
    }

}
 //MARK: - UITableView DataSource
extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.usersTableViewCell, for: indexPath) as! UsersTableViewCell
        cell.getUserDeatils()
        return cell
    }
}
