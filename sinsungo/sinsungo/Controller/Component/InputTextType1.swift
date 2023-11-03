//
//  IngredientInfoView.swift
//  sinsungo
//
//  Created by 원동진 on 2023/05/04.
//

import Foundation
import UIKit
import SnapKit

class InputTextType1 : UIView {
    var textFieldDidBeginClosure : (()->())?
    var textFieldDidEndClosure : (()->())?
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
    lazy var infoContentTextField : UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: CustomFont.Regular.rawValue, size: 14)
        textField.textColor = UIColor(named: "brownishgrey")
        textField.delegate = self
        
        return textField
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
extension InputTextType1 {
    private func addView(){
        addSubview(upperView)
        upperView.addArrangedSubview(infoTitleLabel)
        upperView.addArrangedSubview(infoContentTextField)
        
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
        infoContentTextField.attributedPlaceholder = NSAttributedString(string: content,attributes: [NSAttributedString.Key.foregroundColor : UIColor(named: "brownishgrey")!])
//        infoContentTextField.attributedPlaceholder = NSAttributedString(string: "\(content)",attributes: [NSAttributedString.Key.foregroundColor : UIColor(named: "brownishgrey")])
    }
    
}
extension InputTextType1 : UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textFieldDidBeginClosure?()
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textFieldDidEndClosure?()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
#if DEBUG
import SwiftUI

struct InputTextType11review: PreviewProvider {
    static var previews: some View {
        return InputTextType1 ().showPreview()
    }
}
#endif
