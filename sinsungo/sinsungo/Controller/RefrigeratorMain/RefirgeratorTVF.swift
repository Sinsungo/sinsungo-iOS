//
//  RefirgeratorTVF.swift
//  sinsungo
//
//  Created by 원동진 on 2023/01/31.
//

import UIKit

class RefirgeratorTVF: UITableViewHeaderFooterView {

    var refrigeratorName = "냉장고이름"
    static let identi = "RefirgeratorTVFid"
    private lazy var containerView : UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .green
        return containerView
    }()
    private lazy var refrigeratorNameLabel : UILabel = {
       let nameLabel = UILabel()
        nameLabel.text = "\(refrigeratorName)"
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
extension RefirgeratorTVF {
    private func addSubView(){
        addSubview(containerView)
        containerView.addSubview(refrigeratorNameLabel)
    }
    private func autoLayout(){
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        refrigeratorNameLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
