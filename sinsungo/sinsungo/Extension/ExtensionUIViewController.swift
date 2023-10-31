//
//  ExtensionUIViewController.swift
//  sinsungo
//
//  Created by 원동진 on 2023/03/24.
//

import Foundation
import Foundation
enum DeviceType {
    case iPhoneSE2
    case iPhone8
    case iPhone12Pro
    case iPhone12ProMax
    case iPhone14Pro

    func name() -> String {
        switch self {
        case .iPhoneSE2:
            return "iPhone SE"
        case .iPhone8:
            return "iPhone 8"
        case .iPhone12Pro:
            return "iPhone 12 Pro"
        case .iPhone12ProMax:
            return "iPhone 12 Pro Max"
        case .iPhone14Pro:
            return "iPhone 14 Pro"
        }
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController

        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }

    func showPreview(_ deviceType: DeviceType = .iPhone12Pro) -> some View {
        Preview(viewController: self).previewDevice(PreviewDevice(rawValue: deviceType.name()))
    }
    @objc func tapPop(){
        self.navigationController?.popViewController(animated: true)
    }
    @objc func tapDismiss(){
        self.dismiss(animated: true)
    }
    func presentModal(vc: UIViewController ,height : CGFloat){
        let modalVC = vc
        if let sheet = modalVC.sheetPresentationController {
            sheet.detents = [
                .custom{ _ in
                    return height
                }
            ]
            sheet.preferredCornerRadius = 16
        }
        self.present(modalVC, animated: true)
    }
}
#endif
