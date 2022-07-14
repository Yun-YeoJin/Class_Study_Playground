//
//  MenuCell.swift
//  Setting_Clone_App
//
//  Created by 윤여진 on 2022/06/28.
//

import UIKit

class MenuCell: UITableViewCell {

   
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var middleTitle: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

  
    }
    
}
