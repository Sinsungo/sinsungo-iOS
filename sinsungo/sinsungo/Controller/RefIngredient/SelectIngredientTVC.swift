//
//  SelectIngredientTVC.swift
//  sinsungo
//
//  Created by 원동진 on 2023/04/18.
//

import Foundation
import UIKit
class SelectIngredientTVC : RefIngredientTVCell{
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected == true {
            containerView.layer.borderWidth = 1
            containerView.layer.borderColor = UIColor(named: "primarycolor")?.cgColor
        }else {
            containerView.layer.borderWidth = 1
            containerView.layer.borderColor = UIColor.clear.cgColor
            
        }

    }
}
