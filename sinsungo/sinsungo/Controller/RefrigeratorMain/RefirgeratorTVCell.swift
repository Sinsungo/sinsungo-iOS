//
//  RefirgeratorTableViewCell.swift
//  sinsungo
//
//  Created by 원동진 on 2023/01/30.
//

import UIKit

class RefirgeratorTVCell: UITableViewCell {
    static let identi = "RefirgeratorTVCellid"
    private lazy var firstStackView : UIStackView = {
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
        return detailButton
    }()
    //MARK: - firstIngredientView
    let firstIngredientView = setIngredientView(ingredientName: "재료명", ingredientCnt: 1, remainPeriod: 1)
    //MARK: - twoIngredientView
    let twoIngredientView = setIngredientView(ingredientName: "재료명", ingredientCnt: 2, remainPeriod: 2)
    //MARK: - thirdIngredientView
    let thirdIngredientView = setIngredientView(ingredientName: "재료명", ingredientCnt: 3, remainPeriod: 3)
    private lazy var ingredientStackView : UIStackView = {
        let ingredientStackView = UIStackView()
        ingredientStackView.axis = .vertical
        ingredientStackView.alignment = .fill
        ingredientStackView.distribution = .fillEqually
        ingredientStackView.spacing = 8
        return ingredientStackView
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
    func setShadow(){
        backgroundColor = .clear // very important
        layer.masksToBounds = false
        layer.shadowOpacity = 0.23
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor.black.cgColor
        
        // add corner radius on `contentView`
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
    }
    func addContentView(){
        contentView.addSubview(firstStackView)
        contentView.addSubview(pushDetailButton)
        contentView.addSubview(ingredientStackView)
        firstStackView.addArrangedSubview(refrigeratorNameLabel)
        firstStackView.addArrangedSubview(ingredientCntLabel)
        ingredientStackView.addArrangedSubview(firstIngredientView)
        ingredientStackView.addArrangedSubview(twoIngredientView)
        ingredientStackView.addArrangedSubview(thirdIngredientView)
    }
    func setAutoLayout(){
        firstStackView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(8)
            make.left.equalTo(contentView.snp.left).offset(8)
            //            make.right.equalTo(contentView.snp.right).offset(-8)
        }
        pushDetailButton.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(8)
            make.right.equalTo(contentView.snp.right).offset(-8)
        }
        ingredientStackView.snp.makeConstraints { make in
            make.top.equalTo(firstStackView.snp.bottom).offset(8)
            make.left.equalTo(contentView.snp.left).offset(8)
            make.right.equalTo(contentView.snp.right).offset(-8)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8)
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
