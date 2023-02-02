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
        refrigeratorTableView.backgroundColor = UIColor(named: "palegrey")
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

    override func viewDidLoad() {
        super.viewDidLoad()
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
        self.view.addSubview(refrigeratorTableView)
        
    }
    private func autoLayout(){
        refrigeratorTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalTo(view.snp.left).offset(11) //그림자 효과를 위해
            make.right.equalTo(view.snp.right).offset(-11) // 5씩 줄이고 -> TableView cell inset +5
            make.bottom.equalTo(view.snp.bottom).offset(0) // 5씩 줄였기 때문에 상단 UILabel +5 오른쪽으로밀어야함
        }
    }
}

extension RefrigeratorVC : UITableViewDataSource,UITableViewDelegate {
    //MARK: - Cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionTitleTest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let refirgeratorTVC = tableView.dequeueReusableCell(withIdentifier: RefirgeratorTVCell.identi, for: indexPath) as! RefirgeratorTVCell
        
        refirgeratorTVC.setRefName(model: sectionTitleTest[indexPath.row])
        refirgeratorTVC.setigdCnt(model: cnt[indexPath.row])
        refirgeratorTVC.contentView.layer.masksToBounds = true
//        let radius = refirgeratorTVC.contentView.layer.cornerRadius
//        refirgeratorTVC.layer.shadowPath = UIBezierPath(roundedRect: refirgeratorTVC.bounds, cornerRadius: radius).cgPath
        return refirgeratorTVC
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    //MARK: - Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: RefrigeratorTVH.identi) as? RefrigeratorTVH else { return nil}
            
            headerView.setGroupNameLabel(model: groupName)
            return headerView
        }
        return UIView()
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 45
        }
        return 1
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
