//
//  Quiz.swift
//  SwiftWorkbook
//
//  Created by Fumiya Tanaka on 2020/05/17.
//  Copyright © 2020 Fumiya Tanaka. All rights reserved.
//

import Foundation

struct Quiz: Codable {
    let question: Question
    let selections: [Selection]
    let answer: Selection
}

struct Question: Codable {
    let content: String
    let index: Int
}

struct Selection: Codable {
    let content: String
}
