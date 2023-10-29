//
//  RefIngredientBottomBtn.swift
//  sinsungo
//
//  Created by 원동진 on 2023/05/04.
//

import Foundation
import UIKit
class RefIngredientBottomBtn : UIButton {
    var config = UIButton.Configuration.plain()
    override init(frame: CGRect) {
        super.init(frame: frame)
        config.contentInsets = NSDirectionalEdgeInsets.init(top: 14, leading: 10, bottom: 14, trailing: 10)// <- 안에 내용에 대한 inset
        config.baseForegroundColor = UIColor(named: "brownishgrey")
        self.backgroundColor = UIColor(named: "whitetwo")
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    func setBtnTitle(_ title : String){
        config.attributedTitle = AttributedString("\(title)", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.ExtraBold.rawValue, size: 14)!]))
        self.configuration = config
    }
}
