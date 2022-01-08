//
//  SettingsViewController.swift
//  InstaCloneFirebase
//
//  Created by Mac on 8.01.2022.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutButonPressed(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
        } catch  {
            callAlert(title: "Error", message: error.localizedDescription)
        }
        
        
        performSegue(withIdentifier: "toFirstVC", sender: nil)
    }
    func callAlert(title:String,message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let button = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(button)
        self.present(alert, animated: true, completion: nil)
    }

}
