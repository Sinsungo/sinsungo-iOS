//
//  ViewController.swift
//  sinsungo
//
//  Created by 원동진 on 2022/12/03.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    let sinsungoLogo : UIImageView = {
        let sinUIImage = UIImageView()
        sinUIImage.image = UIImage(named: "SinsungoLogo")
        sinUIImage.contentMode = .scaleAspectFill
        return sinUIImage
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setView()
        setAutoLayout()

    }
    func setView(){
        self.view.addSubview(sinsungoLogo)
    }
    func setAutoLayout(){
        sinsungoLogo.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(50)
            make.size.equalTo(CGSize(width: 230, height: 300))
            make.centerX.equalToSuperview()
            
        }
   
    }
 
}

import SwiftUI
@available(iOS 13.0.0, *)
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController
    
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
}
struct ViewPreview: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            .previewDisplayName("iPhone 14 Pro")
    }
}
