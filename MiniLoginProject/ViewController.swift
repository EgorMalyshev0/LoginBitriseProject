//
//  ViewController.swift
//  MiniLoginProject
//
//  Created by Egor Malyshev on 15.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var errorTextLabel: UILabel!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    let validator = Validator()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func emailEditingChanged(_ sender: Any) {
        changeLoginButtonAvailability()
        
    }
    @IBAction func passwordEditingChanged(_ sender: Any) {
        changeLoginButtonAvailability()
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        errorTextLabel.text = ""
        validator.email = emailTextfield.text
        validator.password = passwordTextfield.text
        if validator.emailIsValid() && validator.passwordIsValid() {
            self.performSegue(withIdentifier: "congratulations", sender: (Any).self)
        } else {
            showErrorMessage()
        }
    }
    
    func changeLoginButtonAvailability(){
        guard let email = emailTextfield.text,
              let password = passwordTextfield.text
        else { return }
        
        if !email.isEmpty && !password.isEmpty {
            loginButton.isEnabled = true
        } else {
            loginButton.isEnabled = false
            errorTextLabel.text = ""
        }
    }
    
    func showErrorMessage(){
        if !validator.emailIsValid(){
            errorTextLabel.text = "Incorrect email"
        } else if !validator.passwordIsValid(){
            errorTextLabel.text = "Incorrect password"
        }
    }
    
}

