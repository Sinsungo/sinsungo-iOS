//
//  RefIngredientTVCell.swift
//  sinsungo
//
//  Created by 원동진 on 2023/03/24.
//

import UIKit

class RefIngredientTVCell: UITableViewCell {
    static let identi = "RefIngredientTVCellid"
    var selectVC = false
    
    var containerView : UIView = {
       let containerVIew = UIView()
        return containerVIew
    }()
    private lazy var firstStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 2
        return stackView
    }()

    private lazy var ingredientLabel : UILabel = { // 재료명
        let ingredientNameLabel = UILabel()
        ingredientNameLabel.font = UIFont(name: "NanumSquareOTF_acB", size: 12)
        ingredientNameLabel.textColor = .black
        return ingredientNameLabel
    }()
    private lazy var ingredientCntLabel : UILabel = { //재료 수
        let ingredientCntLabel = UILabel()
        ingredientCntLabel.font = UIFont(name: "NanumSquareOTF_acB", size: 10)
        
        return ingredientCntLabel
    }()
    private lazy var remainProgressBar : UIProgressView = { // 보관 bar
        let remainProgressBar = UIProgressView()
        remainProgressBar.progressViewStyle = .default
        remainProgressBar.clipsToBounds = true // 확인해보기
        remainProgressBar.layer.cornerRadius = 4
        remainProgressBar.layer.sublayers![1].cornerRadius = 4
        remainProgressBar.subviews[1].clipsToBounds = true
        remainProgressBar.progressTintColor = UIColor(named: "palered")
        remainProgressBar.trackTintColor = UIColor(named: "whitetwo")
        remainProgressBar.progress = 0.6
       
        return remainProgressBar
    }()
    private lazy var secondStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 68
        return stackView
    }()
    private lazy var archiveDateLabel : UILabel = {
        let archiveDateLabel = UILabel()
        archiveDateLabel.text = "{보관구분까지} 00일 남았어요"
        archiveDateLabel.font = UIFont(name: CustomFont.Bold.rawValue, size: 10)
        archiveDateLabel.textColor = .black
        return archiveDateLabel
    }()

    private lazy var remainDateLabel : UILabel = {
        let remainDateLabel = UILabel()
        remainDateLabel.text = "{보관구분} yyyy-MM-dd"
        remainDateLabel.font = UIFont(name: CustomFont.Bold.rawValue, size: 10)
        remainDateLabel.textColor = .black
        return remainDateLabel
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubView()
        setAutoLayout()
        setShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 6, left: 0, bottom: 6, right: 0))
    }
    
}
extension RefIngredientTVCell {
    func setShadow(){
        backgroundColor = .clear // very important
        layer.masksToBounds = false
        layer.shadowOpacity = 0.08
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor.black.cgColor
        
        // add corner radius on `contentView`
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 4
    }
    func setRefIngredient(model:RefIngredientFormat){
        ingredientLabel.text = "\(model.ingredientName) | "
        ingredientCntLabel.text = "\(model.ingredientCnt)"
        
    }
    private func addSubView(){
        contentView.addSubview(containerView)
        containerView.addSubview(firstStackView)
        containerView.addSubview(secondStackView)
        firstStackView.addArrangedSubview(ingredientLabel)
        firstStackView.addArrangedSubview(ingredientCntLabel)
        containerView.addSubview(remainProgressBar)
        secondStackView.addArrangedSubview(archiveDateLabel)
        secondStackView.addArrangedSubview(remainDateLabel)

    }
    private func setAutoLayout(){
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
        firstStackView.snp.makeConstraints { make in
            make.left.equalTo(containerView.snp.left).offset(12)
            make.top.equalTo(containerView.snp.top).offset(8)
        }
        remainProgressBar.snp.makeConstraints { make in
            make.top.equalTo(firstStackView.snp.bottom).offset(8)
            make.left.equalTo(containerView.snp.left).offset(12)
            make.right.equalTo(containerView.snp.right).offset(-12)
            make.height.equalTo(13)
        }
        secondStackView.snp.makeConstraints { make in
            make.top.equalTo(remainProgressBar.snp.bottom).offset(8)
            make.left.equalTo(containerView.snp.left).offset(12)
            make.right.equalTo(containerView.snp.right).offset(-12)
            make.bottom.equalTo(containerView.snp.bottom).offset(-12)
        }
    }
}
