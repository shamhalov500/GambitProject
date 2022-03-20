//
//  CellFunc.swift
//  Gambit
//
//  Created by Али Шамхалов on 20.03.2022.
//

import UIKit
@IBDesignable
class Button: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
}

