//
//  OptionsVC.swift
//  VWN-Task
//
//  Created by Micheal Hany on 8/3/22.
//

import UIKit

class OptionsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    

   
    @IBAction func addProductBtn(_ sender: Any) {
        navigate(screenID: "add_product")
    }
    
    @IBAction func goToHomeBtn(_ sender: Any) {
        
        navigate(screenID: "home")
        
    }
    
    
}
