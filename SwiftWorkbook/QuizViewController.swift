//
//  QuizViewController.swift
//  SwiftWorkbook
//
//  Created by Fumiya Tanaka on 2020/05/15.
//  Copyright © 2020 Fumiya Tanaka. All rights reserved.
//

import UIKit

class QuizViewController: BaseViewController<QuizViewController.Input> {

    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var firstLabel: UILabel!
    @IBOutlet private weak var secondLabel: UILabel!
    @IBOutlet private weak var thirdLabel: UILabel!
    @IBOutlet private weak var questionContentLabel: UILabel!
    @IBOutlet private weak var questionTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension QuizViewController {
    struct Input {
        
    }
}
