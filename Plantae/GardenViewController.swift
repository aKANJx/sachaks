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
    
    func makeUIView(context: Context) -> UIView {
        GardenViewController().view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) { }
   
}


class GardenViewController: UIViewController {

    var scnView: SCNView! {
        if !(view is SCNView) {
            view = SCNView()
        }
        return view as? SCNView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = SCNScene(named: "art.scnassets/Plaza.scn")!
        scnView.scene = scene
        scnView.allowsCameraControl = true
        scnView.cameraControlConfiguration.rotationSensitivity = 0
        scnView.cameraControlConfiguration.autoSwitchToFreeCamera = false
        scnView.showsStatistics = true
        var veggies = [SCNNode]()
        for _ in 0...3 {
            veggies.append(loadVeggie())
        }
        scnView.prepare(veggies) { success in
            for veggie in veggies {
                 self.scnView.scene?.rootNode.addChildNode(veggie)
            }
        }
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        scnView.addGestureRecognizer(tapGesture)
    }
    
    func loadVeggie() -> SCNNode {
        let filePath = Bundle.main.path(forResource: "Radish", ofType: "scn", inDirectory: "art.scnassets")
        let refNode = SCNReferenceNode(url: URL(fileURLWithPath: filePath!))!
        refNode.position = SCNVector3(Int.random(in: -5...5), 0, Int.random(in: -5...5))
        refNode.scale = SCNVector3(0.1, 0.1, 0.1)
        refNode.load()
        return refNode
    }
    
    @objc
    func handleTap(_ gestureRecognize: UIGestureRecognizer) {
        let p = gestureRecognize.location(in: scnView)
        let hitResults = scnView.hitTest(p, options: [:])
        if hitResults.count > 0 {
        }
    }
}
