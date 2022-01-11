//
//  FeedViewController.swift
//  InstaCloneFirebase
//
//  Created by Mac on 8.01.2022.
//

import UIKit
import Firebase

class FeedViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    var postedDatas=[PostedModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        // Do any additional setup after loading the view.
        getDataFromFirestore()
    }
    
    func getDataFromFirestore(){
        let fireStoreDatabase = Firestore.firestore()
        //we will add some settings for using date file inside firestore;
        //here because of deprecated we dont need to use this following
//        let settings = fireStoreDatabase.settings
//        settings.areTimestampsInSnapshotsEnabled = true
//        fireStoreDatabase.settings = settings
        //
        fireStoreDatabase.collection("Posts").addSnapshotListener { (snapshot, error) in
            if error != nil {
                self.callAlert(title: "Error", message: error?.localizedDescription ?? " ")
            }else{
                if snapshot?.isEmpty != true || snapshot != nil{
                    for docs in   snapshot!.documents {
                      // var posted=PostedModel()
                        //let docId = docs.documentID
                        //print(docId)
                        if let postedBy = docs.get("postedBy") as? String ,let postedComment = docs.get("postComment") as? String ,let imageUrl = docs.get("imageUrl") as? String, let likes = docs.get("likes") as? Int{
                           // ,let date = docs.get("date") as? Date
                           // print(postedBy)
//                            posted.postedBy=postedBy
//                            posted.postComment = postedComment
//                            posted.imageUrl = imageUrl
//                            posted.date = date
                            self.postedDatas.append(PostedModel(postedBy: postedBy, postComment: postedComment, likes: likes,imageUrl: imageUrl))
                        }
                    
                    }
                    self.myTableView.reloadData()
                }
                
            }
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell",for: indexPath) as! FeedCell
        if postedDatas.count > 0 {
        cell.txtUserEmail.text = postedDatas[indexPath.row].postedBy
        cell.txtComment.text = postedDatas[indexPath.row].postComment
        cell.txtLikeCount.text = String(postedDatas[indexPath.row].likes)
        cell.userImage.image = UIImage(named: "selectImage")
        }

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postedDatas.count
    }
    func callAlert(title:String,message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let button = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(button)
        self.present(alert, animated: true, completion: nil)
    }
}
