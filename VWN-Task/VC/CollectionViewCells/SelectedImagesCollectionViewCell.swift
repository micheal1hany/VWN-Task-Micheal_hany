//
//  ImagesPickedCollectionViewCell.swift
//  VWN-Task
//
//  Created by Micheal Hany on 8/3/22.
//

import UIKit

class SelectedImagesCollectionViewCell: UICollectionViewCell {
    
    static let ID = String(describing: SelectedImagesCollectionViewCell.self)
    
    @IBOutlet weak var selectedImg: UIImageView!
    
    @IBOutlet weak var deleteBtn: UIButton!
    
    @IBAction func deleteBtnAction(_ sender: Any) {
        
    }
}
