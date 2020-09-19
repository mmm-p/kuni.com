//
//  detailViewController.swift
//  kuni.com
//
//  Created by 柳川万結 on 2020/01/24.
//  Copyright © 2020 柳川万結. All rights reserved.e
//

import UIKit
import RealmSwift

class detailViewController: UIViewController {
    let realm = try! Realm()
    var MemoArray: Results<Memo>!
    
    
    @IBOutlet var titleTextField: UITextField!//宣言
    @IBOutlet var contentTextView: UITextView!
    @IBOutlet var haikeiImageView: UIImageView!
    
    //var saveData: UserDefaults = UserDefaults.standard
    var chiki: String!
    var imagePickerController: UIImagePickerController = UIImagePickerController()
    
    
   
  
 
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(chiki)
    let imagePickerController: UIImagePickerController = UIImagePickerController()
        MemoArray = realm.objects(Memo.self)
//        print(MemoArray)
//        print(MemoArray[0].title)
        let memo2  = realm.objects(Memo.self).filter("name == 'アフリカ'")
        print(memo2)
//        _ = realm.objects(Memo.self).filter("content == 'ヨーロッパ'")
//        _ = realm.objects(Memo.self).filter("content == '中東'")
//        _ = realm.objects(Memo.self).filter("content == 'アジア'")
//        _ = realm.objects(Memo.self).filter("content == 'オセアニア'")
//        _ = realm.objects(Memo.self).filter("content == '北米'")
//        _ = realm.objects(Memo.self).filter("content == '中南米'")

        //titleTextField.text = saveData.object(forKey: "\(chiki ??  "")title") as? String
       //contentTextView.text = saveData.object(forKey: "\(chiki ?? "")content") as? String
        //if saveData.object(forKey: "\(chiki ?? "")saveImage" ) != nil{
            //haikeiImageView.image = UIImage(data: saveData.object(forKey: "\(chiki ?? "")saveImage") as! Data)
            //画像がuserdefaultsになかったら
        
        //画像があったら
        //}else{
                   //imagePickerController.delegate = self
                   //imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
                   //imagePickerController.allowsEditing = true
                   //self.present(imagePickerController, animated: true, completion: nil)
        print()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
            }
        // titleTextField.delegate = self
         
    
    //imagepickercontrollerを出してimageを保存する
    //func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //let image = info[.originalImage] as? UIImage
        //haikeiImageView.image = image
       // self.dismiss(animated: true, completion: nil)
        
    //}
    
    

@IBAction func saveMemo(){
    let memo = Memo()
    memo.title = titleTextField.text!
    memo.content = contentTextView.text!
    memo.name = contentTextView.text!
    
    try! realm.write{
        realm.add(memo)
    }
    
    let alert: UIAlertController = UIAlertController(title: "保存", message: "本文を入れます", preferredStyle: .alert)
     alert.addAction(
           UIAlertAction(
            title: "OK",
            style: .default,
            handler: { action in
            print("OKボタンが押されました！")
               
    }
    )
    )
    present(alert, animated: true,completion: nil)
    func textFieldShouldReturn(_ textField: UITextField)-> Bool{
    textField.resignFirstResponder()
        return true
    
    }
   
    
    
    
    //@ IBAction func saveMemo(){
        //saveData.set(titleTextField.text, forKey: "\(chiki ??  "")title")//savedataのtitletext
        //saveData.set(contentTextView.text,forKey: "\(chiki ??  "")content")
        //let alert: UIAlertController = UIAlertController(title: "保存", message: "本文を入れます", preferredStyle: .alert)
        //alert.addAction(
          //  UIAlertAction(
          //      title: "OK",
               // style: .default,
               // handler: { action in
                    
                    //self.navigationController?.popViewController(animated: true)
                    //self.saveData.set(self.haikeiImageView.image!.pngData() as Data? , forKey: "\(self.chiki ?? "")saveImage")
                   
            //}
                
            //)
        //)//savedataのalart
        //present(alert, animated: true,completion: nil)// 画面遷移戻す
        
        //func textFieldShouldReturn(_ textField: UITextField)-> Bool{
            //textField.resignFirstResponder()
            //return true
        //戻る
            
            
        //}
        

}
  
    
    
    














}
