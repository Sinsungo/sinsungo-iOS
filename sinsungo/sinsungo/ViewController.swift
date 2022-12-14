//
//  ViewController.swift
//  sinsungo
//
//  Created by 원동진 on 2022/12/03.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    let testLabel : UILabel = {
        let testLabel = UILabel()
        testLabel.font = UIFont(name: "NanumSquareOTF_acB", size: 20)
        testLabel.text = "test"
        return testLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        setView()
        setAutoLayout()

    }
    func setView(){
        self.view.addSubview(testLabel)
    }
    func setAutoLayout(){
        testLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(20)
            make.bottom.right.equalToSuperview().offset(-20)
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
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
            .previewDisplayName("iPhone 11 Pro")
    }
}
