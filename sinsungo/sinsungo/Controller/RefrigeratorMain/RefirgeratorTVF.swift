//
//  RefirgeratorTVF.swift
//  sinsungo
//
//  Created by 원동진 on 2023/01/31.
//

import UIKit

class RefirgeratorTVF: UITableViewHeaderFooterView {

    static let identi = "RefirgeratorTVFid"
    var tapAddRefClosure :(() -> ())?
    private lazy var containerView : UIStackView = {
        let containerView = UIStackView()
        containerView.backgroundColor = .clear
        containerView.axis = .vertical
        containerView.alignment = .fill
        containerView.distribution = .fillProportionally
        containerView.spacing = 12
        return containerView
    }()

    private lazy var addComentLabel : UILabel = {
        let contentLabel = UILabel()
        contentLabel.text = "새로운 냉장고를 만들어볼까요 ?"
        contentLabel.font = UIFont(name: "NanumSquareOTF_acB", size: 16)
        contentLabel.textColor = UIColor.black
       return contentLabel
    }()
    private lazy var addRefiregeratorButton : UIButton = {
        var config = UIButton.Configuration.plain()
        
        config.attributedTitle = AttributedString("새로운 냉장고 만들기", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: "NanumSquareOTF_acB", size: 12)!]))
        config.image = UIImage(named: "plusButton")
        config.baseForegroundColor = UIColor(named: "brownishgrey")
        config.imagePlacement = .top
        config.imagePadding = 4
        let addRefButotn = UIButton(configuration: config)
        addRefButotn.backgroundColor = UIColor(red: 240, green: 240, blue: 240)
        addRefButotn.layer.cornerRadius = 4
        addRefButotn.addTarget(self, action: #selector(tapAddRefAction), for: .touchUpInside)
        return addRefButotn
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
extension RefirgeratorTVF {
    private func addSubView(){
        addSubview(containerView)
        containerView.addArrangedSubview(addComentLabel)
        containerView.addArrangedSubview(addRefiregeratorButton)
        
    }
    private func autoLayout(){
        containerView.snp.makeConstraints { make in

            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
        }
        
    }
    @objc func tapAddRefAction(){
        tapAddRefClosure?()
    }
}
