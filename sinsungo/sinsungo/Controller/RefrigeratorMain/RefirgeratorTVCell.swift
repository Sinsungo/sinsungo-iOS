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
        fStackView.distribution = .fill
        fStackView.spacing = 12
        return fStackView
    }()
    private lazy var refrigeratorNameLabel : UILabel = {
        let refNameLabel = UILabel()
        refNameLabel.textColor = UIColor.black
        refNameLabel.font = UIFont.systemFont(ofSize: 16)
        return refNameLabel
    }()
    
    private lazy var ingredientCntLabel : UILabel = {
        let igCntLabel = UILabel()
        igCntLabel.textColor = UIColor(named: "brownishgrey")
        igCntLabel.font = UIFont.systemFont(ofSize: 10)
        return igCntLabel
    }()
    private lazy var pushDetailButton : UIButton = {
        let detailButton = UIButton()
        detailButton.setImage(UIImage(named: "pushImg"), for: .normal)
        return detailButton
    }()
    //MARK: - secondStack
    private lazy var secondStackView : UIStackView = {
        let secondStackView = UIStackView()
        secondStackView.axis = .horizontal
        secondStackView.alignment = .fill
        secondStackView.layer.borderWidth = 1
        secondStackView.layer.borderColor = UIColor(named: "verylightpink")?.cgColor
        secondStackView.layer.cornerRadius = 4
        return secondStackView
    }()
    //MARK: - thirdStack
    private lazy var thirdStackView : UIStackView = {
        let thirdStackView = UIStackView()
        thirdStackView.axis = .horizontal
        thirdStackView.alignment = .fill
        thirdStackView.layer.borderWidth = 1
        thirdStackView.layer.borderColor = UIColor(named: "verylightpink")?.cgColor
        thirdStackView.layer.cornerRadius = 4
        return thirdStackView
    }()
    //MARK: - fourStack
    private lazy var fourStackView : UIStackView = {
        let fourStackView = UIStackView()
        fourStackView.axis = .horizontal
        fourStackView.alignment = .fill
        fourStackView.layer.borderWidth = 1
        fourStackView.layer.borderColor = UIColor(named: "verylightpink")?.cgColor
        fourStackView.layer.cornerRadius = 4
        return fourStackView
    }()
    private lazy var fiveStackView : UIStackView = {
        let fiveStackView = UIStackView()
        fiveStackView.axis = .vertical
        fiveStackView.alignment = .fill
        fiveStackView.distribution = .fillEqually
        fiveStackView.spacing = 8
        return fiveStackView
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addContentView()
        setAutoLayout()
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension RefirgeratorTVCell {
    //    func setCellUI(){
    //        layer.shadowColor = UIColor.black.cgColor
    //        layer.shadowOpacity = 1
    //        layer.shadowRadius = 0.5
    ////        layer.shadowOffset = CGSize(width: 5, height: 5)
    //        layer.shadowOffset = .zero
    //        contentView.layer.masksToBounds = false
    //    }
    func addContentView(){
        contentView.addSubview(firstStackView)
        contentView.addSubview(pushDetailButton)
        contentView.addSubview(fiveStackView)
        firstStackView.addArrangedSubview(refrigeratorNameLabel)
        firstStackView.addArrangedSubview(ingredientCntLabel)
        fiveStackView.addArrangedSubview(secondStackView)
        fiveStackView.addArrangedSubview(thirdStackView)
        fiveStackView.addArrangedSubview(fourStackView)
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
        fiveStackView.snp.makeConstraints { make in
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
