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

class StartViewController: BaseViewController<Void> {
    
    @IBOutlet private weak var arView: ARView!
    private weak var startEntity: Entity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let warp = try? Experience.loadWarp() else {
            fatalError()
        }
        arView.debugOptions = [.showFeaturePoints, .showStatistics]
        arView.scene.addAnchor(warp)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapView(_:)))
        arView.isUserInteractionEnabled = true
        arView.addGestureRecognizer(tapGesture)
        
        if let start = warp.findEntity(named: "Start") {
            self.startEntity = start
        }
    }
    
    @objc
    private func didTapView(_ sender: UITapGestureRecognizer) {
        let touchView = sender.location(in: arView)
        let results = arView.hitTest(touchView)
        if results.contains(where: { $0.entity == startEntity }) {
            let destination = QuizViewController.build(QuizViewController.Input())
            destination.modalPresentationStyle = .fullScreen
            present(destination, animated: true, completion: nil)
        }
    }
}
