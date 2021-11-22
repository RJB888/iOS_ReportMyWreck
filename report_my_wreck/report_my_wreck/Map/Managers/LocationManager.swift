//
//  LocationManager.swift
//  report_my_wreck
//
//  Created by Student Account on 11/20/21.
//

import Foundation
import CoreLocation
import MapKit

class LocationManager: NSObject {
    
    @Published var mapView = MKMapView()
    
    
    private let locationManager = CLLocationManager()
    var location: CLLocation? = nil
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
}

extension LocationManager : CLLocationManagerDelegate {
    
    
}
