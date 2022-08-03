//
//  MealsCollectionViewCell.swift
//  VWN-Task
//
//  Created by Micheal Hany on 8/3/22.
//

import UIKit

class MealsCollectionViewCell: UICollectionViewCell {
    
    static let ID = String(describing: MealsCollectionViewCell.self)
    
    @IBOutlet weak var mealLbl: UILabel!
    @IBOutlet weak var contentBg: UIView!
}
