//
//  SearchBasketTVC.swift
//  sinsungo
//
//  Created by 원동진 on 2023/12/11.
//

import SnapKit
import UIKit
class SearchBasketTVC: UITableViewCell {
    static let identi = "searchBasketTVCid"
    var tapDetailBasketBtnClosure : (() ->())?
    private lazy var topStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8
        return stackView
    }()
    private lazy var basketStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        return stackView
    }()
    private lazy var searchTypeNameLabel : UILabel = { // 어떤 종류에서 검색명을 찾앚는지 ?
        let label = UILabel()
        label.text = "장바구니에서 찾았어요!"
        label.font = UIFont(name: CustomFont.Bold.rawValue, size: 16)
        label.textColor = .black
        return label
    }()
    private lazy var searchCntLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "00건"
        label.font = UIFont(name: CustomFont.Bold.rawValue, size: 10)
        label.textColor = UIColor(named: "brownishgrey")
        return label
    }()
    private lazy var pushBtn : UIButton = {
        let btn  = UIButton()
        btn.setImage(UIImage(named: "pushImg"), for: .normal)
        btn.addTarget(self, action: #selector(tapDetailSearchResult), for: .touchUpInside)
        return btn
    }()

    lazy var basket1 : SearchBasketView = {
        let view = SearchBasketView()
        view.layer.borderColor = UIColor(named: "verylightpink")?.cgColor
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 1
        return view
    }()
    lazy var basket2 : SearchBasketView = {
        let view = SearchBasketView()
        view.layer.borderColor = UIColor(named: "verylightpink")?.cgColor
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 1
        return view
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addContentView()
        setAutoLayout()
        setShadow()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:\(coder)) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
extension SearchBasketTVC{
    private func addContentView(){
        
        contentView.addSubViews([topStackView,basketStackView])
        topStackView.addStackSubViews([searchTypeNameLabel,searchCntLabel,pushBtn])
        basketStackView.addStackSubViews([basket1,basket2])
    }
    private func setAutoLayout(){
        searchTypeNameLabel.setContentHuggingPriority(.init(rawValue: 750), for: .horizontal)
        searchCntLabel.setContentHuggingPriority(.init(rawValue: 500), for: .horizontal)
        pushBtn.setContentHuggingPriority(.init(rawValue: 750), for: .horizontal)
        topStackView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(12)
            make.left.equalTo(contentView.snp.left).offset(8)
            make.right.equalTo(contentView.snp.right).offset(-8)
        }
        basketStackView.snp.makeConstraints { make in
            make.top.equalTo(topStackView.snp.bottom).offset(7)
            make.left.equalTo(contentView.snp.left).offset(10)
            make.right.equalTo(contentView.snp.right).offset(-10)
            make.bottom.equalTo(contentView.snp.bottom).offset(-10)
            
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
    @objc private func tapDetailSearchResult(){
        tapDetailBasketBtnClosure?()
    }
}
