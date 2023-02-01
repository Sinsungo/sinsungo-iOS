//
//  RefirgeratorTableViewCell.swift
//  sinsungo
//
//  Created by 원동진 on 2023/01/30.
//

import UIKit

class RefirgeratorTVCell: UITableViewCell {
    static let identi = "RefirgeratorTVCellid"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell(){
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 4
//        contentView.addShadow(location: .bottom)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 8, bottom: 4, right: 8))
        
    }
    func setAutoLayout(){
    }
    func addContentView(){
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
