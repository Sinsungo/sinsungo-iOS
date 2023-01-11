//
//  ViewController.swift
//  sinsungo
//
//  Created by 원동진 on 2022/12/03.
//

import UIKit
import SnapKit
class LoginViewController: UIViewController {
    
    let sinsungoLogo : UIImageView = {
        let sinUIImage = UIImageView()
        sinUIImage.image = UIImage(named: "SinsungoLogo")
        sinUIImage.contentMode = .scaleAspectFill
        return sinUIImage
    }()
    let googleLoginButton : UIButton = {
        var config = UIButton.Configuration.plain()
        config.imagePadding = 24
        var title = AttributedString.init("Google 계정으로 로그인")
        title.font = UIFont(name: "Roboto-Medium", size: 14)
        config.attributedTitle = title
        config.baseForegroundColor = UIColor(named: "GoogleColor")
        config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        
        let googleLoginButton = UIButton(configuration: config)
        googleLoginButton.setImage(UIImage(named: "GoogleLogo"), for: .normal)
// 우선순위 setTitle이 높음
//        googleLoginButton.setTitle("Google 계정으로 로그인", for: .normal)
//        googleLoginButton.setTitleColor(UIColor(named: "GoogleColor"), for: .normal)
//        googleLoginButton.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 14)
//MARK: config 사용시 위에 코드 실행안됨
        googleLoginButton.backgroundColor = .white
        googleLoginButton.layer.cornerRadius = 7
        googleLoginButton.layer.shadowColor = UIColor.lightGray.cgColor
        googleLoginButton.layer.shadowOpacity = 1.0
        googleLoginButton.layer.shadowRadius = 8
        return googleLoginButton
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setView()
        setAutoLayout()

    }
    func setView(){
        self.view.addSubview(sinsungoLogo)
        self.view.addSubview(googleLoginButton)
    }
    func setAutoLayout(){
        sinsungoLogo.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(50)
            make.size.equalTo(CGSize(width: 230, height: 300))
            make.centerX.equalToSuperview()   
        }
        googleLoginButton.snp.makeConstraints { make in
            make.bottom.equalTo(sinsungoLogo).offset(50)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
    
        }
   
    }
 
}

import SwiftUI
@available(iOS 13.0.0, *)
struct LoginViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = LoginViewController
    
    func makeUIViewController(context: Context) -> LoginViewController {
        return LoginViewController()
    }
    
    func updateUIViewController(_ uiViewController: LoginViewController, context: Context) {
    }
}
struct ViewPreview: PreviewProvider {
    static var previews: some View {
        LoginViewControllerRepresentable()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            .previewDisplayName("iPhone 14 Pro")
    }
}
