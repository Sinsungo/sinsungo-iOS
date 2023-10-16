//
//  RefingredientDetailHeader.swift
//  sinsungo
//
//  Created by 원동진 on 2023/05/31.
//

import UIKit

class RefingredientDetailHeader: UICollectionReusableView {
    static let identi = "RefingredientDetailHeaderid"
    lazy var upperView : UIView = {
       let upperView = UIView()
        return upperView
    }()
    lazy var ingredientInfoView : IngredientInfoView = {
        let infoView = IngredientInfoView()
        return infoView
    }()
    private lazy var storageInfoView : StorageInfoView = {
        let infoView = StorageInfoView()
        return infoView
    }()
    
    private lazy var storageLocationLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: CustomFont.Bold.rawValue, size: 14)
        label.text = "보관장소"
        label.textColor = UIColor.black
        label.textAlignment = .left
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setAutoLayout()
        
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure(){
        addSubview(upperView)
        upperView.addSubViews([ingredientInfoView,storageInfoView,storageLocationLabel])
    }
    private func setAutoLayout(){
        upperView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        ingredientInfoView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            
        }
        storageInfoView.snp.makeConstraints { make in
            make.top.equalTo(ingredientInfoView.snp.bottom).offset(16)
            make.left.right.equalToSuperview()
        }
        storageLocationLabel.snp.makeConstraints { make in
            make.top.equalTo(storageInfoView.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
}
