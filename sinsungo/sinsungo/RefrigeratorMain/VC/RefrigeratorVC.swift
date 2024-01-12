//
//  RefrigeratorVC.swift
//  sinsungo
//
//  Created by 원동진 on 2023/01/20.
//

import UIKit
import SnapKit
//MARK: - 냉장고 메인
struct IngredientFormat  {
    let ingredientName : String
    let ingredientCnt : Int
    let remainPeriod : Int
    let storageType : String
    let storageDate : String
}
class RefrigeratorVC: UIViewController {
    var groupName = "동진"
    //push 냉장고 detail 이름을 위해 정으
    var refName = "냉장고"
    private var fridgeData : [Content] = []
    private lazy var groupNameLabel : UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "동진의 냉장고"
        nameLabel.textColor = UIColor.black
        nameLabel.font = UIFont(name: "NanumSquareOTF_acEB", size: 20)
        return nameLabel
    }()
    var refrigeratorTableView : UITableView = {
        let refrigeratorTableView = UITableView(frame: .zero, style: .grouped)
        refrigeratorTableView.bounces = false
        refrigeratorTableView.separatorColor = .clear
        refrigeratorTableView.sectionHeaderHeight = 0
        //MARK: - Section Setting
        refrigeratorTableView.register(RefirgeratorTVCell.self, forCellReuseIdentifier: RefirgeratorTVCell.identi)
        refrigeratorTableView.register(RefirgeratorTVF.self, forHeaderFooterViewReuseIdentifier: RefirgeratorTVF.identi)
        refrigeratorTableView.backgroundColor = UIColor(named: "palegrey")
        
        return refrigeratorTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getFridgeData()
        addSubView()
        autoLayout()
        configure()
        view.backgroundColor = UIColor(named: "palegrey")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
}

extension RefrigeratorVC : UITableViewDataSource,UITableViewDelegate {
    //MARK: - Cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fridgeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let refirgeratorTVC = tableView.dequeueReusableCell(withIdentifier: RefirgeratorTVCell.identi, for: indexPath) as? RefirgeratorTVCell else {return UITableViewCell()}
        refirgeratorTVC.setRefName(fridge: fridgeData[indexPath.row])
        refirgeratorTVC.setIngredient(ingredientList: fridgeData[indexPath.row].ingredientList)
        refirgeratorTVC.contentView.layer.masksToBounds = true
//        refirgeratorTVC.tapDetailButtonClosure = { [unowned self] in
//            refName = sectionTitleTest[indexPath.row]
//            pushRefIngredientVC(refNum: indexPath.row)

//        }
        refirgeratorTVC.tapAddIngredientButton = { [unowned self] in
            let pushVC = RefIngredientAddVC()
            pushVC.refNum = indexPath.row
            self.navigationController?.pushViewController(pushVC, animated: false)
            
        }
        refirgeratorTVC.selectionStyle = .none
        //        let radius = refirgeratorTVC.contentView.layer.cornerRadius
        //        refirgeratorTVC.layer.shadowPath = UIBezierPath(roundedRect: refirgeratorTVC.bounds, cornerRadius: radius).cgPath
        return refirgeratorTVC
    }
    
//    //MARK: - Header
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: RefrigeratorTVH.identi) as? RefrigeratorTVH else { return UIView()}
//
//        headerView.setGroupNameLabel(model: groupName)
//        return headerView
//    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }

    //MARK: - footer
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: RefirgeratorTVF.identi) as? RefirgeratorTVF else { return nil}
        footerView.tapAddRefClosure = { [unowned self] in
            
            presentModalAction()
        }
        return footerView
    }
    //MARK: - section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
extension RefrigeratorVC {
    private func configure(){
        refrigeratorTableView.delegate = self
        refrigeratorTableView.dataSource = self
        
    }
    private func addSubView(){
        self.view.addSubview(groupNameLabel)
        self.view.addSubview(refrigeratorTableView)
        
        
    }
    private func autoLayout(){
        groupNameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
        }
        refrigeratorTableView.snp.makeConstraints { make in
            make.top.equalTo(groupNameLabel.snp.bottom).offset(25)
            make.left.equalTo(view.snp.left).offset(11) //그림자 효과를 위해
            make.right.equalTo(view.snp.right).offset(-11) // 5씩 줄이고 -> TableView cell inset +5
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    private func presentModalAction(){
        let modalVC = AddRefModalVC()
        if let sheet = modalVC.sheetPresentationController {
            sheet.detents = [
                .custom{ _ in
                    //                    return self.view.frame.height * 0.25
                    return 184
                }
            ]
            sheet.preferredCornerRadius = 16
        }
        
        self.present(modalVC, animated: true)
    }
    private func pushRefIngredientVC(refNum : Int){
        let pushVC = RefIngredientVC()
        pushVC.refName = refName
        pushVC.refNum = refNum
        self.navigationController?.pushViewController(pushVC, animated: false)
    }
    private func getFridgeData(){
        GetFridgeManager.shared.getFridgeData(size: 3) { getFridgeData in
            self.fridgeData = getFridgeData.content
//            print(self.fridgeData)
            DispatchQueue.main.async {
                self.refrigeratorTableView.reloadData()
            }
        }
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct RefrigeratorVCPreview: PreviewProvider {
    static var previews: some View {
        RefrigeratorVC().showPreview(.iPhone14Pro)
    }
}
#endif
