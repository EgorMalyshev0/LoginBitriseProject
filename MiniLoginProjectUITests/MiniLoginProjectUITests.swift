//
//  MiniLoginProjectUITests.swift
//  MiniLoginProjectUITests
//
//  Created by Egor Malyshev on 15.12.2020.
//

import XCTest

class MiniLoginProjectUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    var emailTextfield: XCUIElement!
    var passwordTextfield: XCUIElement!
    var logInButton: XCUIElement!
    var emailErrorLabel: XCUIElement!
    var passwordErrorLabel: XCUIElement!
    var congratulationLabel: XCUIElement!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        
        emailTextfield = app.textFields["email"]
        passwordTextfield = app.secureTextFields["password"]
        logInButton = app/*@START_MENU_TOKEN@*/.buttons["Log In"].staticTexts["Log In"]/*[[".buttons[\"Log In\"].staticTexts[\"Log In\"]",".staticTexts[\"Log In\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
        emailErrorLabel = app.staticTexts["Incorrect email"]
        passwordErrorLabel = app.staticTexts["Incorrect password"]
        congratulationLabel = app.staticTexts["🎉"]

        continueAfterFailure = false

    }

    override func tearDownWithError() throws {
       
    }

    func testOne() throws {
        testingTemplate(emailText: "qwerty@ya.ru", passwordText: "123456")
        XCTAssertTrue(passwordErrorLabel.exists)
        XCTAssertFalse(emailErrorLabel.exists)
    }
    
    func testTwo() throws {
        testingTemplate(emailText: "qwerty", passwordText: "123456Ee")
        XCTAssertTrue(emailErrorLabel.exists)
        XCTAssertFalse(passwordErrorLabel.exists)
    }
    
    func testThree() throws {
        testingTemplate(emailText: "qwerty", passwordText: "123456")
        XCTAssertTrue(emailErrorLabel.exists)
        XCTAssertFalse(passwordErrorLabel.exists)
        XCTAssertFalse(congratulationLabel.exists)
    }
    
    func testfour(){
        testingTemplate(emailText: "qwerty@ya.ru", passwordText: "123456Ee")
        XCTAssertTrue(congratulationLabel.exists)
    }
    
    func testingTemplate(emailText: String, passwordText: String) {
        emailTextfield.tap()
        emailTextfield.typeText(emailText)
        passwordTextfield.tap()
        passwordTextfield.typeText(passwordText)
        logInButton.tap()
    }
}
