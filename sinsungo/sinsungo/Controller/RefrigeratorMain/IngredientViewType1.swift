//
//  IngredientView.swift
//  sinsungo
//
//  Created by 원동진 on 2023/02/07.
//

import UIKit
import SnapKit
func setIngredientViewType1(ingredientName :String ,ingredientCnt : Int , remainPeriod : Int ) -> UIView{
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
    let secondStackView : UIView = {
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
        remainProgressBar.progressViewStyle = .default
        remainProgressBar.clipsToBounds = true // 확인해보기
        remainProgressBar.layer.cornerRadius = 5
        remainProgressBar.layer.sublayers![1].cornerRadius = 5
        remainProgressBar.subviews[1].clipsToBounds = true
        remainProgressBar.progressTintColor = UIColor(named: "palered")
        remainProgressBar.trackTintColor = UIColor(named: "whitetwo")
        remainProgressBar.progress = 0.6
       
        return remainProgressBar
    }()
    let remainPeriod : UILabel = { //보관기한
        let remainPeriodLabel = UILabel()
        remainPeriodLabel.text = "+ \(remainPeriod)일"
        remainPeriodLabel.font = UIFont(name: "NanumSquareOTF_acB", size: 11)
        return remainPeriodLabel
    }()
   
    containerView.addSubview(firstStackView)
    containerView.addSubview(secondStackView)

    firstStackView.addArrangedSubview(ingredientLabel)
    firstStackView.addArrangedSubview(ingredientCntLabel)
    secondStackView.addSubview(remainProgressBar)
    secondStackView.addSubview(remainPeriod)
    firstStackView.snp.makeConstraints { make in
        make.left.equalTo(containerView.snp.left).offset(12)
        make.top.equalTo(containerView.snp.top).offset(8)
    }
    secondStackView.snp.makeConstraints { make in
        make.top.equalTo(firstStackView.snp.bottom).offset(12)
        make.left.equalTo(containerView.snp.left).offset(12)
        make.right.equalTo(containerView.snp.right).offset(-12)
        make.bottom.equalTo(containerView.snp.bottom).offset(-12)
    }
    remainProgressBar.setContentHuggingPriority(.init(750), for: .horizontal)
    remainProgressBar.snp.makeConstraints { make in
        make.top.left.bottom.equalToSuperview()
        make.height.equalTo(13)
    }
    
    remainPeriod.setContentHuggingPriority(.init(751), for: .horizontal)
    remainPeriod.snp.makeConstraints { make in
        make.top.right.bottom.equalToSuperview()
        make.left.equalTo(remainProgressBar.snp.right).offset(9)
    }
 
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

