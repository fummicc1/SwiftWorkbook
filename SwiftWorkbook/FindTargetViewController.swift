//
//  FindTargetViewController.swift
//  SwiftWorkbook
//
//  Created by Fumiya Tanaka on 2020/05/15.
//  Copyright © 2020 Fumiya Tanaka. All rights reserved.
//

import UIKit

class FindTargetViewController: BaseViewController<FindTargetViewController.Input> {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension FindTargetViewController {
    struct Input {
        let answer: Int
    }
}
