//
//  AddPinAndLinkViewController.swift
//  OnTheMap
//
//  Created by Hoshiar Sher on 8/12/19.
//  Copyright © 2019 Hoshiar Sher. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class AddPinAndLinkViewController: UIViewController{
    @IBOutlet weak var userUrlText: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func canceAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func submit(_ sender: Any) {
         dismiss(animated: true, completion: nil)
        
    }
    
}
