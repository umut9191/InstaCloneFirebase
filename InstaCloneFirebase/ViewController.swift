//
//  ViewController.swift
//  InstaCloneFirebase
//
//  Created by Mac on 6.01.2022.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func signInButonPressed(_ sender: UIButton) {
        //firebase sign in user
        if txtEmail.text != "" && txtPassword.text != ""  {
            Auth.auth().signIn(withEmail: txtEmail.text!, password: txtPassword.text!) { (authData, error) in
                if error != nil {
                    self.callAlert(title: "Error", message: error?.localizedDescription ?? "error")
                }else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }
        else {
            callAlert(title: "Error", message: "username and password can not be empty!")
        }
    }
    
    @IBAction func SignUpButtonPressed(_ sender: UIButton) {
        //firebase create new user
        if txtEmail.text != "" && txtPassword.text != ""  {
            Auth.auth().createUser(withEmail: txtEmail.text!, password: txtPassword.text!) { (authData, error) in
                if error != nil {
                    self.callAlert(title: "Error", message: error?.localizedDescription ?? "error")
                }else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }
        else {
            callAlert(title: "Error", message: "username and password can not be empty!")
        }
    }
    
    func callAlert(title:String,message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let button = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(button)
        self.present(alert, animated: true, completion: nil)
    }
}

