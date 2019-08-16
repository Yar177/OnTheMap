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

class AddPinAndLinkViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var userUrlText: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var submitButton: UIButton!
    
    var userLocation = "New York, New York"
    let newPin = MKPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        submitButton.isEnabled = false
//        submitButton.alpha = 0.5
        let addPin = UILongPressGestureRecognizer(target: self, action: #selector(longClick(sender:)))
        mapView.addGestureRecognizer(addPin)
        userUrlText.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        addressToCoordinates(userLocation) {location in
          self.mapView.setRegion(MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 3.5, longitudeDelta: 3.5)), animated: true)}
    }
    
    @objc func longClick(sender: UIGestureRecognizer){
        if sender.state == .began {
            let pickedLocation = mapView.convert(sender.location(in: mapView), toCoordinateFrom: mapView)
            addNewPin(location: pickedLocation)
            
        }
    }
    
    func addressToCoordinates(_ location: String, completion: @escaping (CLLocationCoordinate2D) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(location) { marks, error in
            guard let marks = marks else {
                completion(kCLLocationCoordinate2DInvalid)
                return
            }
            let mark = marks[0]
            if let location = mark.location {
                completion(location.coordinate)
                return} }
        }
    
    func coordinatesToAddress(location: CLLocationCoordinate2D, completion: @escaping (CLPlacemark?, Error?) -> Void){
        let loc = CLLocation.init(latitude: location.latitude, longitude: location.longitude)
        CLGeocoder().reverseGeocodeLocation(loc, completionHandler: {(marks: [CLPlacemark]?, error: Error?) in
            guard let marks = marks else {
                completion(nil, error)
                return
            }
            let mark = marks[0]
            print(marks)
            completion(mark, nil)
        })
    }
    
    func addNewPin(location: CLLocationCoordinate2D){
        mapView.removeAnnotation(newPin)
        coordinatesToAddress(location: location) { address, error in
            guard let address = address else {
                return
            }
            if let pickedAdress = address.administrativeArea {
                AddNewLocationModel.user.mapString = pickedAdress
            }
            let a = String(describing: address).components(separatedBy: ",")
            print(a)
            self.newPin.title = a[2]
        }
        newPin.coordinate = location
        mapView.addAnnotation(newPin)
            self.mapView.setRegion(MKCoordinateRegion(center: newPin.coordinate, span: MKCoordinateSpan(latitudeDelta: 3.0, longitudeDelta: 3.0)), animated: true)
    }
    
    
    
    
   
    
    
    
    @IBAction func canceAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func submit(_ sender: Any) {
       //  dismiss(animated: true, completion: nil)
       print("Submit")
        AddNewLocationModel.user.latitude = newPin.coordinate.latitude
        AddNewLocationModel.user.longitude = newPin.coordinate.longitude
        
        addNewLocationCall{success in
            print("success")
        }
        
    
    }
    
    func findLocation(location: String){
        
    }
    
    func addNewLocationCall(completion: @escaping (Bool) -> Void) {      HTTPClient.addNewLocation(locationData: AddNewLocationModel.user){ data, error in
            guard let data = data else {
                return
            }
            AddNewLocationModel.postResponse = data
        print(data)
        }
    }
        
//        if !Flag.dataSubmitted {
//            APIRequests.postStudentLocation(userGatheredData: StorageController.user) { (data, error) in
//                guard let data = data else {
//                    print(error?.localizedDescription ?? "")
//                    completion(false)
//                    return
//                }
//                print("post response")
//                Flag.dataSubmitted = true
//                StorageController.postResponse = data
//
//                completion(true)
//
//            }
        
//        } else {
//            guard let data = StorageController.postResponse else {
//                completion(false)
//                return
//            }
//            APIRequests.updateStudentLocation(objectID: data.objectId, userGatheredData: StorageController.user) { (success: Bool, error: Error?) in
//                if success {
//                    print("user data updated")
//                    completion(true)
//                }
//                print(error?.localizedDescription ?? "")
//            }
//        }
        
    
    
    
    func CoordinateToLocation(){
        
    }
    
    
    
}
