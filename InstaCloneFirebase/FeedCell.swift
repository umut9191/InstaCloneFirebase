//
//  FeedCell.swift
//  InstaCloneFirebase
//
//  Created by Mac on 10.01.2022.
//

import UIKit
import Firebase

class FeedCell: UITableViewCell {
    @IBOutlet weak var txtUserEmail: UILabel!
    @IBOutlet weak var txtComment: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var txtLikeCount: UILabel!
    @IBOutlet weak var txtDocIdFireStore: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func likeButonPressed(_ sender: UIButton) {
        let firestoreDatabase = Firestore.firestore()
        if let likeCount = Int(txtLikeCount.text!) {
            let likeStore = ["likes": likeCount+1] as [String:Any]
            firestoreDatabase.collection("Posts").document(txtDocIdFireStore.text!).setData(likeStore, merge: true)
        }
       
    }
}
