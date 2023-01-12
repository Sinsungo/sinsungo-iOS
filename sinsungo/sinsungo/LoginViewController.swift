//
//  ViewController.swift
//  sinsungo
//
//  Created by 원동진 on 2022/12/03.
//

import UIKit
import SnapKit
import Firebase
import GoogleSignIn
class LoginViewController: UIViewController {
    
    let sinsungoLogo : UIImageView = {
        let sinUIImage = UIImageView()
        sinUIImage.image = UIImage(named: "SinsungoLogo")
        sinUIImage.contentMode = .scaleAspectFill
        return sinUIImage
    }()
    let firstStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        return stackView
    }()
    //MARK: - Kakao
    let KakaoLoginButton : UIButton = {
        let kakaoLoginButton = UIButton()
        kakaoLoginButton.backgroundColor = .yellow
        return kakaoLoginButton
    }()
    //MARK: - Google
    private lazy var googleLoginButton : UIButton = {
        var config = UIButton.Configuration.plain()
        config.imagePadding = 24
        var title = AttributedString.init("Google 계정으로 로그인")
        title.font = UIFont(name: "Roboto-Medium", size: 14)
        config.attributedTitle = title
        config.baseForegroundColor = UIColor(named: "GoogleColor")
        config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        let googleLoginButton = UIButton(configuration: config)
        
        googleLoginButton.setImage(UIImage(named: "GoogleLogo"), for: .normal)
        //MARK: -  config 사용시 위에 코드 실행안됨
        // 우선순위 setTitle이 높음
        //        googleLoginButton.setTitle("Google 계정으로 로그인", for: .normal)
        //        googleLoginButton.setTitleColor(UIColor(named: "GoogleColor"), for: .normal)
        //        googleLoginButton.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 14)
        
        googleLoginButton.backgroundColor = .white
        googleLoginButton.layer.cornerRadius = 7
        googleLoginButton.layer.shadowColor = UIColor.lightGray.cgColor
        googleLoginButton.layer.shadowOpacity = 1.0
        googleLoginButton.layer.shadowRadius = 8
        //MARK: - action
        googleLoginButton.addTarget(self, action: #selector(tapGoogle), for: .touchUpInside)
        return googleLoginButton
        
    }()
    
    //MARK: - apple
    let appleLoginButton : UIButton = {
        var appleLoginButton = UIButton()
        appleLoginButton.backgroundColor = .gray
        return appleLoginButton
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setView()
        setStackView()
        setAutoLayout()
        
    }
    func setStackView(){
        firstStackView.addArrangedSubview(KakaoLoginButton)
        firstStackView.addArrangedSubview(googleLoginButton)
        firstStackView.addArrangedSubview(appleLoginButton)
    }
    func setView(){
        self.view.addSubview(sinsungoLogo)
        self.view.addSubview(firstStackView)
        //        self.view.addSubview(googleLoginButton)
    }
    func setAutoLayout(){
        sinsungoLogo.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(80)
            make.size.equalTo(CGSize(width: 230, height: 300))
            make.bottom.equalTo(firstStackView.snp.top)
            make.centerX.equalToSuperview()
        }
        [KakaoLoginButton,googleLoginButton,appleLoginButton].forEach { UIButton in
            UIButton.snp.makeConstraints { make in
                make.height.equalTo(54)
            }
        }
        firstStackView.snp.makeConstraints { make in
            //            make.centerX.equalToSuperview()
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(25)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-25)
            
        }
    }
    //MARK: - UI action
    @objc func tapGoogle(){
        let vc = TestViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        //        guard let clientID = FirebaseApp.app()?.options.clientID else {return}
        //        let config = GIDConfiguration(clientID: clientID)
        //        GIDSignIn.sharedInstance.signIn(with: config, presenting: self){ [unowned self] user, error in
        //            if let error = error {
        //                print("ERROR", error.localizedDescription)
        //                return
        //            }
        //            guard let authentication = user?.authentication,
        //                  let idToken = authentication.idToken else { return }
        //
        //            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
        //
        //            Auth.auth().signIn(with: credential) { _, _ in
        //
        //                self.present(TestViewController(), animated: true)
        //            }
        //        }
        
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
