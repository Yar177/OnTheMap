//
//  ViewController.swift
//  OnTheMap
//
//  Created by Hoshiar Sher on 8/7/19.
//  Copyright © 2019 Hoshiar Sher. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mapView.delegate = self
        HTTPClient.getStudentsLocation(completionHandeler: {(data, error) in
            guard let data = data else {return}
            StudentsLocationDataModel.studentsData = data
            self.deployDataToMap()
        })
    }
    
    func deployDataToMap(){
        let locations = StudentsLocationDataModel.studentsData
        for student in locations {
            let lat = CLLocationDegrees(student.latitude)
            let lang = CLLocationDegrees(student.longitude)
            let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lang)
            let first = student.firstName
            let last = student.lastName
            let mediaURL = student.mediaURL
            let pinAnnotation = PinAnnotation()
            pinAnnotation.setCoordinate(newCoordinate: coordinate)
            pinAnnotation.title = "\(first) \(last)"
            pinAnnotation.subtitle = mediaURL
            self.mapView.addAnnotation(pinAnnotation)
        }
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.pinTintColor = .red
            pinView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        else {
            pinView!.annotation = annotation
        }
        
        return pinView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            let app = UIApplication.shared
            print("annotation ---->")
            print(view.annotation)
            print(view.annotation?.subtitle)
            if let toOpen = view.annotation?.subtitle ?? "https://www.udacity.com/" {
                print("to open -------->")
                print(toOpen)
                app.open(URL(string: toOpen)!)
            }
        }
    }
  
}

