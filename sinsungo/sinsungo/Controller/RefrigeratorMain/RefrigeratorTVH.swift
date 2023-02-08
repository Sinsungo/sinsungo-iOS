//
//  RefrigeratorTVH.swift
//  sinsungo
//
//  Created by 원동진 on 2023/01/31.
//
//TestBranch
import UIKit
import SnapKit
class RefrigeratorTVH: UITableViewHeaderFooterView{
    static let identi = "RefirgeratorTVHid"
    private lazy var containerView : UIView = {
        let containerView = UIView()
        return containerView
    }()
    private lazy var groupNameLabel : UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = UIColor.black
        nameLabel.font = UIFont(name: "NanumSquareOTF_acEB", size: 20)
        return nameLabel
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
extension RefrigeratorTVH {
    private func addSubView(){
        addSubview(containerView)
        containerView.addSubview(groupNameLabel)
   
    }
    private func autoLayout(){
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
         
            
        }
        groupNameLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    func setGroupNameLabel(model : String){
        groupNameLabel.text = "\(model)의 냉장고"
    }
    
}
