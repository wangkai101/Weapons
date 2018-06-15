//
//  WeaponDetailViewController.swift
//  Weapons
//
//  Created by Mr wngkai on 2018/6/15.
//  Copyright © 2018年 Mr wngkai. All rights reserved.
//

import UIKit

class WeaponDetailViewController: UIViewController {
    var imageName = ""
    

    @IBOutlet weak var headerimageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerimageView.image = UIImage(named: imageName)
        print(imageName)
        
        navigationItem.largeTitleDisplayMode = .never
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
