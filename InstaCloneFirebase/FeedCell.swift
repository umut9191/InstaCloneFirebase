//
//  FeedCell.swift
//  InstaCloneFirebase
//
//  Created by Mac on 10.01.2022.
//

import UIKit

class FeedCell: UITableViewCell {
    @IBOutlet weak var txtUserEmail: UILabel!
    @IBOutlet weak var txtComment: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var txtLikeCount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func likeButonPressed(_ sender: UIButton) {
        
    }
}
