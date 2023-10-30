//
//  recommendation.swift
//  GAIT
//
//  Created by Dishant Rajput on 30/10/23.
//  Copyright © 2023 EVS. All rights reserved.
//

import UIKit

class recommendation: BaseViewController {

    @IBOutlet weak var txt_view:UITextView! {
        didSet {
            txt_view.layer.borderWidth = 1
            txt_view.layer.borderColor = UIColor.gray.cgColor
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNavigationWithBack(titleStr: navigationTitle.recommendation)
    }
    
    @IBAction func tapContinueBtn(_ sender : UIButton){
       
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "CongratulationsTwoId") as! CongratulationsTwo
        self.navigationController?.pushViewController(pushVC, animated: true)
        
    }
    
}
