//
//  Product+CoreDataProperties.swift
//  VWN-Task
//
//  Created by Micheal Hany on 8/3/22.
//

import UIKit
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var productImages: UIImage
    @NSManaged public var productName: String?
    @NSManaged public var productInfo: String?
    @NSManaged public var mealType: String?
    @NSManaged public var itemType: String?
    @NSManaged public var price: String?
    
}

extension Product:Identifiable{

}
