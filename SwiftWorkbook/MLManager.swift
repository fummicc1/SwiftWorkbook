//
//  VNCoreManager.swift
//  SwiftWorkbook
//
//  Created by Fumiya Tanaka on 2020/05/18.
//  Copyright © 2020 Fumiya Tanaka. All rights reserved.
//

import Foundation
import Vision

protocol MLManagerDelegate: AnyObject {
    func mlManager(_ manager: MLManager, didDetectResults results: [VNClassificationObservation])
}

class MLManager {
    private(set) var request: VNCoreMLRequest?
    
    weak var delegate: MLManagerDelegate?
    
    public func setupRequest(model: VNCoreMLModel) {
        request = VNCoreMLRequest(model: model, completionHandler: { [weak self] request, error in
            if let error = error {
                assert(false, error.localizedDescription)
                return
            }
            guard let self = self else {
                assert(false)
                return
            }
            if let results = request.results as? [VNClassificationObservation] {
                self.delegate?.mlManager(self, didDetectResults: results)
            }
        })
    }
    
    public func performRequest(with pixelBuffer: CVPixelBuffer) {
        if let request = request {
            let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:])
            try? handler.perform([request])
        }
    }
}
