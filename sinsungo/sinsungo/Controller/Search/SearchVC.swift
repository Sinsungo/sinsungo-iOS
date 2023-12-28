//
//  SearchVC.swift
//  sinsungo
//
//  Created by 원동진 on 2023/03/02.
//

import UIKit
import SnapKit
class SearchVC: UIViewController{
    private lazy var searchController : UISearchController = {
        let searchController = UISearchController(searchResultsController: SearchResultVC())
        searchController.searchBar.placeholder = "검색할 내용을 입력해주세요."
        searchController.searchBar.setImage(UIImage(named: "cancelImg"), for: .clear, state: .normal)
        searchController.searchBar.setImage(UIImage(named: "searchImg"), for: .search, state: .normal)
        return searchController
    }()

    lazy var naviTitle : UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.black
        titleLabel.text = "검색하기"
        titleLabel.font = UIFont(name: CustomFont.ExtraBold.rawValue, size: 20)
        return titleLabel
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "palegrey")
        setSearchBar()
      
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
}
extension SearchVC :  UISearchControllerDelegate, UISearchBarDelegate {
    private func setSearchBar(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: naviTitle)
        self.navigationItem.searchController = searchController
        searchController.delegate = self
        searchController.searchBar.delegate = self
        searchController.searchBar.searchTextField.borderStyle = .none
        searchController.searchBar.searchTextField.backgroundColor = .white
        searchController.searchBar.searchTextField.layer.cornerRadius = 8
        searchController.searchBar.searchTextField.layer.borderColor = UIColor(named: "verylightpink")?.cgColor
        searchController.searchBar.searchTextField.layer.borderWidth = 1
        searchController.searchBar.setValue("취소", forKey: "cancelButtonText")
    }
}

