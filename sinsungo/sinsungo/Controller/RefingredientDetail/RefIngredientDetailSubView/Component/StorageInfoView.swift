//
//  StorageInfoView.swift
//  sinsungo
//
//  Created by 원동진 on 2023/05/06.
//

import Foundation
import SnapKit
import UIKit
class StorageInfoView : UIView {
    private let storageInfoLabel : UILabel = {
        let label = UILabel()
        label.text = "보관 정보"
        label.font = UIFont(name: CustomFont.Bold.rawValue, size: 14)
        label.textColor = UIColor.black
        label.textAlignment = .left
        return label
    }()
    private lazy var btnStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        return stackView
    }()
    private lazy var consumeBtn : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("소비기한", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Bold.rawValue, size: 12)!]))
        config.baseForegroundColor = UIColor(named: "palegrey")
        config.contentInsets = NSDirectionalEdgeInsets.init(top: 10, leading: 10, bottom: 10, trailing: 10)
        let backButtonCustom = UIButton(configuration: config)
        let btn = UIButton(configuration: config)
        btn.backgroundColor = UIColor(named: "primarycolor")
        btn.layer.cornerRadius = 4
        btn.layer.masksToBounds = true
        return btn
    }()
    private lazy var expirationBtn : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("유통기한", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Bold.rawValue, size: 12)!]))
        config.baseForegroundColor = UIColor(named: "brownishgrey")
        config.contentInsets = NSDirectionalEdgeInsets.init(top: 10, leading: 10, bottom: 10, trailing: 10)
        let btn = UIButton(configuration: config)
        btn.backgroundColor = UIColor(named: "whitetwo")
        btn.layer.cornerRadius = 4
        btn.layer.masksToBounds = true
        return btn
    }()
    private lazy var dateInfoView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(named: "verylightpink")?.cgColor
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    private lazy var dateContentStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 6
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        return stackView
    }()
    private lazy var dateExplainLabel : UILabel = {
        let explainLabel = UILabel()
        explainLabel.text = "날짜"
        explainLabel.font = UIFont(name: CustomFont.Bold.rawValue, size: 12)
        return explainLabel
    }()
    private lazy var dateContentLabel : UILabel = {
        let contentLabel = UILabel()
        contentLabel.text = "YYYY.MM.DD"
        contentLabel.font = UIFont(name: CustomFont.Regular.rawValue, size: 14)
        return contentLabel
    }()
    private lazy var dateImgView : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "dateImg")
        return imgView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        setAutoLayout()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
extension StorageInfoView {
    private func addView(){
        self.addSubViews([storageInfoLabel,btnStackView,dateInfoView])
        btnStackView.addStackSubViews([consumeBtn,expirationBtn])
        dateInfoView.addSubViews([dateContentStackView,dateImgView])
        dateContentStackView.addStackSubViews([dateExplainLabel,dateContentLabel])
    }
    private func setAutoLayout(){
        storageInfoLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        btnStackView.snp.makeConstraints { make in
            make.top.equalTo(storageInfoLabel.snp.bottom).offset(8)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        dateInfoView.snp.makeConstraints { make in
            make.top.equalTo(btnStackView.snp.bottom).offset(8)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        dateContentStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.left.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-12)
        }
        dateImgView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-8)
            make.centerY.equalToSuperview()
        }
    }
}
