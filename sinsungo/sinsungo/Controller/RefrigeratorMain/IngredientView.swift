//
//  IngredientView.swift
//  sinsungo
//
//  Created by 원동진 on 2023/02/07.
//

import UIKit
import SnapKit
func setIngredientView(ingredientName :String ,ingredientCnt : Int , remainPeriod : Int ) -> UIView{
    let containerView : UIView = {
        let containerView = UIView()
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor(named: "verylightpink")?.cgColor
        containerView.layer.cornerRadius = 4
        return containerView
    }()
    
    let firstStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 2
        return stackView
    }()
    let secondStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 9
        return stackView
    }()
    let ingredientLabel : UILabel = { // 재료명
        let ingredientNameLabel = UILabel()
        ingredientNameLabel.font = UIFont(name: "NanumSquareOTF_acB", size: 12)
        ingredientNameLabel.textColor = .black
        ingredientNameLabel.text = ingredientName + " | "
        return ingredientNameLabel
    }()
    let ingredientCntLabel : UILabel = { //재료 수
        let ingredientCntLabel = UILabel()
        ingredientCntLabel.text = "\(ingredientCnt)개"
        ingredientCntLabel.font = UIFont(name: "NanumSquareOTF_acB", size: 10)
        
        return ingredientCntLabel
    }()
    let remainProgressBar : UIProgressView = { // 보관 bar
        let remainProgressBar = UIProgressView()
        remainProgressBar.progressViewStyle = .bar
        remainProgressBar.clipsToBounds = true // 확인해보기
        remainProgressBar.layer.cornerRadius = 4
        remainProgressBar.progressTintColor = UIColor(named: "palered")
        remainProgressBar.trackTintColor = UIColor(named: "whitetwo")
        remainProgressBar.progress = 0.5
        return remainProgressBar
    }()
    let remainPeriod : UILabel = { //보관기한
        let remainPeriodLabel = UILabel()
        remainPeriodLabel.text = "+ \(remainPeriod)일"
        remainPeriodLabel.font = UIFont(name: "NanumSquareOTF_acB", size: 10)
        return remainPeriodLabel
    }()
    containerView.addSubview(firstStackView)
    containerView.addSubview(secondStackView)
    firstStackView.snp.makeConstraints { make in
        make.left.equalTo(containerView.snp.left).offset(8)
        make.top.equalTo(containerView.snp.top).offset(8)
    }
    secondStackView.snp.makeConstraints { make in
        make.top.equalTo(firstStackView.snp.bottom).offset(6)
        make.left.equalTo(containerView.snp.left).offset(8)
        make.right.equalTo(containerView.snp.right).offset(-8)
        make.bottom.equalTo(containerView.snp.bottom).offset(-6)
    }
    firstStackView.addArrangedSubview(ingredientLabel)
    firstStackView.addArrangedSubview(ingredientCntLabel)
    secondStackView.addArrangedSubview(remainProgressBar)
    secondStackView.addArrangedSubview(remainPeriod)
    return containerView
}

//MARK: - View일경우
//class IngredientView: UIView {
//    let containerView = UIStackView()
//    let firstStackView = UIStackView()
//    let secondStackView = UIStackView()
//    let ingredientLabel = UILabel()
//    let ingredientCntLabel = UILabel()
//    let remainProgressBar = UIProgressView()
//    let remainPeriod = UILabel()
//    override init(frame: CGRect){
//        super.init(frame: frame)
//        sharedLayout()
//        setAutoLayout()
//        setFirstStackView()
//        setSecondStackView()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
//    private func sharedLayout(){
//        self.addSubview(containerView)
////MARK: - containerView
//        containerView.backgroundColor = .yellow
//        containerView.addArrangedSubview(firstStackView)
//        containerView.addArrangedSubview(secondStackView)
//        containerView.axis = .vertical
//        containerView.alignment = .fill
//        containerView.distribution = .fillEqually
//        containerView.spacing = 6
//
//    }
//    private func setFirstStackView(){
//        firstStackView.backgroundColor = .red
//        firstStackView.addArrangedSubview(ingredientLabel)
//        ingredientLabel.text = "재료명"
//    }
//    private func setSecondStackView(){
//        secondStackView.backgroundColor = .blue
//    }
//    private func setAutoLayout(){
//        containerView.snp.makeConstraints { make in
//            make.edges.equalToSuperview().inset(8)
//        }
//
//    }
//}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
@available(iOS 13.0, *)
struct UIViewPreview<View: UIView>: UIViewRepresentable {
    let view: View
    init(_ builder: @escaping () -> View) {
        view = builder()
    }
    // MARK: - UIViewRepresentable
    func makeUIView(context: Context) -> UIView {
        return view
    }
    func updateUIView(_ view: UIView, context: Context) {
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}
@available(iOS 13.0, *)
struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    let viewController: ViewController
    init(_ builder: @escaping () -> ViewController) {
        viewController = builder()
    }
    // MARK: - UIViewControllerRepresentable
    func makeUIViewController(context: Context) -> ViewController {
        viewController
    }
    func updateUIViewController(_ uiViewController: ViewController, context: UIViewControllerRepresentableContext<UIViewControllerPreview<ViewController>>) {
        return
    }
}
#endif
#if canImport(SwiftUI) && DEBUG
import SwiftUI
@available(iOS 13.0, *)
struct ExampleView_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let view = setIngredientView(ingredientName: "재료명", ingredientCnt: 1, remainPeriod: 0)
            return view
        }.previewLayout(.sizeThatFits)
            .padding(10)
    }
}
#endif
