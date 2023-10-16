//
//  CustomSlider.swift
//  sinsungo
//
//  Created by 원동진 on 2023/03/28.
//

import Foundation
import UIKit
class CustomSlider : UISlider {
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(origin: bounds.origin, size: CGSize(width: bounds.width, height: 10))
    }
}
