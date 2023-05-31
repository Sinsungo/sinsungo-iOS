//
//  RefingredientDetailVC.swift
//  sinsungo
//
//  Created by 원동진 on 2023/05/04.
//

import UIKit
import SnapKit
class RefingredientDetailVC: UIViewController {
    let leftOffset = 20
    let rightOffset = -20
    var refIngredientSettingType = "냉장고 재료 보기"
    
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
    var girdFlowLayout : GridCollectionVFL = {
        let layout = GridCollectionVFL()
        layout.cellSpacing = 8
        layout.numberOfColumns = 2
        return layout
    }()
    private lazy var refIngredientDetailCV : UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.girdFlowLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = true
        collectionView.contentInset = .zero
        collectionView.clipsToBounds = true
        collectionView.register(RefingredientDetailHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: RefingredientDetailHeader.identi)
        collectionView.register(RefingredientDetailFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: RefingredientDetailFooter.identi)
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
extension RefingredientDetailVC : UICollectionViewDelegate ,UICollectionViewDataSource{
    //MARK: - Header & footer
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: RefingredientDetailHeader.identi, for: indexPath) as? RefingredientDetailHeader else {return UICollectionReusableView()}
            return header
        case UICollectionView.elementKindSectionFooter:
            guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: RefingredientDetailFooter.identi, for: indexPath) as? RefingredientDetailFooter else {return UICollectionReusableView()}
            return footer
        default:
            return UICollectionReusableView()
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 60)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
       let headerView = RefingredientDetailHeader()
        return headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }
    
    //MARK: - Cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StorageLocationCVCell.identi, for: indexPath) as? StorageLocationCVCell else {return UICollectionViewCell()}
        return cell
    }
    
}
extension RefingredientDetailVC : UICollectionViewDelegateFlowLayout{
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
extension RefingredientDetailVC {
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
        self.view.addSubview(refIngredientDetailCV)
    }
    private func setAutoLayout(){
        refIngredientDetailCV.snp.makeConstraints { make in
            make.top.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.left.equalToSuperview().offset(leftOffset)
            make.right.equalToSuperview().offset(rightOffset)
        }

    }
    
}
extension RefingredientDetailVC : tapTextFieldDelegate{
    func tapTextFieldAction() {
    }
}
#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct RefingredientDetailVCPreview: PreviewProvider {
    static var previews: some View {
        RefingredientDetailVC().showPreview(.iPhone14Pro)
    }
}
#endif
