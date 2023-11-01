//
//  UnitModalVC.swift
//  sinsungo
//
//  Created by 원동진 on 2023/10/31.
//

import UIKit

class UnitModalVC: UIViewController {
    let unitArr = ["개수", "ml", "L", "kg", "g" ]
    var unitStandard = "개수"
    var unitVCDelegate : UnitDelegate?
    var unitVCDelegateUpdate : UnitDelegateUpdate?
    private lazy var explainLabel : UILabel = {
        let explainLabel = UILabel()
        explainLabel.text = "분류 기준을 선택해주세요."
        explainLabel.textColor = .black
        explainLabel.font = UIFont(name: CustomFont.Bold.rawValue, size: 16)
        return explainLabel
    }()
    private lazy var checkTableView : UITableView = {
        let checkTableView = UITableView(frame: .zero, style: .plain)
        checkTableView.bounces = false
        checkTableView.separatorColor = .clear
        checkTableView.backgroundColor = UIColor(named: "palegrey")
        checkTableView.register(SelectedModalTVCell.self, forCellReuseIdentifier: SelectedModalTVCell.identi)
        return checkTableView
    }()
   
    private lazy var selectBtn : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("확인", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Bold.rawValue, size: 16)!]))
        config.baseForegroundColor = UIColor(named: "brownishgrey")
        config.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 0, bottom: 16, trailing: 0)
        let selectBtn = UIButton(configuration: config)
        selectBtn.backgroundColor = UIColor(named: "whitetwo")
        selectBtn.layer.cornerRadius = 8
        selectBtn.addTarget(self, action: #selector(tapSelectUnit), for: .touchUpInside)
        return selectBtn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        setAutoLaout()
        setCell()
        self.view.backgroundColor = UIColor(named: "palegrey")
    }
    
}
extension UnitModalVC {
    private func addSubView(){
        self.view.addSubview(explainLabel)
        self.view.addSubview(checkTableView)
        self.view.addSubview(selectBtn)
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
        selectBtn.snp.makeConstraints { make in
            make.top.equalTo(checkTableView.snp.bottom).offset(21)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-12)
        }
        selectBtn.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
    private func setCell(){
        checkTableView.delegate = self
        checkTableView.dataSource = self
    }
    @objc func tapSelectUnit(){
        unitVCDelegate?.sendUnit(standard: unitStandard)
        unitVCDelegateUpdate?.sendUnit(standard: unitStandard)
        self.dismiss(animated: true)
    }

}
extension UnitModalVC : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sortModalTVC = tableView.dequeueReusableCell(withIdentifier: SelectedModalTVCell.identi, for: indexPath) as? SelectedModalTVCell else { return UITableViewCell()}
        sortModalTVC.setLabel(model: unitArr[indexPath.section])
        return sortModalTVC
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return unitArr.count
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
        self.unitStandard = unitArr[indexPath.section]
    }

}
#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct UnitModalVCPreview : PreviewProvider {
    static var previews: some View {
        UnitModalVC().showPreview(.iPhone14Pro)
    }
}
#endif

