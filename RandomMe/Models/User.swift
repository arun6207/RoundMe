//
//  User.swift
//  RandomMe
//
//  Created by Amuri Arun Kumar on 1/7/19.
//  Copyright © 2019 Amuri Arun Kumar. All rights reserved.
//

import Foundation

//MARK: - User Model
struct User: Codable {
    let results: [Result]
}
//MARK: - Result Model
struct Result: Codable { //in swift 4.2 just ignore attributes is enough to seralize desired attribues
    let gender: String
    let name: Name
    let picture: Picture
    let email: String
}

extension Result {
    var fullname: String {
        return name.title.capitalized + " " + name.first.capitalized + name.last.capitalized
    }
    var userPic: String {
        return picture.medium
    }
}
//MARK: - Name Model
struct Name: Codable {
    let title, first, last: String
}
//MARK: - Picture Model
struct Picture: Codable {
    let large, medium, thumbnail: String
}
