//
//  Ingredient_Category_Unit.swift
//  sinsungo
//
//  Created by 원동진 on 2023/11/01.
//
//카테고리랑 단위 subView
import Foundation
import UIKit
import SnapKit

class IngredientInfoSubViewType2 : UIView {
    private lazy var upperView : UIStackView = {
        let upperView = UIStackView()
        upperView.axis = .vertical
        upperView.alignment = .leading
        upperView.spacing = 6
        upperView.distribution = .fill
        upperView.backgroundColor = .white
        return upperView
    }()
    lazy var infoTitleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: CustomFont.Bold.rawValue, size: 12)
        label.textColor = .black
        return label
    }()
    lazy var infoContentUILabel : UILabel = {
        let infoContentUILabel = UILabel()
        infoContentUILabel.font = UIFont(name: CustomFont.Regular.rawValue, size: 14)
        infoContentUILabel.textColor = UIColor(named: "brownishgrey")
        return infoContentUILabel
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        setAutoLayout()
        self.backgroundColor = .white
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 8
        self.layer.borderColor = UIColor(named: "verylightpink")?.cgColor
        self.layer.masksToBounds = true
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
extension IngredientInfoSubViewType2 {
    private func addView(){
        addSubview(upperView)
        upperView.addArrangedSubview(infoTitleLabel)
        upperView.addArrangedSubview(infoContentUILabel)
        
    }
    private func setAutoLayout(){
        upperView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.bottom.equalToSuperview().offset(-12)
            
        }
    }
    func setText(_ title: String,_ content : String){
        infoTitleLabel.text = title
        infoContentUILabel.text = content
    }
    func selectedStandard(_ standard : String){
        infoContentUILabel.text = standard
        infoContentUILabel.textColor = .black
        
    }
}

#if DEBUG
import SwiftUI

struct IngredientInfoSubViewType2Preview: PreviewProvider {
    static var previews: some View {
        return IngredientInfoSubViewType2().showPreview()
    }
}
#endif
