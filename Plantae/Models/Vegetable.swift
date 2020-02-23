//
//  Vegetable.swift
//  Plantae
//
//  Created by Jean Paul Marinho on 23/02/20.
//  Copyright © 2020 aKANJ. All rights reserved.
//

import Foundation
import MapKit

struct Vegetable: Identifiable {
    let id = UUID()
    let name: String
    let nickname: String
    let soilLevel: Int? = nil
    let coordinate: CLLocationCoordinate2D
}


final class VegetableAnnotation: NSObject, MKAnnotation {
    let id: UUID
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(vegetable: Vegetable) {
        self.id = vegetable.id
        self.title = vegetable.name
        self.coordinate = vegetable.coordinate
    }
}
