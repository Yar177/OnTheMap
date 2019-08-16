//
//  PinAnnotation.swift
//  OnTheMap
//
//  Created by Hoshiar Sher on 8/9/19.
//  Copyright © 2019 Hoshiar Sher. All rights reserved.
//

import Foundation
import MapKit
import UIKit

class PinAnnotation: NSObject, MKAnnotation {
    private var coord: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    private var _title: String = String("")
    private var _subtitle: String = String("")
    var title: String? {
        get {
            return _title
        }
        set (value) {
            self._title = value!
        }
    }
    var subtitle: String? {
        get {
            return _subtitle
        }
        set (value) {
            self._subtitle = value!
        }
    }
    var coordinate: CLLocationCoordinate2D {
        get {
            return coord
        }
    }
    func setCoordinate(newCoordinate: CLLocationCoordinate2D) {
        self.coord = newCoordinate
    }
}
