//
//  RefirgeratorTableViewCell.swift
//  sinsungo
//
//  Created by 원동진 on 2023/01/30.
//

import UIKit

class RefirgeratorTVCell: UITableViewCell {
    static let identi = "RefirgeratorTVCellid"
    var tapDetailButtonClosure : (() ->() )?
    private lazy var firstView : UIView = {
        let firstView = UIView()
        return firstView
    }()
    private lazy var refStackView : UIStackView = {
        let fStackView = UIStackView()
        fStackView.axis = .horizontal
        fStackView.alignment = .fill
        fStackView.distribution = .fillProportionally
        fStackView.spacing = 12
        return fStackView
    }()
    private lazy var refrigeratorNameLabel : UILabel = {
        let refNameLabel = UILabel()
        refNameLabel.textColor = UIColor.black
        refNameLabel.font = UIFont(name: "NanumSquareOTF_acB", size: 16)
        return refNameLabel
    }()
    
    private lazy var ingredientCntLabel : UILabel = {
        let igCntLabel = UILabel()
        igCntLabel.textColor = UIColor(named: "brownishgrey")
        igCntLabel.font = UIFont(name: "NanumSquareOTF_acB", size: 10)
        return igCntLabel
    }()
    private lazy var pushDetailButton : UIButton = {
        let detailButton = UIButton()
        detailButton.setImage(UIImage(named: "pushImg"), for: .normal)
        detailButton.addTarget(self, action: #selector(tapDetailButton), for: .touchUpInside)
        return detailButton
    }()
//    //MARK: - firstIngredientView
//    let firstIngredientView = setIngredientView(ingredientName: "재료명", ingredientCnt: 1, remainPeriod: 1)
////    //MARK: - twoIngredientView
//    let twoIngredientView = setIngredientView(ingredientName: "재료명", ingredientCnt: 2, remainPeriod: 2)
//    //MARK: - thirdIngredientView
//    let thirdIngredientView = setIngredientView(ingredientName: "재료명", ingredientCnt: 3, remainPeriod: 3)
//    let thirdIngredientView = addIngredientButton()
    private lazy var ingredientStackView : UIStackView = {
        let ingredientStackView = UIStackView()
        ingredientStackView.axis = .vertical
        ingredientStackView.alignment = .fill
        ingredientStackView.distribution = .equalSpacing
        ingredientStackView.spacing = 8
        return ingredientStackView
    }()
    let addIngredientButton : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("재료 추가하기", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: "NanumSquareOTF_acB", size: 12)!]))
        config.contentInsets = NSDirectionalEdgeInsets.init(top: 15, leading: 10, bottom: 15, trailing: 10)// <- 안에 내용에 대한 inset
        config.baseForegroundColor = UIColor.white
        let addIngredientButton = UIButton(configuration: config)
        addIngredientButton.backgroundColor = UIColor(named: "primarycolor")
        addIngredientButton.layer.cornerRadius = 4
        return addIngredientButton
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addContentView()
        setAutoLayout()
        setShadow()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension RefirgeratorTVCell {
    @objc func tapDetailButton(){
        tapDetailButtonClosure?()
    }
    @objc func testFunc(){
        print("Test")
    }
    func setIngredient(model : [IngredientFormat]) {
        if model.count < 3{
            for i in model{
                let IngredientView = setIngredientViewType1(ingredientName: i.ingredientName, ingredientCnt: i.ingredientCnt, remainPeriod: i.remainPeriod)
                ingredientStackView.addArrangedSubview(IngredientView)
            }
            ingredientStackView.addArrangedSubview(addIngredientButton)
        }else{
            for i in 0..<3 {
                let IngredientView = setIngredientViewType1(ingredientName: model[i].ingredientName, ingredientCnt: model[i].ingredientCnt, remainPeriod: model[i].remainPeriod)
                ingredientStackView.addArrangedSubview(IngredientView)
            }
        }
     
//        if model.count != 3 {
//            let addIngredientButton = addIngredientButton()
//            contentView.addSubview(addIngredientButton)
//            ingredientStackView.snp.updateConstraints { make in
//                make.top.equalTo(firstView.snp.bottom).offset(12)
//                make.left.equalTo(contentView.snp.left).offset(12)
//                make.right.equalTo(contentView.snp.right).offset(-12)
//            }
//            addIngredientButton.snp.makeConstraints { make in
//                make.top.equalTo(ingredientStackView.snp.bottom).offset(13)
//                make.left.equalTo(contentView.snp.left).offset(12)
//                make.right.equalTo(contentView.snp.right).offset(-12)
//                make.bottom.equalTo(contentView.snp.bo).offset(-18)
//            }
//
//        }
    
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
    func addContentView(){
        contentView.addSubview(firstView)
        firstView.addSubview(refStackView)
        firstView.addSubview(pushDetailButton)
        contentView.addSubview(ingredientStackView)
        
        refStackView.addArrangedSubview(refrigeratorNameLabel)
        refStackView.addArrangedSubview(ingredientCntLabel)
//        ingredientStackView.addArrangedSubview(firstIngredientView)
//        ingredientStackView.addArrangedSubview(twoIngredientView)
//        ingredientStackView.addArrangedSubview(thirdIngredientView)
    }
    func setAutoLayout(){
        firstView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
        }
        refStackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        pushDetailButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        ingredientStackView.snp.makeConstraints { make in
            make.top.equalTo(firstView.snp.bottom).offset(12)
            make.left.equalTo(contentView.snp.left).offset(12)
            make.right.equalTo(contentView.snp.right).offset(-12)
            make.bottom.equalTo(contentView.snp.bottom).offset(-12)
        }
    }
}
extension RefirgeratorTVCell {
    func setRefName(model :String){
        refrigeratorNameLabel.text = "\(model)"
    }
    func setigdCnt(model :String){
        ingredientCntLabel.text = "\(model)개"
    }
}
extension RefirgeratorTVCell : UITableViewDelegate{
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 5, bottom: 12, right: 5))
    }
}
