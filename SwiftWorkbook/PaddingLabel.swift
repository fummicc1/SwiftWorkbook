//
//  PaddingLabel.swift
//  SwiftWorkbook
//
//  Created by Fumiya Tanaka on 2020/05/20.
//  Copyright © 2020 Fumiya Tanaka. All rights reserved.
//

import Foundation
import UIKit

class PaddingLabel: UILabel {
    override var intrinsicContentSize: CGSize {
        let baseSize = super.intrinsicContentSize
        return .init(width: baseSize.width + 32, height: baseSize.height + 16)
    }
}
