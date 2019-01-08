//
//  File.swift
//  RandomMe
//
//  Created by Amuri Arun Kumar on 1/7/19.
//  Copyright © 2019 Amuri Arun Kumar. All rights reserved.
//

import Foundation
class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    //MARK: - Get userDeatils
    func getUserDeatils(completion: @escaping(_ users: User?, _ errorMessage: String?) -> Void) {
        guard let url = URL(string: "https://randomuser.me/api/?format=json") else {
             completion(nil, "There is a problem in fetching user details")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil{
                do{
                    if let userData = data {
                        //decode Data with desired attributes
                        let user = try JSONDecoder().decode(User.self, from: userData)
                         completion(user, nil)
                    }
                }
                catch{
                    completion(nil, "There is a problem in fetching user details")
                }
            }
        }
        task.resume()
    }
}
