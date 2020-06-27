//
//  chiikiViewController.swift
//  kuni.com
//
//  Created by 柳川万結 on 2020/01/24.
//  Copyright © 2020 柳川万結. All rights reserved.
//

import UIKit

class chiikiViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    var chiikiNameArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        
        chiikiNameArray =
            ["アフリカ","ヨーロッパ","中東","アジア","オセアニア","北米","中南米"]//chiikinamearray の中身
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chiikiNameArray.count
    }// tableviewのデーターの値づけ
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = chiikiNameArray[indexPath.row]
        return cell!
    }//cellの設定
    func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath){
        print(chiikiNameArray[indexPath.row])
        self.performSegue(withIdentifier: "toDetail", sender: indexPath.row)//画面遷移のsegueをtodetailに送る
    }// 画面遷移のsegueの値をtodetailに送る
    override func prepare (for segue : UIStoryboardSegue, sender: Any?){
        if segue .identifier == "toDetail"{
            let VC = segue.destination as! detailViewController
            let index = sender as! Int
            VC.chiki = chiikiNameArray[index]
           
    }//todetailに送ってdetailvierに値を送る
    }
    
    
    
    }
    
   
    
    


