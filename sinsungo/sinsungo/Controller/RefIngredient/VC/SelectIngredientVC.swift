//
//  SelectIngredientVC.swift
//  sinsungo
//
//  Created by 원동진 on 2023/04/08.
//

import UIKit
//- 선택된 재료 삭제하기 VC
class SelectIngredientVC: UIViewController {
    var selectIng = [IndexPath]()
    let refIngredSampleDate : [IngredientFormat] = [IngredientFormat(ingredientName: "재료명1", ingredientCnt: 1, remainPeriod: 1, storageType: "유통기한", storageDate: "2022-03-22"),IngredientFormat(ingredientName: "재료명2", ingredientCnt: 2, remainPeriod: 2, storageType: "유통기한", storageDate: "2022-03-22"),IngredientFormat(ingredientName: "재료명3", ingredientCnt: 3, remainPeriod: 3, storageType: "유통기한", storageDate: "2022-03-22"),]
    private lazy var backButtonCustomm : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("선택하기", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.ExtraBold.rawValue, size: 20)!]))
        config.image = UIImage(named: "backImg")
        config.baseForegroundColor = .black
        config.imagePlacement = .leading
        config.imagePadding = 12
        let backButtonCustom = UIButton(configuration: config)
        backButtonCustom.addTarget(self, action: #selector(tapPop), for: .touchUpInside)
        return backButtonCustom
    }()
    private lazy var deleteIngredientButton : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("선택된 재료 삭제하기", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Bold.rawValue, size: 12)!]))
        config.baseForegroundColor = .white
        config.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0)
        let addIngredientButton = UIButton(configuration: config)
        addIngredientButton.backgroundColor = UIColor(named: "primarycolor")
        addIngredientButton.layer.cornerRadius = 4
        addIngredientButton.layer.masksToBounds = true
        addIngredientButton.addTarget(self, action: #selector(deleteIngBtnAction), for: .touchUpInside)
        return addIngredientButton
    }()
    private lazy var ingredientTableView : UITableView = {
        let ingredientTableView = UITableView(frame: .zero, style: .grouped)
        ingredientTableView.sectionHeaderHeight = CGFloat.leastNormalMagnitude
        ingredientTableView.sectionFooterHeight = CGFloat.leastNormalMagnitude
        ingredientTableView.backgroundColor = .blue
        ingredientTableView.bounces = false
        ingredientTableView.separatorColor = .clear
        ingredientTableView.backgroundColor = UIColor(named: "palegrey")
        ingredientTableView.allowsMultipleSelection = true
        ingredientTableView.register(SelectIngredientTVC.self, forCellReuseIdentifier: SelectIngredientTVC.identi)
        return ingredientTableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "palegrey")
        setNavigationBar()
        addSubView()
        setAutoLayout()
        setTableView()
    }

}
extension SelectIngredientVC : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let refIngredientTVC = tableView.dequeueReusableCell(withIdentifier: SelectIngredientTVC.identi, for: indexPath) as? SelectIngredientTVC else{ return UITableViewCell() }
        refIngredientTVC.setRefIngredient(model: refIngredSampleDate[indexPath.row])
        refIngredientTVC.contentView.layer.masksToBounds = true
        return refIngredientTVC
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return refIngredSampleDate.count
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return self.view.frame.height * 0.015
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedSection = tableView.indexPathsForSelectedRows else {return}
        selectIng = selectedSection
    }
}
extension SelectIngredientVC {
    private func addSubView(){
        self.view.addSubview(ingredientTableView)
        self.view.addSubview(deleteIngredientButton)
    }
    private func setAutoLayout(){
        ingredientTableView.snp.makeConstraints { make in
            make.top.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.left.equalTo(view.snp.left).offset(24)
            make.right.equalTo(view.snp.right).offset(-24)
        }
        deleteIngredientButton.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(16)
            make.right.equalTo(view.snp.right).offset(-16)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-12)
        }
    }
    private func setTableView(){
        ingredientTableView.delegate = self
        ingredientTableView.dataSource = self
    }
    @objc func deleteIngBtnAction(){
        print("\(selectIng)")
    }
    @objc func checkBtnAction(){
        
    }
    private func setNavigationBar(){
        self.navigationController?.navigationBar.isHidden = false
        let leftbuttonItem = UIBarButtonItem(customView: backButtonCustomm)
        let rightbuttonItem = UIBarButtonItem(image: UIImage(named: "blackCheckImg"), style: .plain, target: self, action: #selector(checkBtnAction))
        rightbuttonItem.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem = leftbuttonItem
        self.navigationItem.rightBarButtonItem = rightbuttonItem
        self.navigationController?.navigationBar.tintColor = .black
    }
}
#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct SelectIngredientVCPreview: PreviewProvider {
    static var previews: some View {
        SelectIngredientVC().showPreview(.iPhone14Pro)
    }
}
#endif

