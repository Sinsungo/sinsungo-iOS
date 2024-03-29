//
//  RefingredientDetailVC.swift
//  sinsungo
//
//  Created by 원동진 on 2023/05/04.
//

import UIKit
import SnapKit
class RefingredientReadVC: UIViewController {
    let leftOffset = 20
    let rightOffset = -20
    var refIngredientSettingType = "냉장고 재료 보기"
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
        infoView.setTextFieldDisable(disable: true)
        return infoView
    }()
    private lazy var storageInfoView : StorageInfoView = {
        let infoView = StorageInfoView()
        infoView.setBtnDisable(disable: true)
        return infoView
    }()
    private lazy var refIngredientDetailCV : UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.girdFlowLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = true
        collectionView.contentInset = .zero
        collectionView.clipsToBounds = true
        collectionView.register(RefingredientHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: RefingredientHeader.identi)
        collectionView.register(RefingredientReadFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: RefingredientReadFooter.identi)
        collectionView.register(StorageLocationCVCell.self, forCellWithReuseIdentifier: StorageLocationCVCell.identi)
        collectionView.backgroundColor = UIColor(named: "palegrey")
        
        return collectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "palegrey")
        addView()
        setAutoLayout()
        setCollectionView()
        //        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapView(_:)))
        //        headerView.addGestureRecognizer(tapGestureRecognizer)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBar()
        refIngredientDetailCV.collectionViewLayout.invalidateLayout()
    }
    
}
extension RefingredientReadVC : UICollectionViewDelegate ,UICollectionViewDataSource{
    //MARK: - Header & footer
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: RefingredientHeader.identi, for: indexPath) as? RefingredientHeader else {return UICollectionReusableView()}
            return header
        case UICollectionView.elementKindSectionFooter:
            guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: RefingredientReadFooter.identi, for: indexPath) as? RefingredientReadFooter else {return UICollectionReusableView()}
            footer.tapUpdateIngredientClosure = { [unowned self] in
                let pushVC = RefIngredientUpdateVC()
                self.navigationController?.pushViewController(pushVC, animated: true)
                
            }
            return footer
        default:
            return UICollectionReusableView()
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 60)
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
        if indexPath.row == self.refNum{
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .init())
        }
        cell.isSelected = indexPath.row == self.refNum
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    
}
extension RefingredientReadVC : UICollectionViewDelegateFlowLayout{
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
extension RefingredientReadVC {
    @objc func didTapView(_ sender: UITapGestureRecognizer){
        
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
        upperView.addStackSubViews([ingredientInfoView,storageInfoView,refIngredientDetailCV])
        //        self.view.addSubview(ingredientInfoView)
        //        self.view.addSubview(storageInfoView)
        //        self.view.addSubview(refIngredientDetailCV)
    }
    private func setAutoLayout(){
        upperView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            make.left.equalToSuperview().offset(leftOffset)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
        
    }
    
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct RefingredientReadVCPreview: PreviewProvider {
    static var previews: some View {
        RefingredientReadVC().showPreview(.iPhone14Pro)
    }
}
#endif
