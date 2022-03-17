//
//  cellRadius.swift
//  Gambit
//
//  Created by Али Шамхалов on 16.03.2022.
//

import UIKit

@IBDesignable
class radiusButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
}

