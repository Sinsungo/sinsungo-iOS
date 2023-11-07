//
//  MyProfileVC.swift
//  sinsungo
//
//  Created by 원동진 on 2023/03/02.
//

import UIKit
import SnapKit
class MyProfileVC: UIViewController {
    let userName = "동진"
    let myProfileList = ["공지사항","도움말","오픈소스 사용","법적고지","개발자와 연락하기","로그아웃","회원탈퇴"]
    private let explainVCLabel : UILabel = {
       let uiLabel = UILabel()
        uiLabel.text = "내 정보"
        uiLabel.textColor = .black
        uiLabel.textAlignment = .left
        uiLabel.font = UIFont(name: CustomFont.ExtraBold.rawValue, size: 20)
        return uiLabel
    }()
    private lazy var userNameView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    private lazy var userNameLabel : UILabel = {
        let label = UILabel()
        label.text = userName
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont(name: CustomFont.Bold.rawValue, size: 16)
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setAutoLayout()
        configure()
        view.backgroundColor = UIColor(named: "palegrey")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    var myProfileTableView : UITableView = {
        let refrigeratorTableView = UITableView(frame: .zero, style: .plain)
        refrigeratorTableView.bounces = false
        refrigeratorTableView.separatorColor = .clear
        refrigeratorTableView.register(MyProfileTVC.self, forCellReuseIdentifier: MyProfileTVC.identi)
        refrigeratorTableView.backgroundColor = UIColor(named: "palegrey")
        
        return refrigeratorTableView
    }()

}
extension MyProfileVC {
    private func configure(){
        myProfileTableView.delegate = self
        myProfileTableView.dataSource = self
    }
    private func addSubViews(){
        self.view.addSubViews([explainVCLabel,userNameView,myProfileTableView])
        userNameView.addSubview(userNameLabel)
    }
    private func setAutoLayout(){
        explainVCLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.left.equalTo(self.view.safeAreaLayoutGuide).offset(24)
            make.right.equalTo(self.view.safeAreaLayoutGuide)
        }
        userNameView.snp.makeConstraints { make in
            make.top.equalTo(explainVCLabel.snp.bottom).offset(30)
            make.left.equalTo(self.view.safeAreaLayoutGuide).offset(16)
            make.right.equalTo(self.view.safeAreaLayoutGuide).offset(-16)
        }
        userNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(18)
            make.bottom.equalToSuperview().offset(-18)
            make.left.equalToSuperview().offset(18)
            make.right.equalToSuperview().offset(18)
        }
        myProfileTableView.snp.makeConstraints { make in
            make.top.equalTo(userNameView.snp.bottom).offset(10)
            make.left.equalTo(self.view.safeAreaLayoutGuide)
            make.right.equalTo(self.view.safeAreaLayoutGuide)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
}
extension MyProfileVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myProfileList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyProfileTVC.identi, for: indexPath) as? MyProfileTVC else {return UITableViewCell()}
        cell.setProfileCell(model: myProfileList[indexPath.row])
        if indexPath.row >= 4{
            cell.setHiddenPushImg(hidden: true)
        }
        return cell
    }
    
    
}
