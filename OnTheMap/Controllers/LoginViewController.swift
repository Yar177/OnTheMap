//
//  LoginViewController.swift
//  OnTheMap
//
//  Created by Hoshiar Sher on 8/7/19.
//  Copyright © 2019 Hoshiar Sher. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
  
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var userEmail: LoginTextField!
    @IBOutlet weak var userPassword: LoginTextField!
    @IBOutlet weak var loginButton: LoginButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userEmail.delegate = self
        userPassword.delegate = self
        activateUI(subbmitActive: false)
     
    }
    

    
    @IBAction func login(_ sender: Any) {
        self.performSegue(withIdentifier: "logging", sender: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
      
    }
    
    func activateUI(subbmitActive: Bool){
        userEmail.isEnabled = !subbmitActive
        userPassword.isEnabled = !subbmitActive
        spinner.isHidden = !subbmitActive
        
        loginButton.isEnabled = subbmitActive
        loginButton.alpha = subbmitActive ? 1 : 0.5
        
    }
    
    func alert(_ alertTitle: String, _ alertMessage: String) {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default) { (action) -> Void in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}
