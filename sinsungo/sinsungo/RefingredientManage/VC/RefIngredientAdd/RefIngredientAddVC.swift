//
//  RefIngredientAdd.swift
//  sinsungo
//
//  Created by 원동진 on 2023/10/29.
//

import SnapKit
import UIKit
protocol CategoryDelegate : AnyObject{
    func sendCategory(standard :String)
}
protocol UnitDelegate : AnyObject{
    func sendUnit(standard :String)
}
class RefIngredientAddVC: UIViewController {
    let leftOffset = 20
    let rightOffset = -20
    var refIngredientSettingType = "냉장고 재료 추가"
    var refNum : Int = 0
    // 냉장고 번호 -> 0부터시작
    
    private lazy var backButtonCustom : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("\(refIngredientSettingType)", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.ExtraBold.rawValue, size: 20)!]))
        config.image = UIImage(named: "backImg")
        config.baseForegroundColor = .black
        config.imagePlacement = .leading
        config.imagePadding = 12
        let backButtonCustom = UIButton(configuration: config)
        backButtonCustom.addTarget(self, action: #selector(tapPop), for: .touchUpInside)
        return backButtonCustom
    }()
    var upperView : UIStackView = {
        let upperView = UIStackView()
        upperView.axis = .vertical
        upperView.spacing = 10
        upperView.alignment = .fill
        upperView.distribution = .fill
        return upperView
    }()
    var girdFlowLayout : GridCollectionVFL = {
        let layout = GridCollectionVFL()
        layout.cellSpacing = 8
        layout.numberOfColumns = 2
        return layout
    }()
    lazy var ingredientInfoView : IngredientInfoView = {
        let infoView = IngredientInfoView()
        infoView.setTextFieldDisable(disable: false)
        infoView.nameInfoView.textFieldDidBeginClosure = { [unowned self] in
            tapdInfoViewHighlight(version: 0)
            infoView.nameInfoView.layer.borderColor = UIColor(named: "primarycolor")?.cgColor
            infoView.nameInfoView.infoTitleLabel.textColor = UIColor(named: "primarycolor")
            
        }
        infoView.nameInfoView.textFieldDidEndClosure = { [unowned self] in
            infoView.nameInfoView.layer.borderColor = UIColor(named: "verylightpink")?.cgColor
            infoView.nameInfoView.infoTitleLabel.textColor = .black
        }
        infoView.cntInfoView.textFieldDidBeginClosure = { [unowned self] in
            tapdInfoViewHighlight(version: 0)
            infoView.cntInfoView.layer.borderColor = UIColor(named: "primarycolor")?.cgColor
            infoView.cntInfoView.infoTitleLabel.textColor = UIColor(named: "primarycolor")
            
        }
        infoView.cntInfoView.textFieldDidEndClosure = { [unowned self] in
            infoView.cntInfoView.layer.borderColor = UIColor(named: "verylightpink")?.cgColor
            infoView.cntInfoView.infoTitleLabel.textColor = .black
        }
        let tapCategoryGesture = UITapGestureRecognizer(target: self, action: #selector(tapCategoryView))
        let tapUnitGesture = UITapGestureRecognizer(target: self, action: #selector(tapUnitView))
        infoView.categoryView.addGestureRecognizer(tapCategoryGesture)
        infoView.unitInfoView.addGestureRecognizer(tapUnitGesture)
        return infoView
    }()
    private lazy var storageInfoView : StorageInfoView = {
        let infoView = StorageInfoView()
        infoView.setBtnDisable(disable: false)
        return infoView
    }()
    private lazy var refIngredientDetailCV : UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.girdFlowLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = true
        collectionView.contentInset = .zero
        collectionView.clipsToBounds = true
        collectionView.register(RefingredientHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: RefingredientHeader.identi)
        collectionView.register(StorageLocationCVCell.self, forCellWithReuseIdentifier: StorageLocationCVCell.identi)
        
        collectionView.backgroundColor = UIColor(named: "palegrey")
        
        return collectionView
    }()
    private lazy var addIngredientButton : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("냉장고에 재료 넣기", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: CustomFont.Bold.rawValue, size: 12)!]))
        config.baseForegroundColor = .white
        config.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0)
        let addIngredientButton = UIButton(configuration: config)
        addIngredientButton.backgroundColor = UIColor(named: "primarycolor")
        addIngredientButton.layer.cornerRadius = 4
        addIngredientButton.layer.masksToBounds = true
        
        return addIngredientButton
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "palegrey")
        addView()
        setAutoLayout()
        setCollectionView()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBar()
        refIngredientDetailCV.collectionViewLayout.invalidateLayout()
    }
    
}
extension RefIngredientAddVC : UICollectionViewDelegate ,UICollectionViewDataSource{
    //MARK: - Header & footer
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: RefingredientHeader.identi, for: indexPath) as? RefingredientHeader else {return UICollectionReusableView()}
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let headerView = RefingredientHeader()
        return headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }
    
    //MARK: - Cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StorageLocationCVCell.identi, for: indexPath) as? StorageLocationCVCell else {return UICollectionViewCell()}
//        if indexPath.row == self.refNum{
//            guard let selectCell = collectionView.dequeueReusableCell(withReuseIdentifier: StorageLocationCVCell_Selected.identi, for: indexPath) as? StorageLocationCVCell_Selected else { return UICollectionViewCell()}
//            return selectCell
//        }
        if indexPath.row == self.refNum{
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .init())
        }
        cell.isSelected = indexPath.row == self.refNum
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 나중에 선택된 냉장고 번호 넘겨줘야함
    }
    
}
extension RefIngredientAddVC : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionViewLayout as? GridCollectionVFL,
              flowLayout.numberOfColumns > 0
        else { fatalError() }
        let widthOfCells = collectionView.bounds.width - (collectionView.contentInset.left + collectionView.contentInset.right)
        let widthOfSpacing =  CGFloat(flowLayout.numberOfColumns - 1) * flowLayout.cellSpacing
        let width = (widthOfCells - widthOfSpacing) / CGFloat(flowLayout.numberOfColumns)
        return CGSize(width: width, height: width * flowLayout.ratioHeightToWidth)
    }
  
    
    
}
extension RefIngredientAddVC : CategoryDelegate,UnitDelegate{
    //MARK: - 분류
    func sendCategory(standard: String) {
        ingredientInfoView.categoryView.selectedStandard(standard)
    }
    @objc func tapCategoryView(){
        tapdInfoViewHighlight(version: 1)
        ingredientInfoView.nameInfoView.infoContentTextField.resignFirstResponder()
        ingredientInfoView.cntInfoView.infoContentTextField.resignFirstResponder()
        let modalVC = CategoryModalVC()
        modalVC.categoryVCDelegate = self
        presentModal(vc: modalVC, height: 300)
    }
    func sendUnit(standard: String) {
        ingredientInfoView.unitInfoView.selectedStandard(standard)
    }
    //MARK: - 단위
    @objc func tapUnitView(){
        tapdInfoViewHighlight(version: 2)
        ingredientInfoView.nameInfoView.infoContentTextField.resignFirstResponder()
        ingredientInfoView.cntInfoView.infoContentTextField.resignFirstResponder()
        let modalVC = UnitModalVC()
        modalVC.unitVCDelegate = self
        presentModal(vc: modalVC, height: 300)
    }
}
extension RefIngredientAddVC {
    
    func tapdInfoViewHighlight(version : Int){
        // 선택한 View Focusing
        // 0 : 분류, 단위 focus풀기 , 1 :분류 focus , 2 : 단위 focus
        
        switch version{
        case 0 :
            [ingredientInfoView.categoryView,ingredientInfoView.unitInfoView].forEach { view in
                view.infoTitleLabel.textColor = .black
                view.layer.borderColor = UIColor(named: "verylightpink")?.cgColor
            }
        case 1:
            ingredientInfoView.categoryView.infoTitleLabel.textColor = UIColor(named: "primarycolor")
            ingredientInfoView.categoryView.layer.borderColor = UIColor(named: "primarycolor")?.cgColor
            ingredientInfoView.unitInfoView.infoTitleLabel.textColor = .black
            ingredientInfoView.unitInfoView.layer.borderColor = UIColor(named: "verylightpink")?.cgColor
        case 2:
            ingredientInfoView.unitInfoView.infoTitleLabel.textColor = UIColor(named: "primarycolor")
            ingredientInfoView.unitInfoView.layer.borderColor = UIColor(named: "primarycolor")?.cgColor
            ingredientInfoView.categoryView.infoTitleLabel.textColor = .black
            ingredientInfoView.categoryView.layer.borderColor = UIColor(named: "verylightpink")?.cgColor
        default:
            print("올바른 version X")
            break
        }
        
    }
    @objc func tapBasketBtn(){
        
    }
    
    private func setCollectionView(){
        refIngredientDetailCV.dataSource = self
        refIngredientDetailCV.delegate = self
    }
    private func setNavigationBar(){
        self.navigationController?.navigationBar.isHidden = false
        let leftbuttonItem = UIBarButtonItem(customView: backButtonCustom)
        self.navigationItem.leftBarButtonItem = leftbuttonItem
        self.navigationController?.navigationBar.tintColor = .black
    }
    private func addView(){
        self.view.addSubview(upperView)
        upperView.addStackSubViews([ingredientInfoView,storageInfoView,refIngredientDetailCV,addIngredientButton])
    }
    private func setAutoLayout(){
        upperView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            make.left.equalToSuperview().offset(leftOffset)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-12)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-12)
        }
    }
    
}



#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct RefIngredientAddVCPreview: PreviewProvider {
    static var previews: some View {
        RefIngredientAddVC().showPreview(.iPhone14Pro)
    }
}
#endif
