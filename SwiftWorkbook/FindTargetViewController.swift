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

    @IBOutlet private weak var predictedNumberLabel: UILabel!
    @IBOutlet private weak var arView: ARView!    
    private let mlManager: MLManager = .init()
    
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

extension FindTargetViewController: MLManagerDelegate {
    func mlManager(_ manager: MLManager, didDetectResults results: [VNClassificationObservation]) {
        // TODO: Check precision and recall.
        guard let desiredResult = results.first else {
            return
        }
        print("Recognized identifier: \(desiredResult.identifier)")
        DispatchQueue.main.async { [weak self] in
            self?.predictedNumberLabel.text = String(desiredResult.identifier)
        }
    }
}
