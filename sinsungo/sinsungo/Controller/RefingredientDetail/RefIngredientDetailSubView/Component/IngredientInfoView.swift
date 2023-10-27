//
//  IngredientInfoView.swift
//  sinsungo
//
//  Created by 원동진 on 2023/05/06.
//

import Foundation
import SnapKit
import UIKit

class IngredientInfoView : UIView {
    
    private lazy var ingredientInfoLabel : UILabel = {
        let label = UILabel()
        label.text = "재료 정보"
        label.font = UIFont(name: CustomFont.Bold.rawValue, size: 14)
        label.textColor = UIColor.black
        label.textAlignment = .left
        return label
    }()
    //MARK: -  재료 정보 StackView
    private lazy var ingredientInfoStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()
    lazy var nameInfoView : IngredientInfoSubView = {
        let infoView = IngredientInfoSubView()
        infoView.setText("이름", "{재료 이름}")
        return infoView
    }()
    lazy var sortInfoView : IngredientInfoSubView = {
        let infoView = IngredientInfoSubView()
        infoView.setText("분류", "{재료 분류}")
        return infoView
    }()
    // 단위 수량 StackView
    private lazy var cntUnitStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.alignment = .fill
        return stackView
    }()
    // 수량
    lazy var cntInfoView : IngredientInfoSubView = {
        let infoView = IngredientInfoSubView()
        infoView.setText("수량", "{수량}")
        return infoView
    }()
    // 단위
    lazy var unitInfoView : IngredientInfoSubView = {
        let infoView = IngredientInfoSubView()
        infoView.setText("단위", "{단위}")
        return infoView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        setAutoLayout()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addView()
        setAutoLayout()
    }
}
extension IngredientInfoView {
    private func addView(){
        addSubViews([ingredientInfoLabel,ingredientInfoStackView])
        ingredientInfoStackView.addStackSubViews([nameInfoView,sortInfoView,cntUnitStackView])
        cntUnitStackView.addStackSubViews([cntInfoView,unitInfoView])
    }
    private func setAutoLayout(){
        ingredientInfoLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        ingredientInfoStackView.snp.makeConstraints { make in
            make.top.equalTo(ingredientInfoLabel.snp.bottom).offset(10)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    func setTextFieldDisable(disable : Bool){
        if disable {
            [nameInfoView,sortInfoView,cntInfoView,unitInfoView].forEach { infoView in
                infoView.isUserInteractionEnabled = false
            }
        }else{
            [nameInfoView,sortInfoView,cntInfoView,unitInfoView].forEach { infoView in
                infoView.isUserInteractionEnabled = true
            }
        }
    }
}

#if DEBUG
import SwiftUI

struct IngredientInfoViewPreview: PreviewProvider {
    static var previews: some View {
        return IngredientInfoView ().showPreview()
    }
}
#endif

