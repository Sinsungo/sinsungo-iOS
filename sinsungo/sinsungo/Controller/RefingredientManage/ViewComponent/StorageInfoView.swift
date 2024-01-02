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
        btn.addTarget(self, action: #selector(tapConsumebtn), for: .touchUpInside)
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
        btn.addTarget(self, action: #selector(tapExpirationBtn), for: .touchUpInside)
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

    private lazy var dateContentTextField : UITextField = {
        let contentTextField = UITextField()
        contentTextField.text = "YYYY.MM.DD"
        contentTextField.font = UIFont(name: CustomFont.Regular.rawValue, size: 14)
        contentTextField.inputView = datePicker
        contentTextField.text = dateFormat(date: Date())
        return contentTextField
    }()
    private lazy var datePicker : UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = Locale(identifier: "ko-KR")
        datePicker.addTarget(self, action: #selector(dateChange), for: .valueChanged)
        return datePicker
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
        setupToolBar() 
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
        dateContentStackView.addStackSubViews([dateExplainLabel,dateContentTextField])
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
    @objc func tapExpirationBtn(){
        setNonSelectedBtn(btn: consumeBtn, name: "소비기한")
        setSelectedBtn(btn: expirationBtn, name: "유통기한")
    }
    @objc func tapConsumebtn(){
        setNonSelectedBtn(btn: expirationBtn, name: "유통기한")
        setSelectedBtn(btn: consumeBtn, name: "소비기한")
    }
    func setSelectedBtn(btn : UIButton,name : String){
        var setSelectedBtnConfig = UIButton.Configuration.plain()
        setSelectedBtnConfig.baseForegroundColor = UIColor(named: "palegrey")
        setSelectedBtnConfig.attributedTitle = AttributedString("\(name)", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Bold.rawValue, size: 12)!]))
        setSelectedBtnConfig.contentInsets = NSDirectionalEdgeInsets.init(top: 10, leading: 10, bottom: 10, trailing: 10)
        btn.configuration = setSelectedBtnConfig
        btn.backgroundColor = UIColor(named: "primarycolor")
    }
    func setNonSelectedBtn(btn : UIButton,name : String){
        var setNonSelectedBtnConfig = UIButton.Configuration.plain()
        setNonSelectedBtnConfig.baseForegroundColor = UIColor(named: "brownishgrey")
        setNonSelectedBtnConfig.attributedTitle = AttributedString("\(name)", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Bold.rawValue, size: 12)!]))
        setNonSelectedBtnConfig.contentInsets = NSDirectionalEdgeInsets.init(top: 10, leading: 10, bottom: 10, trailing: 10)
        btn.configuration = setNonSelectedBtnConfig
        btn.backgroundColor = UIColor(named: "whitetwo")
    }
    func setBtnDisable(disable : Bool){
        if disable {
            expirationBtn.isUserInteractionEnabled = false
            consumeBtn.isUserInteractionEnabled = false
        }else{
            expirationBtn.isUserInteractionEnabled = true
            consumeBtn.isUserInteractionEnabled = true
        }
    }
//MARK: - 데이트 Picker
    @objc func dateChange(_ sender: UIDatePicker) {
        // DatePicker - 값이 변할 때 마다 동작
        // 값이 변하면 UIDatePicker에서 날짜 -> TextField
        dateContentTextField.text = dateFormat(date: sender.date)
    }
    private func dateFormat(date: Date) -> String {
        // 텍스트 필드에 들어갈 텍스트 설정
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        
        return formatter.string(from: date)
    }
    private func setupToolBar() {
        let toolBar = UIToolbar()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tapDownKeyBoard))
        toolBar.items = [flexibleSpace, doneButton]
        toolBar.sizeToFit()
        dateContentTextField.inputAccessoryView = toolBar
    }
    @objc func tapDownKeyBoard(_ sender: UIBarButtonItem) {
        dateContentTextField.text = dateFormat(date: datePicker.date)
        dateContentTextField.resignFirstResponder()
    }
}
