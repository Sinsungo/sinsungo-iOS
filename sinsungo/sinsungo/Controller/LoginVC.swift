//
//  ViewController.swift
//  sinsungo
//
//  Created by 원동진 on 2022/12/03.
//

//import UIKit
//import SnapKit
//import Firebase
//import GoogleSignIn
//class LoginVC: UIViewController {
//    
//    let sinsungoLogo : UIImageView = {
//        let sinUIImage = UIImageView()
//        sinUIImage.image = UIImage(named: "SinsungoLogo")
//        sinUIImage.contentMode = .scaleAspectFill
//        return sinUIImage
//    }()
//    let firstStackView : UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.alignment = .fill
//        stackView.distribution = .fillEqually
//        stackView.spacing = 15
//        return stackView
//    }()
//    //MARK: - Kakao
//
//    private lazy var KakaoLoginButton : UIButton = {
//        var config = UIButton.Configuration.plain()
//        config.image = UIImage(named: "KakaoButton")
//        var title = AttributedString.init("")
//        let kakaoLoginButton = UIButton(configuration: config)
//        kakaoLoginButton.addTarget(self, action: #selector(tapKakao), for: .touchUpInside)
//        return kakaoLoginButton
//    }()
//    //MARK: - Google
//    private lazy var googleLoginButton : UIButton = {
//        var config = UIButton.Configuration.plain()
//        config.imagePadding = 24
//        var title = AttributedString.init("Sign in with Google")
//        title.font = UIFont(name: "Roboto-Medium", size: 18)
////        title.font = UIFont.boldSystemFont(ofSize: 18)
//        config.attributedTitle = title
//        config.baseForegroundColor = UIColor(named: "GoogleColor")
//        config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
//        let googleLoginButton = UIButton(configuration: config)
//        googleLoginButton.setImage(UIImage(named: "GoogleLogo"), for: .normal)
//        //MARK: - 우선순위 setTitle이 높음으로 config 사용시 위에 위에 해당하는 config관련 코드 실행불가
//        //        googleLoginButton.setTitle("Google 계정으로 로그인", for: .normal)
//        //        googleLoginButton.setTitleColor(UIColor(named: "GoogleColor"), for: .normal)
//        //        googleLoginButton.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 14)
//        
//        googleLoginButton.backgroundColor = .white
//        googleLoginButton.layer.cornerRadius = 7
//        googleLoginButton.layer.shadowColor = UIColor.lightGray.cgColor
//        googleLoginButton.layer.shadowOpacity = 1.0
//        googleLoginButton.layer.shadowRadius = 8
//        //MARK: - action
//        googleLoginButton.addTarget(self, action: #selector(tapGoogle), for: .touchUpInside)
//        return googleLoginButton
//        
//    }()
//    
//    //MARK: - apple
//    let appleLoginButton : UIButton = {
//        var config = UIButton.Configuration.plain()
//        config.imagePadding = 24
//        var title = AttributedString.init("Sign in with Apple")
//        title.font = UIFont(name: "Roboto-Medium", size: 18)
//        config.attributedTitle = title
//        config.baseForegroundColor = UIColor(named: "GoogleColor")
//        config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
//        let appleLoginButton = UIButton(configuration: config)
//        
//        appleLoginButton.setImage(UIImage(named: "AppleLogo"), for: .normal)
//
//        
//        appleLoginButton.backgroundColor = .black
//        appleLoginButton.layer.cornerRadius = 7
//        appleLoginButton.layer.shadowColor = UIColor.lightGray.cgColor
//        appleLoginButton.layer.shadowOpacity = 1.0
//        appleLoginButton.layer.shadowRadius = 8
//        //MARK: - action
////        appleLoginButton.addTarget(self, action: #selector(tapApple), for: .touchUpInside)
//        return appleLoginButton
//    }()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.backgroundColor = .white
//        setView()
//        setStackView()
//        setAutoLayout()
//        
//    }
//    func setStackView(){
//        firstStackView.addArrangedSubview(KakaoLoginButton)
//        firstStackView.addArrangedSubview(googleLoginButton)
//        firstStackView.addArrangedSubview(appleLoginButton)
//    }
//    func setView(){
//        self.view.addSubview(sinsungoLogo)
//        self.view.addSubview(KakaoLoginButton)
//        self.view.addSubview(firstStackView)
//        //        self.view.addSubview(googleLoginButton)
//    }
//    func setAutoLayout(){
//        sinsungoLogo.snp.makeConstraints { make in
//            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(80)
//            make.size.equalTo(CGSize(width: 230, height: 300))
//            make.centerX.equalToSuperview()
//        
//        }
//       
//        firstStackView.snp.makeConstraints { make in
//            make.top.equalTo(sinsungoLogo.snp.bottom).offset(50)
//            make.centerX.equalToSuperview()
//        }
//    }
//    //MARK: - UI action
//    @objc func tapKakao(){
//        
//    }
//    @objc func tapGoogle(){
//        //        guard let clientID = FirebaseApp.app()?.options.clientID else {return}
//        //        let config = GIDConfiguration(clientID: clientID)
//        //        GIDSignIn.sharedInstance.signIn(with: config, presenting: self){ [unowned self] user, error in
//        //            if let error = error {
//        //                print("ERROR", error.localizedDescription)
//        //                return
//        //            }
//        //            guard let authentication = user?.authentication,
//        //                  let idToken = authentication.idToken else { return }
//        //
//        //            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
//        //
//        //            Auth.auth().signIn(with: credential) { _, _ in
//        //
//        //                self.present(TestViewController(), animated: true)
//        //            }
//        //        }
//        
//    }
//    @objc func tapApple(){
//        
//    }
//    
//}
//
//#if canImport(SwiftUI) && DEBUG
//import SwiftUI
//struct LoginVCPreview: PreviewProvider {
//    static var previews: some View {
//        LoginVC().showPreview(.iPhone14Pro)
//    }
//}
//#endif
//
