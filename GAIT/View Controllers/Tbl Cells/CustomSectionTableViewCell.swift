//
//  CustomSectionTableViewCell.swift
//  GAIT
//
//  Created by Shyam on 06/11/20.
//  Copyright © 2020 EVS. All rights reserved.
//

import UIKit

class CustomSectionTableViewCell: UITableViewCell {

    @IBOutlet weak var lblSectionName: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
