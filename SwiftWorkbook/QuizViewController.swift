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
    @IBOutlet private weak var questionContentTextView: UITextView!
    @IBOutlet private weak var questionTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension QuizViewController {
    struct Input {
        let quizArray: Array<Quiz>
        
        static func `default`() -> Input {
            .init(quizArray: [
                Quiz(
                    question: Question(
                        content: "Swiftにおけるデータ型のうち、\"\"で括ることが特徴の文字を表すための型は次のうちどれでしょう。",
                        index: 0
                    ),
                    selections: [
                        Selection(content: "String型"),
                        Selection(content: "Int型"),
                        Selection(content: "Bool型")
                    ],
                    answer: Selection(
                        content: "String型"
                    )
                ),
            ])
        }
    }
}
