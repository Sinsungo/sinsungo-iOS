//
//  ShopBasketVC.swift
//  sinsungo
//
//  Created by 원동진 on 2023/03/02.
//

import UIKit
struct BasketInfo{
    let name : String
    let memo : String?
    let cnt : Int
}
class ShopBasketVC: UIViewController {
    let sampleData : [BasketInfo] = [BasketInfo(name: "재료명", memo: nil, cnt: 1),BasketInfo(name: "재료명", memo: "사용자가 입력한 메모내용이 존재항 경우 노출됩니다.", cnt: 2),BasketInfo(name: "재료명", memo: nil, cnt: 3),BasketInfo(name: "재료명", memo: "사용자가 입력한 메모내용이 존재항 경우 노출됩니다.\n사용자가 입력한 메모내용이 존재항 경우 노출됩니다.", cnt: 4)]
    var groupName = "동진"
    private lazy var basketTableView : UITableView = {
        let basketTableView = UITableView(frame: .zero, style: .plain)
        basketTableView.bounces = false
        basketTableView.separatorColor = .clear
        basketTableView.register(ShopBasketTVC.self, forCellReuseIdentifier: ShopBasketTVC.identi)
        basketTableView.register(ShopBasketTVH.self, forHeaderFooterViewReuseIdentifier: ShopBasketTVH.identi)
        basketTableView.backgroundColor = UIColor(named: "palegrey")
        basketTableView.sectionHeaderTopPadding = 0
        return basketTableView
    }()
    private lazy var addBasketBtn : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("장바구니에 추가하기", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Bold.rawValue, size: 12)!]))
        config.baseForegroundColor = .white
        config.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0)
        let addBasketBtn = UIButton(configuration: config)
        addBasketBtn.backgroundColor = UIColor(named: "primarycolor")
        addBasketBtn.layer.cornerRadius = 4
        addBasketBtn.layer.masksToBounds = true
        
        return addBasketBtn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "palegrey")
        configure()
        addSubViews()
        autoLayout()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
}
extension ShopBasketVC {
    private func configure(){
        basketTableView.delegate = self
        basketTableView.dataSource = self
    }
    private func addSubViews(){
        self.view.addSubview(basketTableView)
        self.view.addSubview(addBasketBtn)
    }
    private func autoLayout(){
        basketTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalTo(view.snp.left).offset(11)
            make.right.equalTo(view.snp.right).offset(-11)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        addBasketBtn.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(12)
            make.right.equalTo(view.snp.right).offset(-12)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-12)
        }
    }
}
extension ShopBasketVC : UITableViewDelegate , UITableViewDataSource{
//MARK: - CEll
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return sampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShopBasketTVC.identi, for: indexPath) as? ShopBasketTVC else{ return UITableViewCell()}
        cell.setBasketInfo(model: sampleData[indexPath.section])
        
        return cell
    }
//MARK: - Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ShopBasketTVH.identi) as? ShopBasketTVH else { return UIView()}
            headerView.setGroupNameLabel(model: groupName)
            return headerView
        }
        
       return UIView()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section != 0 {
            return 10
        }
        return tableView.sectionHeaderHeight
    }


}
#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct ShopBasketVCPreview: PreviewProvider {
    static var previews: some View {
        ShopBasketVC().showPreview(.iPhone14Pro)
    }
}
#endif
