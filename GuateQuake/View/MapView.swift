//
//  MapView.swift
//  GuateQuake
//
//  Created by Dakota-Cheyenne Brown on 3/7/20.
//  Copyright © 2020 Dakota-Cheyenne Brown. All rights reserved.
//

import SwiftUI
import Foundation
import UIKit
import MapKit

struct MapView: UIViewRepresentable {
    var data: Features
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let annotation = MKPointAnnotation()
        let coordinate = CLLocationCoordinate2D(latitude: data.geometry.coordinates[1], longitude: data.geometry.coordinates[0])
        let span = MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        uiView.setRegion(region, animated: true)
        
        annotation.coordinate = coordinate
        annotation.title = data.properties.place
        annotation.subtitle = "Magnitude: \(data.properties.mag)"
        
        uiView.addAnnotation(annotation)
    }
}
