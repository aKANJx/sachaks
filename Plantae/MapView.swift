//
//  MapView.swift
//  Plantae
//
//  Created by Jean Paul Marinho on 23/02/20.
//  Copyright © 2020 aKANJ. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    @Binding var vegetables: [Vegetable]
    
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.delegate = context.coordinator
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        view.showsUserLocation = true
        updateAnnotations(from: view)
        let coordinate = CLLocationCoordinate2D(latitude: 38.66078, longitude: -121.3890)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
    
    func updateAnnotations(from mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        let annotations = vegetables.map { VegetableAnnotation(vegetable: $0) }
        mapView.addAnnotations(annotations)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate, CLLocationManagerDelegate {
        var control: MapView
        
        
        init(_ control: MapView) {
            self.control = control
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            <#code#>
        }
    }
}
