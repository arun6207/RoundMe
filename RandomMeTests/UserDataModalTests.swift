//
//  UserDataModalTests.swift
//  RandomMeTests
//
//  Created by Amuri Arun Kumar on 1/7/19.
//  Copyright © 2019 Amuri Arun Kumar. All rights reserved.
//

import XCTest
@testable import RandomMe

class UserDataModalTests: XCTestCase {
    var user: User!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let name: Name = Name(title: "Mr", first: "Kevin", last: "petersen")
        let pictures: Picture = Picture(large: "https://randomuser.me/api/portraits/men/24.jpg", medium: "https://randomuser.me/api/portraits/med/men/24.jpg", thumbnail: "https://randomuser.me/api/portraits/thumb/men/24.jpg")
        user = User(results: [Result(gender: "female", name: name, picture: pictures, email: "ducasdasd@asd.com")])
       
        
    }
    func testUserDetailsValueAssertion() {
        guard let userDetails = user.results.first else {
            XCTFail("OpenStatus is nil in PlaceCellDataModel")
            return
        }
        // Attributes should not be nil.
        XCTAssertNotNil(userDetails.userPic, "Pictures are emtpty in the userdetails")
        XCTAssertNotNil(userDetails.fullname, "User Fullname is not avilable")
        XCTAssertNotNil(userDetails.email, "User email is not avilable")
        XCTAssertNotNil(userDetails.userPic, "User pic is not avilable")
        
        // Attributes have the desired values or not
        XCTAssertEqual(userDetails.fullname, "Mr KevinPetersen")
        XCTAssertEqual(userDetails.userPic, "https://randomuser.me/api/portraits/med/men/24.jpg")
        XCTAssertEqual(userDetails.email, "ducasdasd@asd.com")
        XCTAssertEqual(userDetails.gender, "female")
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}



