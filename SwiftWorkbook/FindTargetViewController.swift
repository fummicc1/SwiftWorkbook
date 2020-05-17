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
    private var request: VNCoreMLRequest?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arView.session.delegate = self
        if let model = try? VNCoreMLModel(for: MNIST().model) {
            request = VNCoreMLRequest(model: model, completionHandler: { request, error in
                if let error = error {
                    assert(false, error.localizedDescription)
                    return
                }
                if let bestCategory = request.results?.first as? VNClassificationObservation {
                    print(bestCategory.confidence)
                    print(bestCategory.identifier)
                }
            })
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
        if let request = request {
            let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:])
            try? handler.perform([request])
        }
    }
}
