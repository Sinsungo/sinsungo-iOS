//
//  ShopBasketUpdateVC.swift
//  sinsungo
//
//  Created by 원동진 on 2023/11/07.
//

import Foundation
protocol UnitDelegateShopBasketUpdate : AnyObject{
    func sendUnit(standard :String)
}
class ShopBasketUpdateVC: UIViewController {
    private let shopBasketType = "장바구니 재료 수정"
    
    private lazy var ingredientInfoLabel : UILabel = {
        let label = UILabel()
        label.text = "재료 정보"
        label.font = UIFont(name: CustomFont.Bold.rawValue, size: 14)
        label.textColor = UIColor.black
        label.textAlignment = .left
        return label
    }()
    private lazy var ingredientInfoView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 12
        return stackView
    }()
    
    private lazy var ingredientNameInfoView : InputTextType1 = {
        let infoView = InputTextType1()
        infoView.textFieldDidBeginClosure = {
            [unowned self] in
            tapdInfoViewHighlight(version: 0)
            infoView.layer.borderColor = UIColor(named: "primarycolor")?.cgColor
            infoView.infoTitleLabel.textColor = UIColor(named: "primarycolor")
        }
        infoView.textFieldDidEndClosure = { [unowned self] in
            infoView.layer.borderColor = UIColor(named: "verylightpink")?.cgColor
            infoView.infoTitleLabel.textColor = .black
        }
        infoView.setText("이름", "재료의 이름을 입력해주세요.")
        return infoView
    }()
    private lazy var cntUnitStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.alignment = .fill
        return stackView
    }()
    // 수량
    lazy var cntInfoView : InputTextType1 = {
        let infoView = InputTextType1()
        infoView.setText("수량", "수량을 입력해주세요.")
        infoView.textFieldDidBeginClosure = {
            [unowned self] in
            tapdInfoViewHighlight(version: 0)
            infoView.layer.borderColor = UIColor(named: "primarycolor")?.cgColor
            infoView.infoTitleLabel.textColor = UIColor(named: "primarycolor")
        }
        infoView.textFieldDidEndClosure = { [unowned self] in
            infoView.layer.borderColor = UIColor(named: "verylightpink")?.cgColor
            infoView.infoTitleLabel.textColor = .black
        }
        return infoView
    }()
    // 단위
    lazy var unitInfoView : InputTextType2 = {
        let infoView = InputTextType2()
        infoView.setText("단위", "단위를 입력해주세요.")
        let tapUnitGesture = UITapGestureRecognizer(target: self, action: #selector(tapUnitView))
        infoView.addGestureRecognizer(tapUnitGesture)
        return infoView
    }()
    private lazy var memoInfoLabel : UILabel = {
        let label = UILabel()
        label.text = "메모"
        label.font = UIFont(name: CustomFont.Bold.rawValue, size: 14)
        label.textColor = UIColor.black
        label.textAlignment = .left
        return label
    }()
    lazy var memoInfoView : InputTextType1 = {
        let infoView = InputTextType1()
        infoView.setText("메모", "메모 내용을 입력해주세요.")
        infoView.textFieldDidBeginClosure = {
            [unowned self] in
            tapdInfoViewHighlight(version: 0)
            infoView.layer.borderColor = UIColor(named: "primarycolor")?.cgColor
            infoView.infoTitleLabel.textColor = UIColor(named: "primarycolor")
        }
        infoView.textFieldDidEndClosure = { [unowned self] in
            infoView.layer.borderColor = UIColor(named: "verylightpink")?.cgColor
            infoView.infoTitleLabel.textColor = .black
        }
        return infoView
    }()
    private lazy var backButtonCustomm : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("\(shopBasketType)", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.ExtraBold.rawValue, size: 20)!]))
        config.image = UIImage(named: "backImg")
        config.baseForegroundColor = .black
        config.imagePlacement = .leading
        config.imagePadding = 12
        let backButtonCustom = UIButton(configuration: config)
        backButtonCustom.addTarget(self, action: #selector(tapPop), for: .touchUpInside)
        return backButtonCustom
    }()
    private lazy var addShopBasektBtn : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("장바구니에 추가하기", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Bold.rawValue, size: 12)!]))
        config.baseForegroundColor = .white
        config.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0)
        let addShopBasektBtn = UIButton(configuration: config)
        addShopBasektBtn.backgroundColor = UIColor(named: "primarycolor")
        addShopBasektBtn.layer.cornerRadius = 4
        addShopBasektBtn.layer.masksToBounds = true
        return addShopBasektBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "palegrey")
        setNavigationBar()
        addSubViews()
        setAutoLayout()
    }
    
}
extension ShopBasketUpdateVC : UnitDelegate{
    func sendUnit(standard: String) {
        unitInfoView.selectedStandard(standard)
    }
    
    private func setNavigationBar(){
        self.navigationController?.navigationBar.isHidden = false
        let leftbuttonItem = UIBarButtonItem(customView: backButtonCustomm)
        self.navigationItem.leftBarButtonItem = leftbuttonItem
        self.navigationController?.navigationBar.tintColor = .black
    }
    private func addSubViews(){
        self.view.addSubViews([ingredientInfoLabel,ingredientInfoView,memoInfoLabel,memoInfoView,addShopBasektBtn])
        ingredientInfoView.addStackSubViews([ingredientNameInfoView,cntUnitStackView])
        cntUnitStackView.addStackSubViews([cntInfoView,unitInfoView])
    }
    private func setAutoLayout(){
        ingredientInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        ingredientInfoView.snp.makeConstraints { make in
            make.top.equalTo(ingredientInfoLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        memoInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(ingredientInfoView.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        memoInfoView.snp.makeConstraints { make in
            make.top.equalTo(memoInfoLabel.snp.bottom).offset(6)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        addShopBasektBtn.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(16)
            make.right.equalTo(view.snp.right).offset(-16)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-12)
        }
    }
    func tapdInfoViewHighlight(version:Int){
        // 0 : 단위 포커스풀기
        switch version{
            case 0 :
            unitInfoView.infoTitleLabel.textColor = .black
            unitInfoView.layer.borderColor = UIColor(named: "verylightpink")?.cgColor
        default:
            print("올바른 version X")
            break
        }
    }
    @objc func tapUnitView(){
        ingredientNameInfoView.infoContentTextField.resignFirstResponder()
        cntInfoView.infoContentTextField.resignFirstResponder()
        memoInfoView.infoContentTextField.resignFirstResponder()
        unitInfoView.infoTitleLabel.textColor = UIColor(named: "primarycolor")
        unitInfoView.layer.borderColor = UIColor(named: "primarycolor")?.cgColor
        let modalVC = UnitModalVC()
        modalVC.unitVCDelegate = self
        presentModal(vc: modalVC, height: 300)
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct ShopBasketUpdateVCPreview: PreviewProvider {
    static var previews: some View {
        ShopBasketUpdateVC().showPreview(.iPhone14Pro)
    }
}
#endif
