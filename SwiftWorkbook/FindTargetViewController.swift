//
//  FindTargetViewController.swift
//  SwiftWorkbook
//
//  Created by Fumiya Tanaka on 2020/05/15.
//  Copyright © 2020 Fumiya Tanaka. All rights reserved.
//

import UIKit
import RealityKit
import ARKit
import Vision

class FindTargetViewController: BaseViewController<FindTargetViewController.Input> {

    @IBOutlet private weak var arView: ARView!    
    private let mlManager: VNCoreManager = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mlManager.delegate = self
        arView.session.delegate = self
        if let model = try? VNCoreMLModel(for: MNIST().model) {
            mlManager.setupRequest(model: model)
        }
    }
}

extension FindTargetViewController {
    struct Input {
    }
}

extension FindTargetViewController: ARSessionDelegate {
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
        let pixelBuffer = frame.capturedImage
        mlManager.performRequest(with: pixelBuffer)
    }
}

extension FindTargetViewController: VNCoreManagerDelegate {
    func didDetect(results: [VNClassificationObservation], manager: VNCoreManager) {
        
    }
}
