//
//  ExtensionUITextField.swift
//  sinsungo
//
//  Created by 원동진 on 2023/03/22.
//

import Foundation
import UIKit
extension UITextField {
    func setPlaceholder(color: UIColor) {
        guard let string = self.placeholder else {
            return
        }
        attributedPlaceholder = NSAttributedString(string: string, attributes: [.foregroundColor: color])
    }
}
