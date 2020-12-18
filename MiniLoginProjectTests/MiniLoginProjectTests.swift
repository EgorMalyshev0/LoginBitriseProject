//
//  MiniLoginProjectTests.swift
//  MiniLoginProjectTests
//
//  Created by Egor Malyshev on 15.12.2020.
//

import XCTest
@testable import MiniLoginProject

class MiniLoginProjectTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidation() throws {
        let v = Validator()
        v.password = "123"
        let testPasswords: [String?] = ["12345orNe",
                                        "Ee1234",
                                        "qwertY4",
                                        "seifn983MM",
                                        "12345Jew"]
        let testEmails: [String?] = ["qwy@ya.ru",
                                     "qwerty@yawqe.ru",
                                    "123er@sdfjn.rus",
                                    "45262@ya.ru",
                                    "EWEQWE@34.ru"]
        for p in testPasswords{
            v.password = p
            XCTAssert(v.passwordIsValid(), "\(String(describing: p)): this password is invalid")
        }
        for e in testEmails{
            v.email = e
            XCTAssert(v.emailIsValid(), "\(String(describing: e)): this email is invalid")
        }
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
