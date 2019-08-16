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
      //  self.performSegue(withIdentifier: "logging", sender: nil)
        if checkForEmptyFields() {
            alertMessage(alertTitle: "Error", alertMessage: "Please provide credentials")
            return
        }
        activateUI(subbmitActive: true)
        HTTPClient.startSession(username: userEmail.text!, password: userPassword.text!, completion: loginCompletionHandler(success:error:))
        self.performSegue(withIdentifier: "logging", sender: nil)
    }
    
    func checkForEmptyFields() -> Bool {
        return userEmail.text!.isEmpty || userPassword.text!.isEmpty || userEmail.text == nil || userPassword.text == nil
    }
    
    func loginCompletionHandler(success: Bool, error: Error?){
        if success {
            HTTPClient.getUserInfo(completion: populateUserData(response:error:))
        }else{
            alertMessage(alertTitle: "Error", alertMessage: "Incorreoct Credentials! \nPlease try again")
            activateUI(subbmitActive: false)
        }
    }
    
    func populateUserData(response: UserInformationModel?, error: Error?){
        guard let response = response else {return}
        print(response)
        AddNewLocationModel.user = NewLocationModel(uniqueKey: response.key, firstName: response.firstName, lastName: response.lastName, mapString: "", mediaURL: "", latitude: 0.0, longitude: 0.0)
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
        
//        loginButton.isEnabled = subbmitActive
//        loginButton.alpha = subbmitActive ? 1 : 0.5
        
    }
    
    func alertMessage(alertTitle: String, alertMessage: String) {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default) { (action) -> Void in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}
