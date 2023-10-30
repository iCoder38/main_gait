//
//  pdf_gait_comparision.swift
//  GAIT
//
//  Created by Dishant Rajput on 30/10/23.
//  Copyright © 2023 EVS. All rights reserved.
//

import UIKit

class pdf_gait_comparision: UIView {

    //UserInfo
    @IBOutlet weak var lblPatName: UILabel!
    @IBOutlet weak var lblPatDob: UILabel!
    @IBOutlet weak var lblPatDogno: UILabel!
    @IBOutlet weak var lblPatSide: UILabel!
    @IBOutlet weak var lblPatAssDate: UILabel!
    @IBOutlet weak var lblPatOnsetDate: UILabel!
    @IBOutlet weak var lblPatGoal: UILabel!
    @IBOutlet weak var lblPatWalkerAid: UILabel!
    
    internal func setupViewContent() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        /*
         if let dateLabel = self.dateLabel {
         dateLabel.text = dateFormatter.string(from: NSDate() as Date)
         }
         */
        self.setUpData()
    }
    
    func setUpData() {
        self.setUpUserDataForGaitComparision()
    }
    
    // MARK: - GAIT COMPARISION -
    func setUpUserDataForGaitComparision() {
       
        let normalFont = UIFont(name: "INSERT FONT NAME", size: 15)
        let boldFont = UIFont(name: "INSERT BOLD FONT", size: 15)
        
        //lblPatName.attributedText = addBoldText(fullString: "Check again in 30 DAYS to find more friends", boldPartOfString: "30 DAYS", font: normalFont!, boldFont: boldFont)
        
        lblPatName.text = "Patient Id : \(userInfoData["pName"] as? String ?? "")"
        lblPatDob.text = "Patient Age : \(userInfoData["pDOB"] as? String ?? "")"
        lblPatDogno.text = "Diagnosis : \(userInfoData["pDiagnosis"] as? String ?? "")"
        lblPatSide.text = "Observed Side : \(userInfoData["observedSide"] as? String ?? "")"
        lblPatAssDate.text = "Assessment Date : \(userInfoData["assessmentDate"] as? String ?? "")"
        lblPatOnsetDate.text = "Onset of Injury/Illness : \(userInfoData["onsetDate"] as? String ?? "")"
        //lblPatGoal.text = "PATIENT GOAL /n\(userInfoData["pGoal"] as? String ?? "")"
        // lblPatGoal.text = "\(userInfoData["pGoal"] as? String ?? "")"
        lblPatWalkerAid.text = "Walking Aid : \(userInfoData["wakingAid"] as? String ?? "")"
    }
}
