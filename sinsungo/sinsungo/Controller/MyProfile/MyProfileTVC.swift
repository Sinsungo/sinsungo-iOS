//
//  MyProfileTVC.swift
//  sinsungo
//
//  Created by 원동진 on 2023/11/07.
//

import UIKit
import SnapKit

class MyProfileTVC: UITableViewCell {
    static let identi = "MyProfileTVCid"
    private lazy var stackView : UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    private lazy var myProfileListLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont(name: CustomFont.Bold.rawValue, size: 16)
        return label
    }()

    private lazy var pushPageImg : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "pushImg")
        return imgView
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(named: "palegrey")
        addContentView()
        setAutoLayout()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:\(coder)) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
extension MyProfileTVC{
    private func addContentView(){
        contentView.addSubview(stackView)
        stackView.addStackSubViews([myProfileListLabel,pushPageImg])
    }
    private func setAutoLayout(){
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
        }
    }
    func setProfileCell(model : String){
        myProfileListLabel.text = model
    }
    func setHiddenPushImg(hidden : Bool){
        if hidden{
            pushPageImg.isHidden = true
        }
    }
}
