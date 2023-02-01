//
//  RefrigeratorTVH.swift
//  sinsungo
//
//  Created by 원동진 on 2023/01/31.
//

import UIKit
import SnapKit
class RefrigeratorTVH: UITableViewHeaderFooterView{
    static let identi = "RefirgeratorTVHid"
    private lazy var containerView : UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        return containerView
    }()
    private lazy var UIlabelStackView : UIStackView = {
        let UIlabelStackView = UIStackView()
        UIlabelStackView.axis = .horizontal
        UIlabelStackView.alignment = .fill
        UIlabelStackView.distribution = .fillEqually
        UIlabelStackView.spacing = 12
        return UIlabelStackView
    }()
    private lazy var refrigeratorNameLabel : UILabel = {
       let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 16)
        nameLabel.textColor = .black
        return nameLabel
    }()
    private lazy var ingredientCntLabel : UILabel = {
       let ingredientCntLabel = UILabel()
        ingredientCntLabel.font = UIFont.systemFont(ofSize: 10)
        ingredientCntLabel.textColor = .black
        return ingredientCntLabel
    }()
    private lazy var pushButton : UIButton = {
        
        let pushButton = UIButton()
        pushButton.setImage(UIImage(named: "pushImg"), for: .normal)
        
        return pushButton
    }()
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addSubView()
        autoLayout()
       
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
extension RefrigeratorTVH {
    private func addSubView(){
        addSubview(containerView)
        UIlabelStackView.addArrangedSubview(refrigeratorNameLabel)
        UIlabelStackView.addArrangedSubview(ingredientCntLabel)
        containerView.addSubview(UIlabelStackView)
        containerView.addSubview(pushButton)
   
    }
    private func autoLayout(){
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.size.height.width.equalTo(24)
        }
        UIlabelStackView.snp.makeConstraints { make in
            make.left.equalTo(containerView.snp.left).offset(8)
            make.top.equalTo(containerView.snp.top).offset(8)
        }
        pushButton.snp.makeConstraints { make in
            make.right.equalTo(containerView.snp.right).offset(-8)
            make.size.height.width.equalTo(24)
        }
    }
    func setRefrigeratorname(model : String){
        refrigeratorNameLabel.text = "\(model)"
    }
    func setIngredientCnt(model : String){
        ingredientCntLabel.text = "\(model)개"
    }
}
