//
//  SortModalVC.swift
//  sinsungo
//
//  Created by 원동진 on 2023/03/27.
//

import UIKit
import SnapKit
class SortModalVC: UIViewController {
    let sortArr = ["기본순 (최신순)","유통기한 임박순","이름순"]
    weak var sortDelegate : sortVCDelegate?
    var standard = "기본순 (최신순)"
    private lazy var explainLabel : UILabel = {
        let explainLabel = UILabel()
        explainLabel.text = "정렬 기준을 선택해주세요."
        explainLabel.textColor = .black
        explainLabel.font = UIFont(name: CustomFont.Bold.rawValue, size: 16)
        return explainLabel
    }()
 

    private lazy var checkTableView : UITableView = {
        let checkTableView = UITableView(frame: .zero, style: .plain)
        checkTableView.bounces = false
        checkTableView.separatorColor = .clear
        checkTableView.backgroundColor = UIColor(named: "palegrey")
        checkTableView.register(SortModalTVCell.self, forCellReuseIdentifier: SortModalTVCell.identi)
        return checkTableView
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
        setCell()
        self.view.backgroundColor = UIColor(named: "palegrey")
    }
}
extension SortModalVC {
    private func addSubView(){
        self.view.addSubview(explainLabel)
        self.view.addSubview(checkTableView)
        self.view.addSubview(cancelButton)
    }
    private func setAutoLaout(){
        explainLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(17)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview()
        }
        explainLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        checkTableView.snp.makeConstraints { make in
            make.top.equalTo(explainLabel.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        checkTableView.setContentHuggingPriority(.init(750), for: .vertical)
        cancelButton.snp.makeConstraints { make in
            make.top.equalTo(checkTableView.snp.bottom).offset(21)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-12)
        }
        cancelButton.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
    private func setCell(){
        checkTableView.delegate = self
        checkTableView.dataSource = self
    }

}
extension SortModalVC : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sortModalTVC = tableView.dequeueReusableCell(withIdentifier: SortModalTVCell.identi, for: indexPath) as? SortModalTVCell else { return UITableViewCell()}
        sortModalTVC.setLabel(model: sortArr[indexPath.section])
        return sortModalTVC
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return sortArr.count
    }
//MARK: - 간격을 주기 위함
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 15
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            standard = "기본순 (최신순)"
        case 1:
            standard = "유통기한 임박순"
        case 2:
            standard = "이름순"
        default:
            standard = "기본순 (최신순)"
        }
        self.sortDelegate?.send(standard: self.standard)
        self.presentingViewController?.dismiss(animated: true)
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

