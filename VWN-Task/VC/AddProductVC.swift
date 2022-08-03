//
//  AddProductVC.swift
//  VWN-Task
//
//  Created by Micheal Hany on 8/3/22.
//

import UIKit
import ImagePicker
import CoreData

class AddProductVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,ImagePickerDelegate {
    
    var ctx = NSManagedObjectContext.init(concurrencyType: .privateQueueConcurrencyType)
    
    var imagesPicked:[UIImage] = []
    
    let imagePicker = ImagePickerController()
    
    @IBOutlet weak var imagesPickedCollectionView: UICollectionView!
    
    @IBOutlet weak var doneBtnL: UIButton!
    @IBOutlet weak var productNameTxt: UITextField!
    @IBOutlet weak var productInfoTxt: UITextField!
    @IBOutlet weak var MealTxt: UITextField!
    @IBOutlet weak var itemTypeTxt: UITextField!
    @IBOutlet weak var priceTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        ctx = appDelegate.persistentContainer.viewContext
        
        
        imagesPickedCollectionView.delegate = self
        imagesPickedCollectionView.dataSource = self
        
        initHideKeyboard()
        
        productNameTxt.delegate = self
        productInfoTxt.delegate = self
        MealTxt.delegate = self
        itemTypeTxt.delegate = self
        priceTxt.delegate = self
        
        setupImagePickerController()
        
        
       
    }
    

    @IBAction func doneBtn(_ sender: Any) {
        
        addProductToDB()
        popVC()
        
    }
    
    @IBAction func addImageBtn(_ sender: Any) {
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    
    // images that picked collection view protocols
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesPicked.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectedImagesCollectionViewCell.ID, for: indexPath) as! SelectedImagesCollectionViewCell
        cell.selectedImg.image = imagesPicked[indexPath.row]
        return cell
    }
    
   
    
    
    // image picker protocols
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        imagePicker.expandGalleryView()
        print("wrapper")
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]){
        self.imagesPicked = images
        dismiss(animated: true, completion: nil)
        imagesPickedCollectionView.reloadData()
        print(self.imagesPicked)
        print("done")
    }
    
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        dismiss(animated: true, completion: nil)
        print("Cancled")
    }
    
    func setupImagePickerController(){
        imagePicker.delegate = self
        imagePicker.imageLimit = 3
    }
    
    @IBAction func backBtn(_ sender: Any) {
        popVC()
    }
    
    func addProductToDB(){

        let product = Product(context: ctx)
        product.productImages = imagesPicked.first!
        product.productName = productNameTxt.text
        product.productInfo = productInfoTxt.text
        product.mealType = MealTxt.text
        product.itemType = itemTypeTxt.text
        product.price = priceTxt.text

        do{
            try ctx.save()
        }catch{
            print(error)
        }

    }
}
