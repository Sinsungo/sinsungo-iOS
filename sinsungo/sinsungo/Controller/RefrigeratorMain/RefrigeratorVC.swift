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
}
class RefrigeratorVC: UIViewController {
    var groupName = "동진"
    //push 냉장고 detail 이름을 위해 정으
    var refName = "냉장고"
    private let sectionTitleTest : [String] = ["1번냉장고","2번냉장고"]
    private let sampleData : [IngredientFormat] = [IngredientFormat(ingredientName: "재료명1", ingredientCnt: 1, remainPeriod: 1),IngredientFormat(ingredientName: "재료명2", ingredientCnt: 2, remainPeriod: 2)]
//,"2번냉장고","3번냉장고","4번냉장고","5번냉장고","6번냉장고"
    private let cnt : [String] = ["\(2)","\(2)"] //재료개수
//,"\(2)","\(3)","\(4)","\(5)","\(6)"
    
    var refrigeratorTableView : UITableView = {
        let refrigeratorTableView = UITableView(frame: .zero, style: .grouped)
        refrigeratorTableView.bounces = false
        refrigeratorTableView.separatorColor = .clear
//MARK: - Section Setting
        refrigeratorTableView.register(RefirgeratorTVCell.self, forCellReuseIdentifier: RefirgeratorTVCell.identi)
        refrigeratorTableView.register(RefrigeratorTVH.self, forHeaderFooterViewReuseIdentifier: RefrigeratorTVH.identi)
        refrigeratorTableView.register(RefirgeratorTVF.self, forHeaderFooterViewReuseIdentifier: RefirgeratorTVF.identi)
        refrigeratorTableView.backgroundColor = UIColor(named: "palegrey")
        
        return refrigeratorTableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
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
        return sectionTitleTest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let refirgeratorTVC = tableView.dequeueReusableCell(withIdentifier: RefirgeratorTVCell.identi, for: indexPath) as? RefirgeratorTVCell else {return UITableViewCell()}
        
        refirgeratorTVC.setRefName(model: sectionTitleTest[indexPath.row])
        refirgeratorTVC.setigdCnt(model: cnt[indexPath.row])
        refirgeratorTVC.setIngredient(model: sampleData)
        refirgeratorTVC.contentView.layer.masksToBounds = true
        refirgeratorTVC.tapDetailButtonClosure = { [unowned self] in
            refName = sectionTitleTest[indexPath.row]
            pushRefIngredientVC(refNum: indexPath.row)
        
        }
        refirgeratorTVC.selectionStyle = .none
//        let radius = refirgeratorTVC.contentView.layer.cornerRadius
//        refirgeratorTVC.layer.shadowPath = UIBezierPath(roundedRect: refirgeratorTVC.bounds, cornerRadius: radius).cgPath
        return refirgeratorTVC
    }

    //MARK: - Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: RefrigeratorTVH.identi) as? RefrigeratorTVH else { return nil}
        
        headerView.setGroupNameLabel(model: groupName)
        return headerView
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
        self.view.addSubview(refrigeratorTableView)
        
    }
    private func autoLayout(){
        refrigeratorTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
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
    
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct RefrigeratorVCPreview: PreviewProvider {
    static var previews: some View {
        RefrigeratorVC().showPreview(.iPhone14Pro)
    }
}
#endif
