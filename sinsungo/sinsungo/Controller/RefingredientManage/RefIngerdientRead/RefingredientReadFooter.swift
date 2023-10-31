//
//  RefingredientDetailFooter.swift
//  sinsungo
//
//  Created by 원동진 on 2023/05/31.
//

import UIKit

class RefingredientReadFooter: UICollectionReusableView {
    static let identi = "RefingredientDetailFooterid"
    var tapUpdateIngredientClosure : (() ->() )?
    private lazy var bottomBtnStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    private lazy var deleteBtn : RefIngredientBottomBtn = {
        let btn = RefIngredientBottomBtn()
        btn.setBtnTitle("삭제")
        return btn
    }()
    private lazy var duplicationBtn : RefIngredientBottomBtn = {
        let btn = RefIngredientBottomBtn()
        btn.setBtnTitle("수정")
        btn.addTarget(self, action: #selector(tapUpdateIngredient), for: .touchUpInside)
        return btn
    }()
    private lazy var basketBtn : RefIngredientBottomBtn = {
        let btn = RefIngredientBottomBtn()
        btn.setBtnTitle("장바구니")
        return btn
    }()
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    private func configure(){
        addSubview(bottomBtnStackView)
        bottomBtnStackView.addStackSubViews([deleteBtn,duplicationBtn,basketBtn])
        bottomBtnStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-12)
        }
    }
    @objc func tapUpdateIngredient(){
        tapUpdateIngredientClosure?()
    }
    
}
