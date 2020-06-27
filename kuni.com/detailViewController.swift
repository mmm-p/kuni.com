//
//  detailViewController.swift
//  kuni.com
//
//  Created by 柳川万結 on 2020/01/24.
//  Copyright © 2020 柳川万結. All rights reserved.e
//

import UIKit

class detailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    @IBOutlet var haikeiImageView: UIImageView!
    
    var saveData: UserDefaults = UserDefaults.standard
    var chiki: String!
    var imagePickerController: UIImagePickerController = UIImagePickerController()
   
  
 
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    let imagePickerController: UIImagePickerController = UIImagePickerController()
        
        titleTextField.text = saveData.object(forKey: "\(chiki ??  "")title") as? String
        contentTextView.text = saveData.object(forKey: "\(chiki ?? "")content") as? String
        if saveData.object(forKey: "\(chiki ?? "")saveImage" ) != nil{
            
             haikeiImageView.image = UIImage(data: saveData.object(forKey: "\(chiki ?? "")saveImage") as! Data)
        
        
   
        }else{
                   imagePickerController.delegate = self
                   imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
                   imagePickerController.allowsEditing = true
                   self.present(imagePickerController, animated: true, completion: nil)
           
        
            
        }
         titleTextField.delegate = self
         
       
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("AAA")
        
        let image = info[.originalImage] as? UIImage
        haikeiImageView.image = image
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    @ IBAction func saveMemo(){
        saveData.set(titleTextField.text, forKey: "\(chiki ??  "")title")
        saveData.set(contentTextView.text,forKey: "\(chiki ??  "")content")
        let alert: UIAlertController = UIAlertController(title: "保存", message: "本文を入れます", preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: { action in
                    self.navigationController?.popViewController(animated: true)
                    
                    self.saveData.set(self.haikeiImageView.image!.pngData() as Data? , forKey: "\(self.chiki ?? "")saveImage")
            }
                
            )
        )//savedataのalart
        present(alert, animated: true,completion: nil)
        
        
        func textFieldShouldReturn(_ textField: UITextField)-> Bool{
            textField.resignFirstResponder()
            return true
            
            
        }
        
    }
    
  
    
    
    
}












