//
//  IngredientViewType2.swift
//  sinsungo
//
//  Created by 원동진 on 2023/02/08.
//
//Start Dev
import Foundation
import UIKit
//MARK: - 재료추가하기버튼
func addIngredientButton()-> UIView{
    let containerView : UIView = {
        let containerView = UIView()
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor(named: "verylightpink")?.cgColor
        containerView.layer.cornerRadius = 4
        return containerView
    }()
    let addIngredientButton : UIButton = {
        let addIngredientButton = UIButton()
        addIngredientButton.backgroundColor = UIColor(named: "primarycolor")
        addIngredientButton.setTitle("재료 추가하기", for: .normal)
        addIngredientButton.titleLabel?.font = UIFont(name: "NanumSquareOTF_acB", size: 12)
        addIngredientButton.titleLabel?.textColor  = UIColor.white
        addIngredientButton.layer.cornerRadius = 4
        return addIngredientButton
    }()
    containerView.addSubview(addIngredientButton)
    addIngredientButton.snp.makeConstraints { make in
        make.edges.equalToSuperview()
    }
    return containerView
}
