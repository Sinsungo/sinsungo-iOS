//
//  ShopBasketTVC.swift
//  sinsungo
//
//  Created by 원동진 on 2023/11/01.
//

import UIKit

class ShopBasketTVC: UITableViewCell {
    static let identi = "ShopBasketTVCid"
    private lazy var upperStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 11
        return stackView
    }()
    private lazy var firstStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()
    private lazy var secondStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()
    private lazy var basektImgView : UIImageView = {
        let basektImgView = UIImageView()
        basektImgView.image = UIImage(named: "BasketImg")
        basektImgView.contentMode = .scaleAspectFit
        return basektImgView
    }()
    private lazy var ingredientNameLabel : UILabel = {
       let ingLabel = UILabel()
        ingLabel.textColor = .black
        ingLabel.font = UIFont(name: CustomFont.Bold.rawValue, size: 14)
        return ingLabel
    }()
    private lazy var cntLabel : UILabel = {
        let cntLabel = UILabel()
        cntLabel.textColor = .black
        cntLabel.font = UIFont(name: CustomFont.Bold.rawValue, size: 12)
        return cntLabel
    }()
    private lazy var memoLabel : UILabel = {
        let memoLabel = UILabel()
        memoLabel.textColor = .black
        memoLabel.font = UIFont(name: CustomFont.Bold.rawValue, size: 10)
        return memoLabel
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
        setAutoLayout()
        setShadow()
        memoLabel.numberOfLines = 0
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:\(coder)) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension ShopBasketTVC{
    private func addSubViews(){
        contentView.addSubview(upperStackView)
        firstStackView.addStackSubViews([basektImgView,ingredientNameLabel])
        secondStackView.addStackSubViews([firstStackView,cntLabel])
        upperStackView.addArrangedSubview(secondStackView)
        
    }
    private func setAutoLayout(){
        basektImgView.setContentHuggingPriority(.init(751), for: .horizontal)
        ingredientNameLabel.setContentHuggingPriority(.init(750), for: .horizontal)
        firstStackView.setContentHuggingPriority(.init(751), for: .horizontal)
        cntLabel.setContentHuggingPriority(.init(750), for: .horizontal)
        upperStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(13)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-13)
        }

        
    }
    func setBasketInfo(model :BasketInfo ){
        ingredientNameLabel.text = model.name
        cntLabel.text = "\(model.cnt)"
        
        if model.memo != nil {
            let attrStr = NSAttributedString(string: model.memo ?? "" ).withLineSpacing(4)
            memoLabel.attributedText = attrStr
            upperStackView.addArrangedSubview(memoLabel)
        }
    }
    func setShadow(){
        backgroundColor = .clear // very important
        layer.masksToBounds = false
        layer.shadowOpacity = 0.08
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor.black.cgColor
        
        // add corner radius on `contentView`
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
    }
}

