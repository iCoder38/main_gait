//
//  CustomTableViewCell.swift
//  GAIT
//
//  Created by Shyam on 05/11/20.
//  Copyright © 2020 EVS. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblTitleName: UILabel!
    @IBOutlet weak var btnArrow: UIButton!
    @IBOutlet weak var btnIndex: UIButton!{
        didSet{
            btnIndex.layer.cornerRadius = btnIndex.frame.width/2
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}


class MultipleSelectionTblCell: UITableViewCell {

    @IBOutlet weak var lblTitleName: UILabel!
    @IBOutlet weak var btnSelect: UIButton!
    
    @IBOutlet weak var btn_info: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        if self.isSelected {
            self.btnSelect.isSelected = true
            self.btnSelect.tintColor = UIColor.appGreenColors()
        }else {
            self.btnSelect.isSelected = false
            self.btnSelect.tintColor = UIColor.appLightGrayColors()
        }
    }
}


class SectionTblCell: UITableViewCell {

    @IBOutlet weak var lblSectionName: UILabel!
    @IBOutlet weak var secionView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
