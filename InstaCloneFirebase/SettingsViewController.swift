//
//  SettingsViewController.swift
//  InstaCloneFirebase
//
//  Created by Mac on 8.01.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutButonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toFirstVC", sender: nil)
    }

}
