//
//  RefrigeratorVC.swift
//  sinsungo
//
//  Created by 원동진 on 2023/01/20.
//

import UIKit
import SnapKit
class RefrigeratorVC: UIViewController {
    var groupName = "동진"
    private let sectionTitleTest : [String] = ["1번냉장고","2번냉장고","3번냉장고","4번냉장고","5번냉장고","6번냉장고"]
    private let cnt : [String] =
    ["\(1)","\(2)","\(3)","\(4)","\(5)","\(6)"]
    var refrigeratorTableView : UITableView = {
        let refrigeratorTableView = UITableView(frame: .zero, style: .grouped)
        refrigeratorTableView.bounces = false
        refrigeratorTableView.separatorColor = .white
        refrigeratorTableView.backgroundColor = .clear
//        refrigeratorTableView.subviews.forEach {view in
//            refrigeratorTableView.subviews.forEach { view in
//                view.layer.shadowColor = UIColor.darkGray.cgColor
//                view.layer.shadowOpacity = 0.4
//                view.layer.shadowOffset = .zero
//                view.layer.shadowRadius = 3
//            }
//        }
        //MARK: - Section Setting
        refrigeratorTableView.register(RefirgeratorTVCell.self, forCellReuseIdentifier: RefirgeratorTVCell.identi)
        refrigeratorTableView.register(RefrigeratorTVH.self, forHeaderFooterViewReuseIdentifier: RefrigeratorTVH.identi)
        refrigeratorTableView.register(RefirgeratorTVF.self, forHeaderFooterViewReuseIdentifier: RefirgeratorTVF.identi)
        refrigeratorTableView.backgroundColor = UIColor(named: "palegrey")
        
        return refrigeratorTableView
    }()
    var groupNameLabel : UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 20)
        return nameLabel
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        groupNameLabel.text = "{\(groupName)}의 냉장고"
        addSubView()
        autoLayout()
        configure()
        view.backgroundColor = UIColor(named: "palegrey")
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
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            //컴펌 필요
            make.left.equalTo(view.snp.left).offset(16)
            make.right.equalTo(view.snp.right).offset(-16)
            
        }
        refrigeratorTableView.snp.makeConstraints { make in
            make.top.equalTo(groupNameLabel.snp.bottom).offset(23)
            make.left.equalTo(view.snp.left).offset(16)
            make.right.equalTo(view.snp.right).offset(-16)
            make.bottom.equalTo(view.snp.bottom).offset(0)
        }
    }
}

extension RefrigeratorVC : UITableViewDataSource,UITableViewDelegate {
    //MARK: - Cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let refirgeratorTVC = tableView.dequeueReusableCell(withIdentifier: RefirgeratorTVCell.identi, for: indexPath) as! RefirgeratorTVCell
        return refirgeratorTVC
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 46
    }
    //MARK: - Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
   
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: RefrigeratorTVH.identi) as? RefrigeratorTVH else { return nil}
        headerView.setRefrigeratorname(model :sectionTitleTest[section] )
        headerView.setIngredientCnt(model: cnt[section])
//        headerView.roundCorners(cornerRadius: 4 , maskedCorners: [.layerMinXMinYCorner,.layerMaxXMinYCorner])
        return headerView
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitleTest.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 24
    }
    //MARK: - footer
    //    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    //        guard let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: RefirgeratorTVF.identi) as? RefirgeratorTVF else { return nil}
    //        return footerView
    //    }
    
    
}




import SwiftUI
@available(iOS 13.0.0, *)
struct RefrigeratorVCRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = RefrigeratorVC
    
    func makeUIViewController(context: Context) -> RefrigeratorVC {
        return RefrigeratorVC()
    }
    
    func updateUIViewController(_ uiViewController: RefrigeratorVC, context: Context) {
    }
}
struct RefrigeratorVCPreview: PreviewProvider {
    static var previews: some View {
        RefrigeratorVCRepresentable()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            .previewDisplayName("iPhone 14 Pro")
    }
}
