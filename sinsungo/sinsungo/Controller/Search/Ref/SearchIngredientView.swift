//
//  SearchIngredientView.swift
//  sinsungo
//
//  Created by 원동진 on 2023/11/28.
//

import UIKit

class SearchIngredientView: UIView {
    private lazy var upperStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 6
        
        return stackView
    }()
    private lazy var innerStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.spacing = 12
        return stackView
    }()
    private lazy var ingNameLabel : UILabel = { // 재료명
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: CustomFont.Bold.rawValue, size: 12)
        label.text = "예시"
        label.textColor = .black
        return label
    }()
    private lazy var dividerLabel : UILabel = { // 분리 Label
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: CustomFont.Bold.rawValue, size: 12)
        label.text = "|"
        label.textColor = .black
        return label
    }()
    private lazy var ingCntLabel : UILabel = { // 수량
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: CustomFont.Bold.rawValue, size: 12)
        label.text = "00개"
        label.textColor = .black
        return label
    }()
   
    private lazy var remainProgressBar : UIProgressView = { // 보관 bar
        let remainProgressBar = UIProgressView()
        remainProgressBar.progressViewStyle = .default
        remainProgressBar.clipsToBounds = true // 확인해보기
        remainProgressBar.layer.cornerRadius = 4
        remainProgressBar.layer.sublayers![1].cornerRadius = 4
        remainProgressBar.subviews[1].clipsToBounds = true
        remainProgressBar.progressTintColor = UIColor(named: "palered")
        remainProgressBar.trackTintColor = UIColor(named: "whitetwo")
        remainProgressBar.progress = 0.6
        return remainProgressBar
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        setAutoLayout()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    private func addView(){
        addSubview(upperStackView)
        upperStackView.addStackSubViews([innerStackView,remainProgressBar])
        innerStackView.addStackSubViews([ingNameLabel,dividerLabel,ingCntLabel])
    }
    func setAutoLayout(){
        upperStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.bottom.equalToSuperview().offset(-8)
        }
    }
    
}

#if DEBUG
import SwiftUI

struct SearchIngredientViewPreview: PreviewProvider {
    static var previews: some View {
        return SearchIngredientView().showPreview()
    }
}
#endif
