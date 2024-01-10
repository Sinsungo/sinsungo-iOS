//
//  SortBtn_CheckView.swift
//  sinsungo
//
//  Created by 원동진 on 2023/10/19.
//

import UIKit

class SortBtn_CheckView: UIView {
    var tapBtnAction : (()->())?
    lazy var sortBtn : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("기본순 (최신순)", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Bold.rawValue, size: 16)!]))
        config.baseForegroundColor = .black
        let sortBtn = UIButton(configuration: config)
        sortBtn.addTarget(self, action: #selector(tapSortBtn), for: .touchUpInside)
        return sortBtn
    }()
    lazy var checkImgView : UIImageView = {
        let checkImgView = UIImageView()
        checkImgView.image = UIImage(named: "checkImg")
        return checkImgView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(sortBtn)
        addSubview(checkImgView)
        setAutoLayout()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    func setAutoLayout(){
        sortBtn.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview()
        }
        checkImgView.snp.makeConstraints { make in
            make.top.right.bottom.equalToSuperview()
        }
    }
    func setSortView(_ sortStandard : String,_ selected : Bool){
        var config = UIButton.Configuration.plain()
        config.baseForegroundColor = .black
        if selected{
            config.attributedTitle = AttributedString(sortStandard, attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Bold.rawValue, size: 16)!]))
            checkImgView.isHidden = false
        }else{
            config.attributedTitle = AttributedString(sortStandard, attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Regular.rawValue, size: 16)!]))
            checkImgView.isHidden = true
        }
        sortBtn.configuration = config
    }
    
    @objc func tapSortBtn(){
        tapBtnAction?()
    }
    
}
#if DEBUG
import SwiftUI

struct SortBtn_CheckViewPreview: PreviewProvider {
    static var previews: some View {
        return SortBtn_CheckView().showPreview()
    }
}
#endif
