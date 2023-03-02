//
//  MainTabBarVC.swift
//  sinsungo
//
//  Created by 원동진 on 2023/03/02.
//

import UIKit

class MainTabBarVC: UITabBarController {
    let firstNC = UINavigationController.init(rootViewController: RefrigeratorVC())
    let secondNC = UINavigationController.init(rootViewController: SearchVC())
    let thirdNC = UINavigationController.init(rootViewController: ShopBasketVC())
    let fourthNC = UINavigationController.init(rootViewController: MyProfileVC())
    let firstTabBarItem = UITabBarItem(title: "냉장고", image: UIImage(named: "refImg"), tag: 0)
    let secondTabBarItem = UITabBarItem(title: "검색", image: UIImage(named: "searchImg"), tag: 1)
    let thirdTabBarItem = UITabBarItem(title: "장바구니", image: UIImage(named: "basketImg"), tag: 2)
    let fourthTabBarItem = UITabBarItem(title: "내 정보", image: UIImage(named: "myprofileImg"), tag: 3)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setNCinit()
        self.tabBar.tintColor = UIColor(named: "primarycolor")
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    func setNCinit(){
        self.viewControllers = [firstNC,secondNC,thirdNC,fourthNC]
        firstNC.tabBarItem = firstTabBarItem
        secondNC.tabBarItem = secondTabBarItem
        thirdNC.tabBarItem = thirdTabBarItem
        fourthNC.tabBarItem = fourthTabBarItem
    }

}
