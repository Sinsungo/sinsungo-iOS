//
//  SortModalVC.swift
//  sinsungo
//
//  Created by 원동진 on 2023/03/27.
//

import UIKit
import SnapKit
// 정령 기준 ModalVC
class SortModalVC: UIViewController {
    weak var sortDelegate : sortVCDelegate?
    var standard = "기본순 (최신순)"
    private lazy var explainLabel : UILabel = {
        let explainLabel = UILabel()
        explainLabel.text = "정렬 기준을 선택해주세요."
        explainLabel.textColor = .black
        explainLabel.font = UIFont(name: CustomFont.Bold.rawValue, size: 16)
        return explainLabel
    }()
    private lazy var sortStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    private lazy var view1  : SortBtn_CheckView = {
        let view1  = SortBtn_CheckView()
        view1.setSortView("기본순 (최신순)",true)
        view1.tapBtnAction = { [unowned self] in
            view1.setSortView("기본순 (최신순)",true)
            view2.setSortView("유통기한 임박순",false)
            view3.setSortView("이름순",false)
            self.sortDelegate?.send(standard: "기본순 (최신순)")
        }
        return view1
    }()
    private lazy var view2  : SortBtn_CheckView = {
        let view2  = SortBtn_CheckView()
        view2.setSortView("유통기한 임박순",false)
        view2.tapBtnAction = { [unowned self] in
            view1.setSortView("기본순 (최신순)",false)
            view2.setSortView("유통기한 임박순",true)
            view3.setSortView("이름순",false)
            self.sortDelegate?.send(standard: "유통기한 임박순")
        }
        return view2
    }()
    private lazy var view3  : SortBtn_CheckView = {
        let view3  = SortBtn_CheckView()
        view3.setSortView("이름순",false)
        view3.tapBtnAction = { [unowned self] in
            view1.setSortView("기본순 (최신순)",false)
            view2.setSortView("유통기한 임박순",false)
            view3.setSortView("이름순",true)
            self.sortDelegate?.send(standard: "이름순")
        }
        return view3
    }()
    private lazy var cancelButton : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("닫기", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Bold.rawValue, size: 16)!]))
        config.baseForegroundColor = UIColor(named: "brownishgrey")
        config.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 0, bottom: 16, trailing: 0)
        let cancelButton = UIButton(configuration: config)
        cancelButton.backgroundColor = UIColor(named: "whitetwo")
        cancelButton.layer.cornerRadius = 8
        cancelButton.addTarget(self, action: #selector(tapDismiss), for: .touchUpInside)
        return cancelButton
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        setAutoLaout()
        self.view.backgroundColor = UIColor(named: "palegrey")
    }
}
extension SortModalVC {
    private func addSubView(){
        self.view.addSubview(explainLabel)
        self.view.addSubview(sortStackView)
        sortStackView.addStackSubViews([view1,view2,view3])
        self.view.addSubview(cancelButton)
    }
    private func setAutoLaout(){
        explainLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(17)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview()
        }
        explainLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        sortStackView.snp.makeConstraints { make in
            make.top.equalTo(explainLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        sortStackView.setContentHuggingPriority(.init(750), for: .vertical)
        cancelButton.snp.makeConstraints { make in
            make.top.equalTo(sortStackView.snp.bottom).offset(21)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-12)
        }
        cancelButton.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}
#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct SortModalVCPreview: PreviewProvider {
    static var previews: some View {
        SortModalVC().showPreview(.iPhone14Pro)
    }
}
#endif

