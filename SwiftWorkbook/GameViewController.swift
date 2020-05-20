//
//  GameViewController.swift
//  SwiftWorkbook
//
//  Created by Fumiya Tanaka on 2020/05/15.
//  Copyright © 2020 Fumiya Tanaka. All rights reserved.
//

import UIKit
import QuartzCore
import ARKit
import SceneKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let view = view as? ARSCNView else {
            fatalError()
        }
        
        view.autoenablesDefaultLighting = true
        view.allowsCameraControl = true
        view.showsStatistics = true
        view.delegate = self
        view.debugOptions = [.showFeaturePoints]
        
        let scene = SCNScene()
        view.scene = scene
        
        let cameraNode = SCNNode()
        let camera = SCNCamera()
        cameraNode.camera = camera
        cameraNode.position = .init(0, 0, 10)
        scene.rootNode.addChildNode(cameraNode)
        
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
        scene.rootNode.addChildNode(lightNode)
        
        let ambientLight = SCNLight()
        ambientLight.type = .ambient
        ambientLight.color = UIColor.systemGray
        let ambientLightNode = SCNNode()
        ambientLightNode.light = ambientLight
        scene.rootNode.addChildNode(ambientLightNode)
        
        let ball = SCNSphere(radius: 1.5)
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.systemOrange
        ball.materials = [material]
        ball.isGeodesic = true
        let ballNode = SCNNode(geometry: ball)
        scene.rootNode.addChildNode(ballNode)
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal, .vertical]
        view.session.run(configuration)
    }
    
    
}

extension ViewController: ARSCNViewDelegate {
    
}
