//
//  chiikiViewController.swift
//  kuni.com
//
//  Created by 柳川万結 on 2020/01/24.
//  Copyright © 2020 柳川万結. All rights reserved.
//

import UIKit
import RealmSwift
class chiikiViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let realm = try! Realm()
    var MemoArray: Results<Memo>!
    @IBOutlet var table: UITableView!
    
    var chiikiNameArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MemoArray = realm.objects(Memo.self)
        
        table.dataSource = self
        table.delegate = self
        
        chiikiNameArray =
            ["アフリカ","ヨーロッパ","中東","アジア","オセアニア","北米","中南米"]//chiikinamearray の中身
        if MemoArray.count == 0{
            let memo = Memo()
            
            
            try! realm.write{
                realm.add(memo)
            }
        }
        for i in 0...6{
            if MemoArray.count == 0{
                       let memo = Memo()
                       
                       
                       try! realm.write{
                           realm.add(memo)
                       }
                   }
        }
        
        
        
    }
    // tableviewのcellの段数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chiikiNameArray.count
    }
    
    //tableviewのcellの値を設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = chiikiNameArray[indexPath.row]
        return cell!
    }
    // 画面遷移のsegueの値をtodetailに送る
    func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath){
        print(chiikiNameArray[indexPath.row])
        self.performSegue(withIdentifier: "toDetail", sender: indexPath.row)//画面遷移のsegueをtodetailに送る
    }
    //todetailに送ってdetailviewに値を送る
    override func prepare (for segue : UIStoryboardSegue, sender: Any?){
        if segue .identifier == "toDetail"{
            let VC = segue.destination as! detailViewController
            
            let index = sender as! Int
            VC.chiki = chiikiNameArray[index]
            
        }
    }
    
    
    
}





