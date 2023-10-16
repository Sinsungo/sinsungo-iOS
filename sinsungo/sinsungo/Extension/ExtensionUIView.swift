//
//  ExtensionUIView.swift
//  sinsungo
//
//  Created by 원동진 on 2023/02/01.
//

import Foundation
import UIKit
//MARK: - 특정부분 모소리만 둥글게
extension UIView {
    func roundCorners(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
    enum VerticalLocation {
        case bottom
        case top
        case left
        case right
    }

    func addShadow(location: VerticalLocation, color: UIColor = .black, opacity: Float = 0.8, radius: CGFloat = 5.0) {
        switch location {
        case .bottom:
             addShadow(offset: CGSize(width: 0, height: 10), color: color, opacity: opacity, radius: radius)
        case .top:
            addShadow(offset: CGSize(width: 0, height: -10), color: color, opacity: opacity, radius: radius)
        case .left:
            addShadow(offset: CGSize(width: -10, height: 0), color: color, opacity: opacity, radius: radius)
        case .right:
            addShadow(offset: CGSize(width: 10, height: 0), color: color, opacity: opacity, radius: radius)
        }
    }

    func addShadow(offset: CGSize, color: UIColor = .black, opacity: Float = 0.1, radius: CGFloat = 3.0) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
    func addSubViews(_ views : [UIView]){
        _ = views.map{self.addSubview($0)}
    }
 
}
//public static var layerMinXMinYCorner: CACornerMask { get } 왼쪽상단
//public static var layerMaxXMinYCorner: CACornerMask { get } 오른쪽상단
//public static var layerMinXMaxYCorner: CACornerMask { get } 왼쪽하단
//public static var layerMaxXMaxYCorner: CACornerMask { get } 오른쪽하단
#if canImport(SwiftUI) && DEBUG
import SwiftUI
extension UIView {
    private struct Preview: UIViewRepresentable {
        typealias UIViewType = UIView

        let view: UIView

        func makeUIView(context: Context) -> UIView {
            return view
        }

        func updateUIView(_ uiView: UIView, context: Context) {
        }
    }

    func showPreview() -> some View {
        Preview(view: self).previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
    }
    func setChangeFont(changeLabel: UILabel,fontName : String,fontSize:CGFloat,targetStriong : String){
        let fullText = changeLabel.text ?? ""
        let attFont = UIFont(name: fontName, size: fontSize)
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: targetStriong)
        attributedString.addAttribute(.font, value: attFont!, range: range)
        changeLabel.attributedText = attributedString
        
    }
}
#endif
