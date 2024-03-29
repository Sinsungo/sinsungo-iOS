//
//  RefIngredientVC.swift
//  sinsungo
//
//  Created by 원동진 on 2023/03/24.
//

import UIKit
import SnapKit
//MARK: - 냉장고 재료
struct RefIngredientFormat {
    let ingredientName : String
    let ingredientCnt : Int
    let storageType : String
    let storageDate : String
}
protocol sortVCDelegate : AnyObject {
    func send(standard: String)
}
protocol expireVCDelegate : AnyObject {
    func send(expireDate: String)
}
class RefIngredientVC: UIViewController {
    
    var refNum : Int = 0
    // 냉장고 번호 첫시작 번호 -> 0
    var refName : String = "{냉장고 이름}"
    var sortStandard : String = "기본순 (최신순)"
    var exipireDate : String = "유통기한"
    let refIngredSampleDate : [IngredientFormat] = [IngredientFormat(ingredientName: "재료명1", ingredientCnt: 1, remainPeriod: 1, storageType: "유통기한", storageDate: "2022-03-22"),IngredientFormat(ingredientName: "재료명2", ingredientCnt: 2, remainPeriod: 2, storageType: "유통기한", storageDate: "2022-03-22"),IngredientFormat(ingredientName: "재료명3", ingredientCnt: 3, remainPeriod: 3, storageType: "유통기한", storageDate: "2022-03-22")]
    private lazy var ingredientTableView : UITableView = {
        let ingredientTableView = UITableView(frame: .zero, style: .grouped)
        ingredientTableView.sectionHeaderHeight = CGFloat.leastNormalMagnitude
        ingredientTableView.sectionFooterHeight = CGFloat.leastNormalMagnitude
        ingredientTableView.backgroundColor = .blue
        ingredientTableView.bounces = false
        ingredientTableView.separatorColor = .clear
        ingredientTableView.backgroundColor = UIColor(named: "palegrey")
        ingredientTableView.register(RefIngredientTVCell.self, forCellReuseIdentifier: RefIngredientTVCell.identi)
        ingredientTableView.register(RefIngredientTVH.self, forHeaderFooterViewReuseIdentifier: RefIngredientTVH.identi)
        
        return ingredientTableView
    }()
    private lazy var backButtonCustomm : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("\(refName)", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.ExtraBold.rawValue, size: 20)!]))
        config.image = UIImage(named: "backImg")
        config.baseForegroundColor = .black
        config.imagePlacement = .leading
        config.imagePadding = 12
        let backButtonCustom = UIButton(configuration: config)
        backButtonCustom.addTarget(self, action: #selector(tapPop), for: .touchUpInside)
        return backButtonCustom
    }()
    private lazy var addIngredientButton : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("재료 추가하기", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Bold.rawValue, size: 12)!]))
        config.baseForegroundColor = .white
        config.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0)
        let addIngredientButton = UIButton(configuration: config)
        addIngredientButton.backgroundColor = UIColor(named: "primarycolor")
        addIngredientButton.layer.cornerRadius = 4
        addIngredientButton.layer.masksToBounds = true
        addIngredientButton.addTarget(self, action: #selector(tapAddIngredientBtn), for: .touchUpInside)
        return addIngredientButton
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "palegrey")
        addSubView()
        setAutoLayout()
        setTableView()
        longTapTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBar()
        RefIngredientTVCell().selectVC = false
    }
    
}
extension RefIngredientVC : UITableViewDelegate ,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return refIngredSampleDate.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let refIngredientTVC = tableView.dequeueReusableCell(withIdentifier: RefIngredientTVCell.identi, for: indexPath) as? RefIngredientTVCell else{ return UITableViewCell() }
        refIngredientTVC.setRefIngredient(model: refIngredSampleDate[indexPath.section])
        refIngredientTVC.contentView.layer.masksToBounds = true
        return refIngredientTVC
    }
    //MARK: - Header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 62
        }else{
            return CGFloat.leastNormalMagnitude
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: RefIngredientTVH.identi) as? RefIngredientTVH else { return nil}
            headerView.setSortButton(sortStandard: sortStandard)
            headerView.setExpireButton(expireDate : exipireDate)
            headerView.tapSortButtonClosure = { [unowned self] in
                let modalVC = SortModalVC()
                presentModal(vc: modalVC, height: 242)
                modalVC.sortDelegate = self
                
            }
            headerView.tapExpireButtonClosure = { [unowned self] in
                let modalVC = ExpireDateModalVC()
                presentModal(vc: modalVC, height: 220)
                modalVC.expireDelegate = self
            }
            
            return headerView
        }
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return self.view.frame.height * 0.015
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pushVC = RefingredientReadVC()
        pushVC.refNum = self.refNum
        self.navigationController?.pushViewController(pushVC, animated: true)
        
    }
    
    
}
extension RefIngredientVC {
    private func addSubView(){
        self.view.addSubview(ingredientTableView)
        self.view.addSubview(addIngredientButton)
    }
    private func setAutoLayout(){
        ingredientTableView.snp.makeConstraints { make in
            make.top.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.left.equalTo(view.snp.left).offset(24)
            make.right.equalTo(view.snp.right).offset(-24)
        }
        addIngredientButton.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(16)
            make.right.equalTo(view.snp.right).offset(-16)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-12)
        }
    }
    private func setTableView(){
        ingredientTableView.delegate = self
        ingredientTableView.dataSource = self
    }
    private func setNavigationBar(){
        self.navigationController?.navigationBar.isHidden = false
        let leftbuttonItem = UIBarButtonItem(customView: backButtonCustomm)
        let rightbuttonItem = UIBarButtonItem(image: UIImage(named: "settingImg"), style: .plain, target: self, action: #selector(tapSettingButton))
        self.navigationItem.leftBarButtonItem = leftbuttonItem
        self.navigationItem.rightBarButtonItem = rightbuttonItem
        self.navigationController?.navigationBar.tintColor = .black
    }

    @objc private func tapSettingButton(){
    }
    @objc func tapAddIngredientBtn(){
        let pushVC = RefIngredientAddVC()
        pushVC.refNum = refNum
        self.navigationController?.pushViewController(pushVC, animated: false)
    }
    private func longTapTableView(){
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(tableViewlongPress(_:)))
        ingredientTableView.addGestureRecognizer(longPressRecognizer)
    }
    @objc private func tableViewlongPress(_ gestureRecognizer : UILongPressGestureRecognizer){
        if gestureRecognizer.state == .began {
            let pushVC = SelectIngredientVC()
            self.navigationController?.pushViewController(pushVC, animated: false)
        }
    }
}
extension RefIngredientVC : sortVCDelegate {
    func send(standard: String) {
        self.sortStandard = standard
        ingredientTableView.reloadData()
    }
}
extension RefIngredientVC : expireVCDelegate{
    func send(expireDate: String) {
        self.exipireDate = expireDate
        ingredientTableView.reloadData()
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct RefIngredientVCPreview: PreviewProvider {
    static var previews: some View {
        RefIngredientVC().showPreview(.iPhone14Pro)
    }
}
#endif

