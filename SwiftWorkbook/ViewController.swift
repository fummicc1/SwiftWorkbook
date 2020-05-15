//
//  ViewController.swift
//  SwiftWorkbook
//
//  Created by Fumiya Tanaka on 2020/05/15.
//  Copyright © 2020 Fumiya Tanaka. All rights reserved.
//

import UIKit
import RealityKit
import ARKit

class ViewController: BaseViewController<Void> {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let warp = try? Experience.loadWarp() else {
            fatalError()
        }
        arView.debugOptions = [.showFeaturePoints, .showStatistics]
        arView.session.delegate = self
        arView.scene.addAnchor(warp)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapView(_:)))
        arView.isUserInteractionEnabled = true
        arView.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func didTapView(_ sender: UITapGestureRecognizer) {
        let touchView = sender.location(in: arView)
        if let entity = arView.entity(at: touchView), entity.name == "Start" {
        }
    }
}

extension ViewController: ARSessionDelegate {
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        
    }
}
