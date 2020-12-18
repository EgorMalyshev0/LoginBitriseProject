//
//  Validatior.swift
//  MiniLoginProject
//
//  Created by Egor Malyshev on 15.12.2020.
//

import Foundation

class Validator {
    
    var email: String?
    var password: String?
    
    func emailIsValid() -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: email)
    }
    
    func passwordIsValid() -> Bool {
            let passwordRegEx = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{6,}$"
            let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
            return passwordPred.evaluate(with: password)
    }
}
