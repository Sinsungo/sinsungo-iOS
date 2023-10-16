//
//  ExpireDateModalVC.swift
//  sinsungo
//
//  Created by 원동진 on 2023/03/27.
//

import UIKit
import SnapKit
class ExpireDateModalVC: UIViewController {
    weak var expireDelegate : expireVCDelegate?
    var stepValue : Float = 30
    private lazy var explainLabel : UILabel = {
       let explainLabel = UILabel()
        explainLabel.text = "유통기한이 임박한 재료만 볼게요."
        explainLabel.textColor = .black
        explainLabel.font = UIFont(name: CustomFont.Bold.rawValue, size: 16)
        return explainLabel
    }()
    private lazy var expireSlider : CustomSlider = {
        let expireSlider = CustomSlider()
        expireSlider.minimumValue = 0
        expireSlider.maximumValue = 60
        expireSlider.value = 30
        expireSlider.tintColor = UIColor(named: "primarycolor")
        expireSlider.thumbTintColor = UIColor(named: "primarycolor")
        expireSlider.addTarget(self, action: #selector(slideMove), for: UIControl.Event.valueChanged)
        return expireSlider
    }()
    private lazy var expireLabel : UILabel = {
        let expireLabel = UILabel()
        expireLabel.textColor = .black
        expireLabel.textAlignment = .center
        expireLabel.text = "30일 이하"
        expireLabel.font = UIFont(name: CustomFont.Bold.rawValue, size: 16)
        return expireLabel
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
        config.attributedTitle = AttributedString("닫기", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Bold.rawValue, size: 16)!]))
        config.baseForegroundColor = UIColor(named: "brownishgrey")
        config.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 0, bottom: 16, trailing: 0)
        let cancelButton = UIButton(configuration: config)
        cancelButton.layer.cornerRadius = 8
        cancelButton.backgroundColor = UIColor(named: "whitetwo")
        cancelButton.addTarget(self, action: #selector(tapDismiss), for: .touchUpInside)
        return cancelButton
    }()
    private lazy var confirmButton : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("확인", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Bold.rawValue, size: 16)!]))
        config.baseForegroundColor = .white
        config.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 0, bottom: 16, trailing: 0)
        let makeRefButton = UIButton(configuration: config)
        makeRefButton.layer.cornerRadius = 8
        makeRefButton.backgroundColor = UIColor(named: "primarycolor")
        makeRefButton.addTarget(self, action: #selector(tapConfirm), for: .touchUpInside)
        return makeRefButton
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "palegrey")
        addSubView()
        setAutoLayout()
    }
  
    

}
extension ExpireDateModalVC {
    private func addSubView(){
        self.view.addSubview(explainLabel)
        self.view.addSubview(expireSlider)
        self.view.addSubview(expireLabel)
        self.view.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(cancelButton)
        buttonStackView.addArrangedSubview(confirmButton)
    }
    private func setAutoLayout(){
        explainLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(22)
            make.left.equalTo(self.view.safeAreaLayoutGuide).offset(16)
            make.right.equalTo(self.view.safeAreaLayoutGuide).offset(-16)
        }
        expireSlider.snp.makeConstraints { make in
            make.top.equalTo(explainLabel.snp.bottom).offset(28)
            make.left.equalTo(self.view.safeAreaLayoutGuide).offset(16)
            make.right.equalTo(self.view.safeAreaLayoutGuide).offset(-16)
        }
        expireLabel.snp.makeConstraints { make in
            make.top.equalTo(expireSlider.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(expireLabel.snp.bottom).offset(22)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-12)
        }
        
    }
    @objc func slideMove(){
        let step : Float = 1
        let expireDate = expireSlider.value
        self.stepValue = round(expireDate / step) * step
        expireLabel.text = "\(Int(stepValue))일 이하"
    }
    @objc func tapConfirm(){
        let sendData = Int(self.stepValue)
        self.expireDelegate?.send(expireDate: "\(String(describing: sendData))")
        self.presentingViewController?.dismiss(animated: true)
    }
    
}
#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct ExpireDateModalVCPreview: PreviewProvider {
    static var previews: some View {
        ExpireDateModalVC().showPreview(.iPhone14Pro)
    }
}
#endif

