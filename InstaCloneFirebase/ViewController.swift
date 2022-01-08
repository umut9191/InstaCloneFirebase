//
//  ViewController.swift
//  InstaCloneFirebase
//
//  Created by Mac on 6.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func signInButonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toFeedVC", sender: nil)
    }
    
    @IBAction func SignUpButtonPressed(_ sender: UIButton) {
    }
}

