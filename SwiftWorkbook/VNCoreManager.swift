//
//  VNCoreManager.swift
//  SwiftWorkbook
//
//  Created by Fumiya Tanaka on 2020/05/18.
//  Copyright © 2020 Fumiya Tanaka. All rights reserved.
//

import Foundation
import Vision

protocol VNCoreManagerDelegate: AnyObject {
    func didDetect(results: [VNClassificationObservation], manager: VNCoreManager)
}

class VNCoreManager {
    private(set) var request: VNCoreMLRequest?
    
    weak var delegate: VNCoreManagerDelegate?
    
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
                self.delegate?.didDetect(results: results, manager: self)
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
