//
//  AddRefModalVC.swift
//  sinsungo
//
//  Created by 원동진 on 2023/03/11.
//

import UIKit
import SnapKit
class AddRefModalVC: UIViewController {
    private lazy var containerView : UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        return containerView
    }()
    private lazy var addRefLabel : UILabel = {
        let addRefLabel = UILabel()
        addRefLabel.textAlignment = .left
        addRefLabel.text = "냉장고를 만들게요."
        addRefLabel.font = UIFont(name: "NanumSquareOTF_acB", size: 16)
        addRefLabel.textColor = .black
        addRefLabel.sizeToFit()
        return addRefLabel
    }()
    private lazy var refNameTextView : UIStackView = {
        let refNameTextView = UIStackView()
        refNameTextView.axis = .vertical
        refNameTextView.distribution = .fillProportionally
        refNameTextView.alignment = .leading
        refNameTextView.spacing = 6
        refNameTextView.layer.cornerRadius = 8
        refNameTextView.layer.borderWidth = 1
        refNameTextView.layer.borderColor = UIColor(named: "verylightpink")?.cgColor
        refNameTextView.layoutMargins = UIEdgeInsets(top: 12, left: 8, bottom: 12, right: 8)
        refNameTextView.isLayoutMarginsRelativeArrangement = true
        return refNameTextView
    }()
    private lazy var titleTextFiled : UILabel = {
        let titleTextFiled = UILabel()
        titleTextFiled.text = "이름"
        titleTextFiled.textAlignment = .left
        titleTextFiled.textColor = UIColor(named: "brownishgrey")
        titleTextFiled.font = UIFont(name: "NanumSquareOTF_acB", size: 12)
        titleTextFiled.sizeToFit()
        return titleTextFiled
    }()
    private lazy var refNameTextFiled : UITextField = {
       let refNameTextFiled = UITextField()
        refNameTextFiled.placeholder = "냉장고의 이름을 입력해주세요."
        refNameTextFiled.font = UIFont(name: "NanumSquareOTF_acR", size: 14)
        refNameTextFiled.setPlaceholder(color: UIColor(named: "brownishgrey")!)
        
        return refNameTextFiled
    }()

    private lazy var buttonStackView : UIStackView = {
        let buttonStackView = UIStackView()
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.alignment = .fill
        buttonStackView.spacing = 16
        return buttonStackView
    }()
    private lazy var cancelButton : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("닫기", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Bold.rawValue, size: 14)!]))
        config.baseForegroundColor = UIColor(named: "brownishgrey")
        config.contentInsets = NSDirectionalEdgeInsets.init(top: 17, leading: 0, bottom: 17, trailing: 0)
        let cancelButton = UIButton(configuration: config)
        cancelButton.layer.cornerRadius = 8
        cancelButton.backgroundColor = UIColor(named: "whitetwo")
        cancelButton.addTarget(self, action: #selector(tapDismiss), for: .touchUpInside)
        return cancelButton
    }()
    private lazy var makeRefButton : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("만들기", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Bold.rawValue, size: 14)!]))
        config.baseForegroundColor = .white
        config.contentInsets = NSDirectionalEdgeInsets.init(top: 17, leading: 0, bottom: 17, trailing: 0)
        let makeRefButton = UIButton(configuration: config)
        makeRefButton.layer.cornerRadius = 8
        makeRefButton.backgroundColor = UIColor(named: "primarycolor")
        return makeRefButton
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addSubView()
        setAutoLayout()
    }
}
extension AddRefModalVC  {
    private func addSubView(){
        self.view.addSubview(containerView)
        containerView.addSubview(addRefLabel)
        containerView.addSubview(refNameTextView)
        refNameTextView.addArrangedSubview(titleTextFiled)
        refNameTextView.addArrangedSubview(refNameTextFiled)
        containerView.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(cancelButton)
        buttonStackView.addArrangedSubview(makeRefButton)
        
    }
    private func setAutoLayout(){
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        addRefLabel.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(18)
            make.left.equalTo(containerView.snp.left).offset(16)
            make.right.equalTo(containerView.snp.right).offset(-16)
        }
        
        refNameTextView.snp.makeConstraints { make in
            make.top.equalTo(addRefLabel.snp.bottom).offset(11)
            make.left.equalTo(containerView.snp.left).offset(16)
            make.right.equalTo(containerView.snp.right).offset(-16)

        }
        
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(refNameTextView.snp.bottom).offset(16)
            make.left.equalTo(containerView.snp.left).offset(16)
            make.right.equalTo(containerView.snp.right).offset(-16)
            make.bottom.equalTo(containerView.snp.bottom).offset(-12)

        }
    }
    
}
#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct AddRefModalVCPreview: PreviewProvider {
    static var previews: some View {
        AddRefModalVC().showPreview(.iPhone14Pro)
    }
}
#endif

