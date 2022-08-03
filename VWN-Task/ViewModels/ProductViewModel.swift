//
//  ProductViewModel.swift
//  VWN-Task
//
//  Created by Micheal Hany on 8/3/22.
//

import UIKit
import CoreData

class ProductViewModel {
    
    var products :[Product]!
    
    var ctx = NSManagedObjectContext.init(concurrencyType: .privateQueueConcurrencyType)
    
    func getProducts(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        ctx = appDelegate.persistentContainer.viewContext

        do {
            products = try ctx.fetch(Product.fetchRequest())
        }catch{
            print(error)
        }

    }
    
}
