//
//  WeaponsTableViewController.swift
//  Weapons
//
//  Created by Mr wngkai on 2018/6/8.
//  Copyright © 2018年 Mr wngkai. All rights reserved.
//

import UIKit

class WeaponsTableViewController: UITableViewController {
    
    var weapons: [Weapon] = []
    
    
    
    @IBAction func favBtnTap(_ sender: UIButton) {
        let btnPos = sender.convert(CGPoint.zero, to: self.tableView)
        
        print("爱心按钮在table view中的位置",btnPos)
        let indexPath = tableView.indexPathForRow(at: btnPos)!
        
        print("爱心按钮所在行",indexPath)
        self.weapons[indexPath.row].favourite = !self.weapons[indexPath.row].favourite
        
        let cell = tableView.cellForRow(at: indexPath) as! CardCell
        
        cell.favourite = self.weapons[indexPath.row].favourite
       
    }
    
    func loadJson() {
        let coder = JSONDecoder()
        
        do {
            let url = Bundle.main.url(forResource: "weapons", withExtension: "json")!
            let data = try Data(contentsOf: url)
            weapons = try coder.decode([Weapon].self, from: data)
            
        } catch  {
            print("解码错误", error)
        }
        
    }
    
//    func saveToJson() {
//        let coder = JSONEncoder()
//
//        do {
//            let data = try coder.encode(weapons)
//            let saveUrl = URL(fileURLWithPath: NSHomeDirectory()).appendingPathComponent("weapons.json")
//
//            try data.write(to: saveUrl)
//            print("保存成功！路径：",saveUrl)
//        } catch  {
//            print("编码错误", error)
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedStringKey.foregroundColor : UIColor(named: "theme")!
        ]
        //saveToJson()
        loadJson()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let favAction = UIContextualAction(style: .normal, title: "Like") { (_, _, completion) in
            self.weapons[indexPath.row].favourite = !self.weapons[indexPath.row].favourite
            
            let cell = tableView.cellForRow(at: indexPath) as! CardCell
            cell.favourite = self.weapons[indexPath.row].favourite
            
            completion(true)
        }
        favAction.image = #imageLiteral(resourceName: "fav")
        favAction.backgroundColor = UIColor.purple
        
        let config = UISwipeActionsConfiguration(actions: [favAction])
        return config
        
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delAction = UIContextualAction(style: .destructive, title: "Delete") { (_, _, completion) in
            
            self.weapons.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            completion(true)
        }
        
        let shareAction = UIContextualAction(style: .normal, title: "Share") { (_, _, completion) in
            let text = "这是绝对求生中的帅气\(self.weapons[indexPath.row].name)! "
            let image = UIImage(named: self.weapons[indexPath.row].image)!
            let ac = UIActivityViewController(activityItems: [text, image], applicationActivities: nil)
            
            if let pc = ac.popoverPresentationController {
                if let cell = tableView.cellForRow(at: indexPath) {
                    pc.sourceView = cell
                    pc.sourceRect = cell.bounds
                }
            }
            self.present(ac, animated: true)
            
            completion(true)
        }
        
        shareAction.backgroundColor = UIColor.orange
        
        let config = UISwipeActionsConfiguration(actions: [delAction, shareAction])
        return config
        
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weapons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = String(describing: CardCell.self)
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as! CardCell
        
        let weapon = weapons[indexPath.row]
        
        cell.typeLable.text = weapon.type
        cell.weaponLable.text = weapon.name
        cell.originLable.text = weapon.origin
        cell.backImageView.image = UIImage(named: weapon.image)
        cell.favourite = weapon.favourite

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showWeaponDetail" {
            let row = tableView.indexPathForSelectedRow!.row
            
            let destination = segue.destination as!DetailController
            
            destination.weapon = weapons[row]
        }
       
   }
   

}
