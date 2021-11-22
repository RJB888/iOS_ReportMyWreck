//
//  Coordinator.swift
//  report_my_wreck
//
//  Created by Student Account on 11/20/21.
//

import Foundation
import MapKit

final class Coordinator: NSObject, MKMapViewDelegate {
 
    var control: MapView
    
    init(_ control: MapView) {
        self.control = control
    }
    
    
}
