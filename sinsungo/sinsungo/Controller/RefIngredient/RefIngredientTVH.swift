//
//  RefIngredientTVH.swift
//  sinsungo
//
//  Created by 원동진 on 2023/03/24.
//

import UIKit

class RefIngredientTVH: UITableViewHeaderFooterView {
    static let identi = "RefIngredientTVHid"
    var tapSortButtonClosure :(() -> ())?
    private lazy var containerView : UIView = {
        let containerView = UIView()
        return containerView
    }()
    private lazy var upperStackView : UIStackView = {
        let upperStackView = UIStackView()
        upperStackView.axis = .horizontal
        upperStackView.distribution = .fillEqually
        upperStackView.alignment = .leading
        upperStackView.spacing = 10
        return upperStackView
    }()
    private lazy var sortButton : UIButton = {
        let sortButton = UIButton()
        sortButton.backgroundColor = UIColor(named: "whitetwo")
        sortButton.layer.cornerRadius = 16
        sortButton.layer.masksToBounds = true
        sortButton.addTarget(self, action: #selector(tapSortButton), for: .touchUpInside)
        return sortButton
    }()
    private lazy var expireDateButton : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("유통기한", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Bold.rawValue, size: 12)!]))
        config.image = UIImage(named: "dropDownImg")
        config.baseForegroundColor = .black
        config.imagePlacement = .trailing
        config.imagePadding = 4
        config.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 10, bottom: 4, trailing: 8)
        let expireDateButton = UIButton(configuration: config)
        expireDateButton.backgroundColor = UIColor(named: "whitetwo")
        expireDateButton.layer.cornerRadius = 16
        expireDateButton.layer.masksToBounds = true
        return expireDateButton
    }()
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addSubView()
        setAutoLayout()

       
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
extension RefIngredientTVH {
    private func addSubView(){
        addSubview(containerView)
        containerView.addSubview(upperStackView)
        upperStackView.addArrangedSubview(sortButton)
        upperStackView.addArrangedSubview(expireDateButton)
    }
    private func setAutoLayout(){
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(18)
            make.bottom.equalToSuperview().offset(-18)
            make.left.right.equalToSuperview()
        }
        upperStackView.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview()
        }
    }
    @objc private func tapSortButton(){
        tapSortButtonClosure?()
    }
    func setSortButton(sortStandard : String){
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("\(sortStandard)", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Bold.rawValue, size: 12)!]))
        config.image = UIImage(named: "sortImg")
        config.baseForegroundColor = .black
        config.imagePlacement = .leading
        config.imagePadding = 4
        config.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 10)
        sortButton.configuration = config
    }
}
