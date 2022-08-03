//
//  HomeVC.swift
//  VWN-Task
//
//  Created by Micheal Hany on 8/3/22.
//

import UIKit

class HomeVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    

    @IBOutlet weak var productsCollectionView: UICollectionView!
    @IBOutlet weak var itemTypeCollectionView: UICollectionView!
    @IBOutlet weak var mealsCollectioView: UICollectionView!
    
    let mealsVM = MealsViewModel()
    let itemTypeVM = ItemTypeViewModel()
    let productVM = ProductViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        productVM.getProducts()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mealsCollectioView.delegate = self
        mealsCollectioView.dataSource = self
        
        itemTypeCollectionView.delegate = self
        itemTypeCollectionView.dataSource = self
        
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self

        
    }
    
    @IBAction func backBtn(_ sender: Any) {
        popVC()
    }
    
    
    
    //MARK: - Collection view delegats
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mealsCollectioView{
            return mealsVM.mealsCells.count
        }else if collectionView == itemTypeCollectionView{
            return itemTypeVM.itemTypeCells.count
        }else{
            return productVM.products.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mealsCollectioView{
            let cell = mealsCollectioView.dequeueReusableCell(withReuseIdentifier: MealsCollectionViewCell.ID, for: indexPath) as! MealsCollectionViewCell
            cell.mealLbl.text = mealsVM.mealsCells[indexPath.row]
            return cell
        }else if collectionView == itemTypeCollectionView{
            let cell = itemTypeCollectionView.dequeueReusableCell(withReuseIdentifier: ItemTypeCollectionViewCell.ID, for: indexPath) as! ItemTypeCollectionViewCell
            cell.itemTypeLbl.text = itemTypeVM.itemTypeCells[indexPath.row]
            return cell
        }else{
            let cell = productsCollectionView.dequeueReusableCell(withReuseIdentifier: ProductsCollectionViewCell.ID, for: indexPath) as! ProductsCollectionViewCell
            cell.setup(productVM.products[indexPath.row])
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == itemTypeCollectionView{
        return CGSize(width: itemTypeVM.itemTypeCells[indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20)]).width, height: 30)
        }else if collectionView == mealsCollectioView{
            return CGSize(width: 151, height: 81)
        }else{
            return CGSize(width: 191, height: 245)
        }
        
    }

}
