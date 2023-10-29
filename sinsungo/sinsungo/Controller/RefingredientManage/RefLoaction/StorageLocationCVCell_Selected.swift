//
//  StorageLocationCVCell_Selected.swift
//  sinsungo
//
//  Created by 원동진 on 2023/10/27.
//

import UIKit
import SnapKit
class StorageLocationCVCell_Selected: UICollectionViewCell {
    static let identi = "RefLoaction_SelectedId"
    private lazy var selectedRefButton : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("선택 냉장고", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Bold.rawValue, size: 14)!]))
        config.baseForegroundColor = UIColor(named: "darkSkyBlue")
        config.contentInsets = NSDirectionalEdgeInsets.init(top: 17, leading: 17, bottom: 17, trailing: 17)// <- 안에 내용에 대한 inset
        let selectedRefButton = UIButton(configuration: config)
        selectedRefButton.layer.cornerRadius = 8
        selectedRefButton.layer.borderWidth = 1
        selectedRefButton.layer.borderColor = UIColor(named: "darkSkyBlue")?.cgColor
        selectedRefButton.backgroundColor = .white
        return selectedRefButton
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCell()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    private func setCell(){
        addSubview(selectedRefButton)
        selectedRefButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
    
