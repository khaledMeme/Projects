//
//  MessageCell.swift
//  Flash Chat
//
//  Created by Khaled Meme on 2/12/20.
//  Copyright © 2020 Khaled Meme. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var messageBody: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        messageBody.layer.cornerRadius = messageBody.frame.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
