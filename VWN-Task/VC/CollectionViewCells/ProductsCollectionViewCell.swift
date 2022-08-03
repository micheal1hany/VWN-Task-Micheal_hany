//
//  ProductsCollectionViewCell.swift
//  VWN-Task
//
//  Created by Micheal Hany on 8/3/22.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {
    
    static let ID = String(describing: ProductsCollectionViewCell.self)
    
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    func setup(_ cell:Product){
        productImage.image = cell.productImages
        productName.text = cell.productName
        productPrice.text = String("$" + cell.price!)
    }
}
