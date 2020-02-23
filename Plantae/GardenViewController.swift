//
//  GardenViewController.swift
//  Plantae
//
//  Created by Jean Paul Marinho on 23/02/20.
//  Copyright © 2020 aKANJ. All rights reserved.
//

import UIKit
import SwiftUI
import SceneKit

struct GardenWrapperView: UIViewRepresentable {
    
    @Binding var vegetables: [Vegetable]
    
    
    func makeUIView(context: Context) -> SCNView {
        SCNView()
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ view: SCNView, context: Context) {
        let scene = SCNScene(named: "art.scnassets/Plaza.scn")!
        view.scene = scene
        view.allowsCameraControl = true
        view.cameraControlConfiguration.rotationSensitivity = 0
        view.cameraControlConfiguration.autoSwitchToFreeCamera = false
        var veggies = [SCNNode]()
        for _ in 0...vegetables.count {
            veggies.append(loadVeggie())
        }
        view.prepare(veggies) { success in
            for veggie in veggies {
                view.scene?.rootNode.addChildNode(veggie)
            }
        }
    }
    
    func loadVeggie() -> SCNNode {
        let choice = Int.random(in: 0...1)
        let filePath = Bundle.main.path(forResource: choice == 0 ? "Radish" : "ChildRadish", ofType: "scn", inDirectory: "art.scnassets")
        let refNode = SCNReferenceNode(url: URL(fileURLWithPath: filePath!))!
        refNode.position = SCNVector3(Int.random(in: -5...5), 0, Int.random(in: -5...5))
        refNode.scale = choice == 0 ? SCNVector3(0.1, 0.1, 0.1) : SCNVector3(0.3, 0.3, 0.3)
        refNode.load()
        return refNode
    }
    
    class Coordinator: NSObject {
           var control: GardenWrapperView
        
        init(_ control: GardenWrapperView) {
            self.control = control
        }
    }
}
