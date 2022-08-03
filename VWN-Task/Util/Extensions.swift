//
//  Extensions.swift
//  VWN-Task
//
//  Created by Micheal Hany on 8/2/22.
//

import UIKit

extension UIView{
    
    @IBInspectable var cornerRadius:CGFloat{
        get{
            return 0
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
    
}

extension UIViewController{
    
    func worngAuthAlert(_ msg:String){
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func navigate(_ story:String = "Main", screenID:String){
        
        let story = UIStoryboard(name: story, bundle: nil)
        let screen = story.instantiateViewController(identifier: screenID)
        navigationController?.pushViewController(screen, animated: true)
    }
    
    func popVC(){
        navigationController?.popViewController(animated: true)
    }
    
    func initHideKeyboard(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    
}

extension UITextField{
    
    @IBInspectable var leftPadding:CGFloat{
        get{
            return 0
        }
        set{
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: self.frame.size.height))
            self.leftView = paddingView
            self.leftViewMode = .always
        }
    }
    
    
    @IBInspectable var tfCornerRadius:CGFloat {
        get{
            return 0
        }
        set{
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = true
        }
    }
    
}

extension AddProductVC: UITextFieldDelegate {
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      let nextTag = textField.tag + 1
    let nextTF = textField.superview?.viewWithTag(nextTag) as UIResponder?
      if nextTF != nil {
         nextTF?.becomeFirstResponder()
      } else {
         textField.resignFirstResponder()
      }
      return false
   }
}

