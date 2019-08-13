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
    @IBOutlet weak var submitButton: UIButton!
    
    var location = "Rochester, New York"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.isEnabled = false
    }
    
    
    @IBAction func canceAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func submit(_ sender: Any) {
         dismiss(animated: true, completion: nil)
        
    }
    
    func findLocation(location: String){
        
    }
    
    func locationToCoordinates(location: String){
        
        CLGeocoder().geocodeAddressString(location){ placemarks, error in
            guard let placemarks = placemarks else{
                return
            }
            let placemark = placemarks[0]
            if let location = placemark.location{
                return location.coordinate
            }
        }
    }
    
    func CoordinateToLocation(){
        
    }
    
    
    
}
