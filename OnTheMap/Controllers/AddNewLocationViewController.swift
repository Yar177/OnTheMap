//
//  AddNewLocationViewController.swift
//  OnTheMap
//
//  Created by Hoshiar Sher on 8/12/19.
//  Copyright © 2019 Hoshiar Sher. All rights reserved.
//

import Foundation
import UIKit

class AddNewLocationViewController: UIViewController{
    
    @IBOutlet weak var userLocation: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func findOnTheMap(_ sender: Any) {
        
        
        weak var pvc = self.presentingViewController
        self.dismiss(animated: false) {
             let viewControllerAddPin = self.storyboard?.instantiateViewController(withIdentifier: "AddPinAndLinkViewController") as! AddPinAndLinkViewController
            
            if !self.userLocation.text!.isEmpty || self.userLocation.text != nil{
                viewControllerAddPin.userLocation = self.userLocation.text!
            }
            
            pvc?.present(viewControllerAddPin, animated: true, completion: nil)
        }
    }
    
}
