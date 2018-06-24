//
//  NewWeaponController.swift
//  Weapons
//
//  Created by Mr wngkai on 2018/6/24.
//  Copyright © 2018年 Mr wngkai. All rights reserved.
//

import UIKit

class NewWeaponController: UITableViewController {
    
    var origin = [Origin]()
    var specs :  WeaponSpacs!
    
    
    @IBOutlet weak var textFieldMv: UITextField!
    
    @IBAction func tapStepper(_ sender: UIStepper) {
        
        textFieldMv.text = Int(exactly: sender.value)!.description
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        loadJson()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadJson() {
        let coder = JSONDecoder()
        
        do {
            let url1 = Bundle.main.url(forResource: "origin", withExtension: ".json")!
            let url2 = Bundle.main.url(forResource: "weaponSpecs", withExtension: ".json")!
            
            let data1 = try Data(contentsOf: url1)
            let data2 = try Data(contentsOf: url2)
            
            origin = try coder.decode([Origin].self, from: data1)
            specs = try coder.decode(WeaponSpacs.self, from: data2)
            
            print("载入数据成功！")
        } catch  {
            print(error)
        }
        
    }
    // MARK: - Table view data source

   

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
