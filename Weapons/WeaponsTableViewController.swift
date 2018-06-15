//
//  WeaponsTableViewController.swift
//  Weapons
//
//  Created by Mr wngkai on 2018/6/8.
//  Copyright © 2018年 Mr wngkai. All rights reserved.
//

import UIKit

class WeaponsTableViewController: UITableViewController {
    
    var weapons = ["AUG","AWM","十字弩","DP28","Groza","Kar98K","M16A4","Micro UZI","平底锅","SKS","UMP9"]
    var weaponTypes = ["自动步枪","狙击枪","冷兵器","机枪","自动步枪","狙击枪","自动步枪","冲锋枪","近战武器","半自动步枪","冲锋枪"]
    var origins = ["奥地利","英国","中国","前苏联","俄罗斯","德国","英国","以色列","美国","前苏联","美国"]
    var weaponImages = ["aug","awm","crossbow","dp28","groza","kar98k","m16a4","microuzi","pan","sks","ump9"]
    
    var favourites = Array(repeating: false, count: 11)
    
    @IBAction func favBtnTap(_ sender: UIButton) {
        let btnPos = sender.convert(CGPoint.zero, to: self.tableView)
        
        print("爱心按钮在table view中的位置",btnPos)
        let indexPath = tableView.indexPathForRow(at: btnPos)!
        
        print("爱心按钮所在行",indexPath)
        self.favourites[indexPath.row] = !self.favourites[indexPath.row]
        
        let cell = tableView.cellForRow(at: indexPath) as! CardCell
        
        cell.favourite = self.favourites[indexPath.row]
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let favAction = UIContextualAction(style: .normal, title: "Like") { (_, _, completion) in
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
            self.weaponTypes.remove(at: indexPath.row)
            self.weaponImages.remove(at: indexPath.row)
            self.origins.remove(at: indexPath.row)
            self.favourites.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            completion(true)
        }
        
        let shareAction = UIContextualAction(style: .normal, title: "Share") { (_, _, completion) in
            let text = "这是绝对求生中的帅气\(self.weapons[indexPath.row])! "
            let image = UIImage(named: self.weaponImages[indexPath.row])!
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
        cell.typeLable.text = weaponTypes[indexPath.row]
        cell.weaponLable.text = weapons[indexPath.row]
        cell.originLable.text = origins[indexPath.row]
        cell.backImageView.image = UIImage(named: weaponImages[indexPath.row])
        cell.favourite = favourites[indexPath.row]

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
