//
//  SelectedModalTVCell.swift
//  sinsungo
//
//  Created by 원동진 on 2023/10/31.
//

import UIKit

class SelectedModalTVCell: UITableViewCell {

    static let identi = "SortModalTVCellid"
    private lazy var containerView : UIView = {
        let containerView = UIView()
        containerView.backgroundColor = UIColor(named: "palegrey")
        return containerView
    }()
    private lazy var standardLabel : UILabel = {
        let standardLabel = UILabel()
        standardLabel.font = UIFont(name: CustomFont.Regular.rawValue, size: 16)
        standardLabel.textColor = UIColor.black
        return standardLabel
    }()
    private lazy var checkImgView : UIImageView = {
        let checkImgView = UIImageView()
        return checkImgView
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubView()
        setAutoLayout()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected == true {
            standardLabel.font = UIFont(name: CustomFont.Bold.rawValue, size: 16)
            checkImgView.image = UIImage(named: "checkImg")
        }else{
            standardLabel.font = UIFont(name: CustomFont.Regular.rawValue, size: 16)
            checkImgView.image = UIImage()
        }
    }
}
extension SelectedModalTVCell {
    private func addSubView(){
        contentView.addSubview(containerView)
        containerView.addSubview(standardLabel)
        containerView.addSubview(checkImgView)
    }
    private func setAutoLayout(){
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        standardLabel.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview()
        }
        checkImgView.snp.makeConstraints { make in
            make.right.bottom.top.equalToSuperview()
        }
    }
    func setLabel(model: String){
        standardLabel.text = model
    }
}
