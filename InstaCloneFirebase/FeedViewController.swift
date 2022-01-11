//
//  FeedViewController.swift
//  InstaCloneFirebase
//
//  Created by Mac on 8.01.2022.
//

import UIKit

class FeedViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell",for: indexPath) as! FeedCell
        cell.txtUserEmail.text = "u@u.com"
        cell.txtComment.text = "bişeyler"
        cell.txtLikeCount.text = "0"
        cell.userImage.image = UIImage(named: "selectImage")
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

}
