//
//  Base.swift
//  SwiftWorkbook
//
//  Created by Fumiya Tanaka on 2020/05/15.
//  Copyright © 2020 Fumiya Tanaka. All rights reserved.
//

import Foundation
import UIKit

extension NSObject {
    static var className: String {
        String(describing: self)
    }
}

class BaseViewController<Input>: UIViewController {
    
    let input: Input!
    
    required init?(coder: NSCoder, input: Input) {
        self.input = input
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        input = nil
        super.init(coder: coder)
    }
    
    static func build(_ input: Input) -> Self {
        guard let viewController = UIStoryboard(name: Self.className, bundle: nil).instantiateInitialViewController(creator: { coder in
            Self.init(coder: coder, input: input)
        }) else {
            fatalError()
        }
        return viewController
    }
}
