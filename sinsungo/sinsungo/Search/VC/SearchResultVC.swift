//
//  SearchResultVC.swift
//  sinsungo
//
//  Created by 원동진 on 2023/11/28.
//

import UIKit

class SearchResultVC: UIViewController {
    private lazy var searchResultTableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.bounces = false
        tableView.register(SearchRefResultTVC.self, forCellReuseIdentifier: SearchRefResultTVC.identi)
        tableView.register(SearchBasketTVC.self, forCellReuseIdentifier: SearchBasketTVC.identi)
        tableView.separatorColor = .clear
        tableView.backgroundColor = UIColor(named: "palegrey")
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        addSubViews()
        setAutoLayout()

    }
    
    
}
extension SearchResultVC {
    private func configure(){
        searchResultTableView.delegate = self
        searchResultTableView.dataSource = self
    }
    private func addSubViews(){
        view.addSubview(searchResultTableView)
    }
    private func setAutoLayout(){
        searchResultTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalTo(view.snp.left).offset(11)
            make.right.equalTo(view.snp.right).offset(-11)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
extension SearchResultVC : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier:SearchRefResultTVC.identi , for: indexPath) as? SearchRefResultTVC else {return UITableViewCell()}
//            cell.tapRefDetailRefBtnClosure = { [unowned self] in
//         
//            }
            return cell
        }else if indexPath.section == 1{
            guard let cell = tableView.dequeueReusableCell(withIdentifier:SearchBasketTVC.identi , for: indexPath) as? SearchBasketTVC else {return UITableViewCell()}
            cell.tapDetailBasketBtnClosure = { [unowned self] in
                let pushVC = TapDetailBasketVC()
                self.presentingViewController?.navigationController?.pushViewController(pushVC, animated: false)
            }
            return cell
        }
        
        return UITableViewCell()
    }
//MARK: - 간격을 위함
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        return view
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 10
        }
        return 1
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 11
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        return view
    }
  
    
}
#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct SearchResultVCPreview: PreviewProvider {
    static var previews: some View {
        SearchResultVC().showPreview(.iPhone14Pro)
    }
}
#endif
