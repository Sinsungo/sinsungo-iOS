//
//  StroageLoationCVCell.swift
//  sinsungo
//
//  Created by 원동진 on 2023/05/31.
//
//Ref : 냉장고
import UIKit
import SnapKit
class StorageLocationCVCell: UICollectionViewCell {
    static let identi = "StroageLoationCVCellid"
    private lazy var selectedRefButton : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("미선택 냉장고", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Bold.rawValue, size: 14)!]))
        config.baseForegroundColor = UIColor(named: "brownishgrey")
        config.contentInsets = NSDirectionalEdgeInsets.init(top: 17, leading: 17, bottom: 17, trailing: 17)// <- 안에 내용에 대한 inset
        let selectedRefButton = UIButton(configuration: config)
        selectedRefButton.layer.cornerRadius = 8
        selectedRefButton.layer.borderWidth = 1
        selectedRefButton.layer.borderColor = UIColor(named: "verylightpink")?.cgColor
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
