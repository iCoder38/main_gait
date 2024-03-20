//
//  pdf_gait_comparision.swift
//  GAIT
//
//  Created by Dishant Rajput on 30/10/23.
//  Copyright © 2023 EVS. All rights reserved.
//

import UIKit

class pdf_gait_comparision: UIView {

    @IBOutlet weak var lbl_title_balance:UILabel! {
        didSet {
            lbl_title_balance.text = "Balance / Stability\n\n(Improvement = Greater stability)"
        }
    }
    
    @IBOutlet weak var lbl_title_equality:UILabel! {
        didSet {
            lbl_title_equality.text = "Equality / Symmetry\n\n(Improvement = Similar limb movements observed)"
        }
    }
    
    @IBOutlet weak var lbl_title_energy:UILabel! {
        didSet {
            lbl_title_energy.text = "Energy Consumption\n\n(Improvement = Lower energy used for walking)"
        }
    }
    
    @IBOutlet weak var lbl_title_pregression:UILabel! {
        didSet {
            lbl_title_pregression.text = "Progression\n\n(Improvement = Faster walking speed)"
        }
    }
    
    @IBOutlet weak var lbl_title_shock:UILabel! {
        didSet {
            lbl_title_shock.text = "Shock Absorption\n\n(Improvement = “Normative” joint movement observed during weight transfer)"
        }
    }
    
    @IBOutlet weak var lbl_title_gait:UILabel! {
        didSet {
            lbl_title_gait.text = "Gait Deviations\n\n(Improvement = Fewer deviations observed)"
        }
    }
    
    @IBOutlet weak var lbl_title_stepLength:UILabel! {
        didSet {
            lbl_title_stepLength.text = "Step Length\n\n(Improvement = Greater symmetry in step length)"
        }
    }
    
    @IBOutlet weak var lbl_title_stance_time:UILabel! {
        didSet {
            lbl_title_stance_time.text = "Stance Time\n\n(Improvement = Greater symmetry in stance time)"
        }
    }
    
    @IBOutlet weak var lbl_title_step_width:UILabel! {
        didSet {
            lbl_title_step_width.text = "Step Width\n\n(Improvement = Greater symmetry in stance time)"
        }
    }
    
    @IBOutlet weak var lbl_title_toe:UILabel! {
        didSet {
            lbl_title_toe.text = "Toe Angle\n\n(Improvement = “Normative” toe out angle observed)"
        }
    }
    
    @IBOutlet weak var lbl_recommendation: UILabel!
    
    //UserInfo
    @IBOutlet weak var lblPatName: UILabel!
    @IBOutlet weak var lblPatAge: UILabel!
    @IBOutlet weak var lblPatDiagnosis: UILabel!
    @IBOutlet weak var lblPatObservedSide: UILabel!
    @IBOutlet weak var lblPatPreviusAssessmentDate: UILabel!
    @IBOutlet weak var lblPatCurrentAssessmentDate: UILabel!
    @IBOutlet weak var lblPatWalkingAidUser: UILabel!
    @IBOutlet weak var lblPatCurrentWalkingAidUser: UILabel!
    
    
    @IBOutlet weak var img_balance_significant_decline:UIImageView!
    @IBOutlet weak var img_balance_moderate_decline:UIImageView!
    @IBOutlet weak var img_balance_no_change:UIImageView!
    @IBOutlet weak var img_balance_moderate_significant:UIImageView!
    @IBOutlet weak var img_balance_significant_improvement:UIImageView!
    
    // 2 : equality
    @IBOutlet weak var img_equality_significant_decline:UIImageView!
    @IBOutlet weak var img_equality_moderate_decline:UIImageView!
    @IBOutlet weak var img_equality_no_change:UIImageView!
    @IBOutlet weak var img_equality_moderate_significant:UIImageView!
    @IBOutlet weak var img_equality_significant_improvement:UIImageView!
    
    // 3 : energy
    @IBOutlet weak var img_energy_significant_decline:UIImageView!
    @IBOutlet weak var img_energy_moderate_decline:UIImageView!
    @IBOutlet weak var img_energy_no_change:UIImageView!
    @IBOutlet weak var img_energy_moderate_significant:UIImageView!
    @IBOutlet weak var img_energy_significant_improvement:UIImageView!
    
    // 4 : progression
    @IBOutlet weak var img_progression_significant_decline:UIImageView!
    @IBOutlet weak var img_progression_moderate_decline:UIImageView!
    @IBOutlet weak var img_progression_no_change:UIImageView!
    @IBOutlet weak var img_progression_moderate_significant:UIImageView!
    @IBOutlet weak var img_progression_significant_improvement:UIImageView!
    
    // 5 : shock
    @IBOutlet weak var img_shock_significant_decline:UIImageView!
    @IBOutlet weak var img_shock_moderate_decline:UIImageView!
    @IBOutlet weak var img_shock_no_change:UIImageView!
    @IBOutlet weak var img_shock_moderate_significant:UIImageView!
    @IBOutlet weak var img_shock_significant_improvement:UIImageView!
    
    // 6 : gait deviation
    @IBOutlet weak var img_gait_deviation_significant_decline:UIImageView!
    @IBOutlet weak var img_gait_deviation_moderate_decline:UIImageView!
    @IBOutlet weak var img_gait_deviation_no_change:UIImageView!
    @IBOutlet weak var img_gait_deviation_moderate_significant:UIImageView!
    @IBOutlet weak var img_gait_deviation_significant_improvement:UIImageView!
    
    // 7 : step length
    @IBOutlet weak var img_step_length_significant_decline:UIImageView!
    @IBOutlet weak var img_step_length_moderate_decline:UIImageView!
    @IBOutlet weak var img_step_length_no_change:UIImageView!
    @IBOutlet weak var img_step_length_moderate_significant:UIImageView!
    @IBOutlet weak var img_step_length_significant_improvement:UIImageView!
    
    // 8 : stance time
    @IBOutlet weak var img_stance_time_significant_decline:UIImageView!
    @IBOutlet weak var img_stance_time_moderate_decline:UIImageView!
    @IBOutlet weak var img_stance_time_no_change:UIImageView!
    @IBOutlet weak var img_stance_time_moderate_significant:UIImageView!
    @IBOutlet weak var img_stance_time_significant_improvement:UIImageView!
    
    // 9 : step width
    @IBOutlet weak var img_step_width_significant_decline:UIImageView!
    @IBOutlet weak var img_step_width_moderate_decline:UIImageView!
    @IBOutlet weak var img_step_width_no_change:UIImageView!
    @IBOutlet weak var img_step_width_moderate_significant:UIImageView!
    @IBOutlet weak var img_step_width_significant_improvement:UIImageView!
    
    // 10 : toe angle
    @IBOutlet weak var img_toe_angle_significant_decline:UIImageView!
    @IBOutlet weak var img_toe_angle_moderate_decline:UIImageView!
    @IBOutlet weak var img_toe_angle_no_change:UIImageView!
    @IBOutlet weak var img_toe_angle_moderate_significant:UIImageView!
    @IBOutlet weak var img_toe_angle_significant_improvement:UIImageView!
    
    // 11 : over all
    @IBOutlet weak var img_overall_significant_decline:UIImageView!
    @IBOutlet weak var img_overall_moderate_decline:UIImageView!
    @IBOutlet weak var img_overall_no_change:UIImageView!
    @IBOutlet weak var img_overall_moderate_significant:UIImageView!
    @IBOutlet weak var img_overall_significant_improvement:UIImageView!
    
    
    var check_icon_image = UIImage(named: "check_icon")
    var uncheck_icon_image = UIImage(named: "uncheck_icon")
    
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
       
        if let loadedString = UserDefaults.standard.string(forKey: "key_save_recommendation") {
            // print(loadedString) // "quick_gait_assessment" , "key_gait_comparision"
            
            self.lbl_recommendation.text = String(loadedString)
        }
        
        let normalFont = UIFont(name: "INSERT FONT NAME", size: 15)
        let boldFont = UIFont(name: "INSERT BOLD FONT", size: 15)
        
        //lblPatName.attributedText = addBoldText(fullString: "Check again in 30 DAYS to find more friends", boldPartOfString: "30 DAYS", font: normalFont!, boldFont: boldFont)
        /*
         userInfoData_gait_comparision.removeAllObjects()
         userInfoData_gait_comparision.setObject(self.txtName.text!, forKey: "pName" as NSCopying)
         userInfoData_gait_comparision.setObject(self.txtDOB.text!, forKey: "pDOB" as NSCopying)
         userInfoData_gait_comparision.setObject(self.txtDiagnosis.text!, forKey: "pDiagnosis" as NSCopying)
         userInfoData_gait_comparision.setObject(self.txtSide.text!, forKey: "observedSide" as NSCopying)
         userInfoData_gait_comparision.setObject(self.txtADate.text!, forKey: "assessmentDate" as NSCopying)
         userInfoData_gait_comparision.setObject(self.txtOnsetDate.text!, forKey: "onsetDate" as NSCopying)
         userInfoData_gait_comparision.setObject(self.txtWalkingAid.text!, forKey: "wakingAid" as NSCopying)
         userInfoData_gait_comparision.setObject(self.txtWalkingAid2.text!, forKey: "wakingAid2" as NSCopying)
         */
        
        self.lblPatName.attributedText = NSAttributedString(string: "Assessment Id :", attributes:
            [.underlineStyle: NSUnderlineStyle.single.rawValue])
        self.lblPatAge.attributedText = NSAttributedString(string: "Patient Age : ", attributes:
            [.underlineStyle: NSUnderlineStyle.single.rawValue])
        self.lblPatDiagnosis.attributedText = NSAttributedString(string: "Diagnosis :", attributes:
            [.underlineStyle: NSUnderlineStyle.single.rawValue])
        self.lblPatObservedSide.attributedText = NSAttributedString(string: "Observed Side :", attributes:
            [.underlineStyle: NSUnderlineStyle.single.rawValue])
        self.lblPatPreviusAssessmentDate.attributedText = NSAttributedString(string: "Assessment Date : ", attributes:
            [.underlineStyle: NSUnderlineStyle.single.rawValue])
        self.lblPatCurrentAssessmentDate.attributedText = NSAttributedString(string: "Current Assessment Date :", attributes:
            [.underlineStyle: NSUnderlineStyle.single.rawValue])
        self.lblPatWalkingAidUser.attributedText = NSAttributedString(string: "Walking Aid Used :", attributes:
            [.underlineStyle: NSUnderlineStyle.single.rawValue])
        self.lblPatCurrentWalkingAidUser.attributedText = NSAttributedString(string: "Current Walking Aid Used :", attributes:
            [.underlineStyle: NSUnderlineStyle.single.rawValue])
        
        self.lblPatName.text = "Assessment Id : \(userInfoData_gait_comparision["pName"] as? String ?? "")"
        self.lblPatAge.text = "Patient Age : \(userInfoData_gait_comparision["pDOB"] as? String ?? "")"
        self.lblPatDiagnosis.text = "Diagnosis : \(userInfoData_gait_comparision["pDiagnosis"] as? String ?? "")"
        self.lblPatObservedSide.text = "Observed Side : \(userInfoData_gait_comparision["observedSide"] as? String ?? "")"
        self.lblPatPreviusAssessmentDate.text = "Assessment Date : \(userInfoData_gait_comparision["assessmentDate"] as? String ?? "")"
        self.lblPatCurrentAssessmentDate.text = "Current Assessment Date : \(userInfoData_gait_comparision["onsetDate"] as? String ?? "")"
        self.lblPatWalkingAidUser.text = "Walking Aid Used : \(userInfoData_gait_comparision["wakingAid"] as? String ?? "")"
        self.lblPatCurrentWalkingAidUser.text = "Current Walking Aid Used : \(userInfoData_gait_comparision["wakingAid2"] as? String ?? "")"
        
        // set
        self.set_up_gait_comparision()
    }
    
    func set_up_gait_comparision() {
        
        /*
         @IBOutlet weak var img_balance_significant:UIImageView!
         @IBOutlet weak var img_balance_moderate_decline:UIImageView!
         @IBOutlet weak var img_balance_no_change:UIImageView!
         @IBOutlet weak var img_balance_moderate_significant:UIImageView!
         @IBOutlet weak var img_balance_significant_improvement:UIImageView!
         */
        
        // lblIDSFoot.text   = selectedIDSData["foot"] as? String
        if (select_rate_the_change["balance"] as? String) == "Significant Improvement" {
            
            self.img_balance_significant_decline.image = uncheck_icon_image
            self.img_balance_moderate_decline.image = uncheck_icon_image
            self.img_balance_no_change.image = uncheck_icon_image
            self.img_balance_moderate_significant.image = uncheck_icon_image
            self.img_balance_significant_improvement.image = check_icon_image
            
        } else if (select_rate_the_change["balance"] as? String) == "Moderate Improvement" {
            
            self.img_balance_significant_decline.image = uncheck_icon_image
            self.img_balance_moderate_decline.image = uncheck_icon_image
            self.img_balance_no_change.image = uncheck_icon_image
            self.img_balance_moderate_significant.image = check_icon_image
            self.img_balance_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change["balance"] as? String) == "No Change" {
            
            self.img_balance_significant_decline.image = uncheck_icon_image
            self.img_balance_moderate_decline.image = uncheck_icon_image
            self.img_balance_no_change.image = check_icon_image
            self.img_balance_moderate_significant.image = uncheck_icon_image
            self.img_balance_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change["balance"] as? String) == "Moderate Decline" {
            
            self.img_balance_significant_decline.image = uncheck_icon_image
            self.img_balance_moderate_decline.image = check_icon_image
            self.img_balance_no_change.image = uncheck_icon_image
            self.img_balance_moderate_significant.image = uncheck_icon_image
            self.img_balance_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change["balance"] as? String) == "Significant Decline" {
            
            self.img_balance_significant_decline.image = check_icon_image
            self.img_balance_moderate_decline.image = uncheck_icon_image
            self.img_balance_no_change.image = uncheck_icon_image
            self.img_balance_moderate_significant.image = uncheck_icon_image
            self.img_balance_significant_improvement.image = uncheck_icon_image
            
        } else {
            
            self.img_balance_significant_decline.image = uncheck_icon_image
            self.img_balance_moderate_decline.image = uncheck_icon_image
            self.img_balance_no_change.image = uncheck_icon_image
            self.img_balance_moderate_significant.image = uncheck_icon_image
            self.img_balance_significant_improvement.image = uncheck_icon_image
            
        }
        
        self.check_and_set_quality(type: "equality")
    }
    
    @objc func check_and_set_quality(type:String) {
        if (select_rate_the_change[type] as? String) == "Significant Improvement" {
            
            self.img_equality_significant_decline.image = uncheck_icon_image
            self.img_equality_moderate_decline.image = uncheck_icon_image
            self.img_equality_no_change.image = uncheck_icon_image
            self.img_equality_moderate_significant.image = uncheck_icon_image
            self.img_equality_significant_improvement.image = check_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "Moderate Improvement" {
            
            self.img_equality_significant_decline.image = uncheck_icon_image
            self.img_equality_moderate_decline.image = uncheck_icon_image
            self.img_equality_no_change.image = uncheck_icon_image
            self.img_equality_moderate_significant.image = check_icon_image
            self.img_equality_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "No Change" {
            
            self.img_equality_significant_decline.image = uncheck_icon_image
            self.img_equality_moderate_decline.image = uncheck_icon_image
            self.img_equality_no_change.image = check_icon_image
            self.img_equality_moderate_significant.image = uncheck_icon_image
            self.img_equality_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "Moderate Decline" {
            
            self.img_equality_significant_decline.image = uncheck_icon_image
            self.img_equality_moderate_decline.image = check_icon_image
            self.img_equality_no_change.image = uncheck_icon_image
            self.img_equality_moderate_significant.image = uncheck_icon_image
            self.img_equality_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "Significant Decline" {
            
            self.img_equality_significant_decline.image = check_icon_image
            self.img_equality_moderate_decline.image = uncheck_icon_image
            self.img_equality_no_change.image = uncheck_icon_image
            self.img_equality_moderate_significant.image = uncheck_icon_image
            self.img_equality_significant_improvement.image = uncheck_icon_image
            
        } else {
            
            self.img_equality_significant_decline.image = uncheck_icon_image
            self.img_equality_moderate_decline.image = uncheck_icon_image
            self.img_equality_no_change.image = uncheck_icon_image
            self.img_equality_moderate_significant.image = uncheck_icon_image
            self.img_equality_significant_improvement.image = uncheck_icon_image
            
        }
        
        self.check_and_set_energy(type: "energy")
    }
    
    // # 3 : Energy
    @objc func check_and_set_energy(type:String) {
        if (select_rate_the_change[type] as? String) == "Significant Improvement" {
            
            self.img_energy_significant_decline.image = uncheck_icon_image
            self.img_energy_moderate_decline.image = uncheck_icon_image
            self.img_energy_no_change.image = uncheck_icon_image
            self.img_energy_moderate_significant.image = uncheck_icon_image
            self.img_energy_significant_improvement.image = check_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "Moderate Improvement" {
            
            self.img_energy_significant_decline.image = uncheck_icon_image
            self.img_energy_moderate_decline.image = uncheck_icon_image
            self.img_energy_no_change.image = uncheck_icon_image
            self.img_energy_moderate_significant.image = check_icon_image
            self.img_energy_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "No Change" {
            
            self.img_energy_significant_decline.image = uncheck_icon_image
            self.img_energy_moderate_decline.image = uncheck_icon_image
            self.img_energy_no_change.image = check_icon_image
            self.img_energy_moderate_significant.image = uncheck_icon_image
            self.img_energy_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "Moderate Decline" {
            
            self.img_energy_significant_decline.image = uncheck_icon_image
            self.img_energy_moderate_decline.image = check_icon_image
            self.img_energy_no_change.image = uncheck_icon_image
            self.img_energy_moderate_significant.image = uncheck_icon_image
            self.img_energy_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "Significant Decline" {
            
            self.img_energy_significant_decline.image = check_icon_image
            self.img_energy_moderate_decline.image = uncheck_icon_image
            self.img_energy_no_change.image = uncheck_icon_image
            self.img_energy_moderate_significant.image = uncheck_icon_image
            self.img_energy_significant_improvement.image = uncheck_icon_image
            
        } else {
            
            self.img_energy_significant_decline.image = uncheck_icon_image
            self.img_energy_moderate_decline.image = uncheck_icon_image
            self.img_energy_no_change.image = uncheck_icon_image
            self.img_energy_moderate_significant.image = uncheck_icon_image
            self.img_energy_significant_improvement.image = uncheck_icon_image
            
        }
        
        //
        self.check_and_set_progression(type: "progression")
    }
    
    // # 4 : Progression
    @objc func check_and_set_progression(type:String) {
        if (select_rate_the_change[type] as? String) == "Significant Improvement" {
            
            self.img_progression_significant_decline.image = uncheck_icon_image
            self.img_progression_moderate_decline.image = uncheck_icon_image
            self.img_progression_no_change.image = uncheck_icon_image
            self.img_progression_moderate_significant.image = uncheck_icon_image
            self.img_progression_significant_improvement.image = check_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "Moderate Improvement" {
            
            self.img_progression_significant_decline.image = uncheck_icon_image
            self.img_progression_moderate_decline.image = uncheck_icon_image
            self.img_progression_no_change.image = uncheck_icon_image
            self.img_progression_moderate_significant.image = check_icon_image
            self.img_progression_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "No Change" {
            
            self.img_progression_significant_decline.image = uncheck_icon_image
            self.img_progression_moderate_decline.image = uncheck_icon_image
            self.img_progression_no_change.image = check_icon_image
            self.img_progression_moderate_significant.image = uncheck_icon_image
            self.img_progression_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "Moderate Decline" {
            
            self.img_progression_significant_decline.image = uncheck_icon_image
            self.img_progression_moderate_decline.image = check_icon_image
            self.img_progression_no_change.image = uncheck_icon_image
            self.img_progression_moderate_significant.image = uncheck_icon_image
            self.img_progression_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "Significant Decline" {
            
            self.img_progression_significant_decline.image = check_icon_image
            self.img_progression_moderate_decline.image = uncheck_icon_image
            self.img_progression_no_change.image = uncheck_icon_image
            self.img_progression_moderate_significant.image = uncheck_icon_image
            self.img_progression_significant_improvement.image = uncheck_icon_image
            
        } else {
            
            self.img_progression_significant_decline.image = uncheck_icon_image
            self.img_progression_moderate_decline.image = uncheck_icon_image
            self.img_progression_no_change.image = uncheck_icon_image
            self.img_progression_moderate_significant.image = uncheck_icon_image
            self.img_progression_significant_improvement.image = uncheck_icon_image
            
        }
        
        //
        self.check_and_set_shock_absorption(type: "shock")
    }
    
    // # 5 : shock absorption
    @objc func check_and_set_shock_absorption(type:String) {
        if (select_rate_the_change[type] as? String) == "Significant Improvement" {
            
            self.img_shock_significant_decline.image = uncheck_icon_image
            self.img_shock_moderate_decline.image = uncheck_icon_image
            self.img_shock_no_change.image = uncheck_icon_image
            self.img_shock_moderate_significant.image = uncheck_icon_image
            self.img_shock_significant_improvement.image = check_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "Moderate Improvement" {
            
            self.img_shock_significant_decline.image = uncheck_icon_image
            self.img_shock_moderate_decline.image = uncheck_icon_image
            self.img_shock_no_change.image = uncheck_icon_image
            self.img_shock_moderate_significant.image = check_icon_image
            self.img_shock_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "No Change" {
            
            self.img_shock_significant_decline.image = uncheck_icon_image
            self.img_shock_moderate_decline.image = uncheck_icon_image
            self.img_shock_no_change.image = check_icon_image
            self.img_shock_moderate_significant.image = uncheck_icon_image
            self.img_shock_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "Moderate Decline" {
            
            self.img_shock_significant_decline.image = uncheck_icon_image
            self.img_shock_moderate_decline.image = check_icon_image
            self.img_shock_no_change.image = uncheck_icon_image
            self.img_shock_moderate_significant.image = uncheck_icon_image
            self.img_shock_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "Significant Decline" {
            
            self.img_shock_significant_decline.image = check_icon_image
            self.img_shock_moderate_decline.image = uncheck_icon_image
            self.img_shock_no_change.image = uncheck_icon_image
            self.img_shock_moderate_significant.image = uncheck_icon_image
            self.img_shock_significant_improvement.image = uncheck_icon_image
            
        } else {
            
            self.img_shock_significant_decline.image = uncheck_icon_image
            self.img_shock_moderate_decline.image = uncheck_icon_image
            self.img_shock_no_change.image = uncheck_icon_image
            self.img_shock_moderate_significant.image = uncheck_icon_image
            self.img_shock_significant_improvement.image = uncheck_icon_image
            
        }
        
        // 
        self.check_and_set_gait_deviation(type: "gait")
    }
    
    // # 6 : gait deviation
    @objc func check_and_set_gait_deviation(type:String) {
        if (select_rate_the_change[type] as? String) == "Significant Improvement" {
            
            self.img_gait_deviation_significant_decline.image = uncheck_icon_image
            self.img_gait_deviation_moderate_decline.image = uncheck_icon_image
            self.img_gait_deviation_no_change.image = uncheck_icon_image
            self.img_gait_deviation_moderate_significant.image = uncheck_icon_image
            self.img_gait_deviation_significant_improvement.image = check_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "Moderate Improvement" {
            
            self.img_gait_deviation_significant_decline.image = uncheck_icon_image
            self.img_gait_deviation_moderate_decline.image = uncheck_icon_image
            self.img_gait_deviation_no_change.image = uncheck_icon_image
            self.img_gait_deviation_moderate_significant.image = check_icon_image
            self.img_gait_deviation_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "No Change" {
            
            self.img_gait_deviation_significant_decline.image = uncheck_icon_image
            self.img_gait_deviation_moderate_decline.image = uncheck_icon_image
            self.img_gait_deviation_no_change.image = check_icon_image
            self.img_gait_deviation_moderate_significant.image = uncheck_icon_image
            self.img_gait_deviation_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "Moderate Decline" {
            
            self.img_gait_deviation_significant_decline.image = uncheck_icon_image
            self.img_gait_deviation_moderate_decline.image = check_icon_image
            self.img_gait_deviation_no_change.image = uncheck_icon_image
            self.img_gait_deviation_moderate_significant.image = uncheck_icon_image
            self.img_gait_deviation_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "Significant Decline" {
            
            self.img_gait_deviation_significant_decline.image = check_icon_image
            self.img_gait_deviation_moderate_decline.image = uncheck_icon_image
            self.img_gait_deviation_no_change.image = uncheck_icon_image
            self.img_gait_deviation_moderate_significant.image = uncheck_icon_image
            self.img_gait_deviation_significant_improvement.image = uncheck_icon_image
            
        } else {
            
            self.img_gait_deviation_significant_decline.image = uncheck_icon_image
            self.img_gait_deviation_moderate_decline.image = uncheck_icon_image
            self.img_gait_deviation_no_change.image = uncheck_icon_image
            self.img_gait_deviation_moderate_significant.image = uncheck_icon_image
            self.img_gait_deviation_significant_improvement.image = uncheck_icon_image
            
        }
        
        //
        self.check_and_set_step_length(type: "stepLength")
    }
    
    // # 7 : step length
    @objc func check_and_set_step_length(type:String) {
        if (select_rate_the_change[type] as? String) == "Significant Improvement" {
            
            self.img_step_length_significant_decline.image = uncheck_icon_image
            self.img_step_length_moderate_decline.image = uncheck_icon_image
            self.img_step_length_no_change.image = uncheck_icon_image
            self.img_step_length_moderate_significant.image = uncheck_icon_image
            self.img_step_length_significant_improvement.image = check_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "Moderate Improvement" {
            
            self.img_step_length_significant_decline.image = uncheck_icon_image
            self.img_step_length_moderate_decline.image = uncheck_icon_image
            self.img_step_length_no_change.image = uncheck_icon_image
            self.img_step_length_moderate_significant.image = check_icon_image
            self.img_step_length_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "No Change" {
            
            self.img_step_length_significant_decline.image = uncheck_icon_image
            self.img_step_length_moderate_decline.image = uncheck_icon_image
            self.img_step_length_no_change.image = check_icon_image
            self.img_step_length_moderate_significant.image = uncheck_icon_image
            self.img_step_length_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "Moderate Decline" {
            
            self.img_step_length_significant_decline.image = uncheck_icon_image
            self.img_step_length_moderate_decline.image = check_icon_image
            self.img_step_length_no_change.image = uncheck_icon_image
            self.img_step_length_moderate_significant.image = uncheck_icon_image
            self.img_step_length_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "Significant Decline" {
            
            self.img_step_length_significant_decline.image = check_icon_image
            self.img_step_length_moderate_decline.image = uncheck_icon_image
            self.img_step_length_no_change.image = uncheck_icon_image
            self.img_step_length_moderate_significant.image = uncheck_icon_image
            self.img_step_length_significant_improvement.image = uncheck_icon_image
            
        } else {
            
            self.img_step_length_significant_decline.image = uncheck_icon_image
            self.img_step_length_moderate_decline.image = uncheck_icon_image
            self.img_step_length_no_change.image = uncheck_icon_image
            self.img_step_length_moderate_significant.image = uncheck_icon_image
            self.img_step_length_significant_improvement.image = uncheck_icon_image
            
        }
        
        
        //
        self.check_and_set_stance_time(type: "stance")
    }
    
    // # 8 : stance time
    @objc func check_and_set_stance_time(type:String) {
        if (select_rate_the_change[type] as? String) == "Significant Improvement" {
            
            self.img_stance_time_significant_decline.image = uncheck_icon_image
            self.img_stance_time_moderate_decline.image = uncheck_icon_image
            self.img_stance_time_no_change.image = uncheck_icon_image
            self.img_stance_time_moderate_significant.image = uncheck_icon_image
            self.img_stance_time_significant_improvement.image = check_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "Moderate Improvement" {
            
            self.img_stance_time_significant_decline.image = uncheck_icon_image
            self.img_stance_time_moderate_decline.image = uncheck_icon_image
            self.img_stance_time_no_change.image = uncheck_icon_image
            self.img_stance_time_moderate_significant.image = check_icon_image
            self.img_stance_time_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "No Change" {
            
            self.img_stance_time_significant_decline.image = uncheck_icon_image
            self.img_stance_time_moderate_decline.image = uncheck_icon_image
            self.img_stance_time_no_change.image = check_icon_image
            self.img_stance_time_moderate_significant.image = uncheck_icon_image
            self.img_stance_time_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "Moderate Decline" {
            
            self.img_stance_time_significant_decline.image = uncheck_icon_image
            self.img_stance_time_moderate_decline.image = check_icon_image
            self.img_stance_time_no_change.image = uncheck_icon_image
            self.img_stance_time_moderate_significant.image = uncheck_icon_image
            self.img_stance_time_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "Significant Decline" {
            
            self.img_stance_time_significant_decline.image = check_icon_image
            self.img_stance_time_moderate_decline.image = uncheck_icon_image
            self.img_stance_time_no_change.image = uncheck_icon_image
            self.img_stance_time_moderate_significant.image = uncheck_icon_image
            self.img_stance_time_significant_improvement.image = uncheck_icon_image
            
        } else {
            
            self.img_stance_time_significant_decline.image = uncheck_icon_image
            self.img_stance_time_moderate_decline.image = uncheck_icon_image
            self.img_stance_time_no_change.image = uncheck_icon_image
            self.img_stance_time_moderate_significant.image = uncheck_icon_image
            self.img_stance_time_significant_improvement.image = uncheck_icon_image
            
        }
        
        //
        self.check_and_set_step_width(type: "stepWidth")
    }
    
    // # 9 : step width
    @objc func check_and_set_step_width(type:String) {
        if (select_rate_the_change[type] as? String) == "Significant Improvement" {
            
            self.img_step_width_significant_decline.image = uncheck_icon_image
            self.img_step_width_moderate_decline.image = uncheck_icon_image
            self.img_step_width_no_change.image = uncheck_icon_image
            self.img_step_width_moderate_significant.image = uncheck_icon_image
            self.img_step_width_significant_improvement.image = check_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "Moderate Improvement" {
            
            self.img_step_width_significant_decline.image = uncheck_icon_image
            self.img_step_width_moderate_decline.image = uncheck_icon_image
            self.img_step_width_no_change.image = uncheck_icon_image
            self.img_step_width_moderate_significant.image = check_icon_image
            self.img_step_width_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "No Change" {
            
            self.img_step_width_significant_decline.image = uncheck_icon_image
            self.img_step_width_moderate_decline.image = uncheck_icon_image
            self.img_step_width_no_change.image = check_icon_image
            self.img_step_width_moderate_significant.image = uncheck_icon_image
            self.img_step_width_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "Moderate Decline" {
            
            self.img_step_width_significant_decline.image = uncheck_icon_image
            self.img_step_width_moderate_decline.image = check_icon_image
            self.img_step_width_no_change.image = uncheck_icon_image
            self.img_step_width_moderate_significant.image = uncheck_icon_image
            self.img_step_width_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "Significant Decline" {
            
            self.img_step_width_significant_decline.image = check_icon_image
            self.img_step_width_moderate_decline.image = uncheck_icon_image
            self.img_step_width_no_change.image = uncheck_icon_image
            self.img_step_width_moderate_significant.image = uncheck_icon_image
            self.img_step_width_significant_improvement.image = uncheck_icon_image
            
        } else {
            
            self.img_step_width_significant_decline.image = uncheck_icon_image
            self.img_step_width_moderate_decline.image = uncheck_icon_image
            self.img_step_width_no_change.image = uncheck_icon_image
            self.img_step_width_moderate_significant.image = uncheck_icon_image
            self.img_step_width_significant_improvement.image = uncheck_icon_image
            
        }
        
        //
        self.check_and_set_toe_angle(type: "toe")
    }
    
    
    // # 10 : toe angle
    @objc func check_and_set_toe_angle(type:String) {
        if (select_rate_the_change[type] as? String) == "Significant Improvement" {
            
            self.img_toe_angle_significant_decline.image = uncheck_icon_image
            self.img_toe_angle_moderate_decline.image = uncheck_icon_image
            self.img_toe_angle_no_change.image = uncheck_icon_image
            self.img_toe_angle_moderate_significant.image = uncheck_icon_image
            self.img_toe_angle_significant_improvement.image = check_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "Moderate Improvement" {
            
            self.img_toe_angle_significant_decline.image = uncheck_icon_image
            self.img_toe_angle_moderate_decline.image = uncheck_icon_image
            self.img_toe_angle_no_change.image = uncheck_icon_image
            self.img_toe_angle_moderate_significant.image = check_icon_image
            self.img_toe_angle_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "No Change" {
            
            self.img_toe_angle_significant_decline.image = uncheck_icon_image
            self.img_toe_angle_moderate_decline.image = uncheck_icon_image
            self.img_toe_angle_no_change.image = check_icon_image
            self.img_toe_angle_moderate_significant.image = uncheck_icon_image
            self.img_toe_angle_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "Moderate Decline" {
            
            self.img_toe_angle_significant_decline.image = uncheck_icon_image
            self.img_toe_angle_moderate_decline.image = check_icon_image
            self.img_toe_angle_no_change.image = uncheck_icon_image
            self.img_toe_angle_moderate_significant.image = uncheck_icon_image
            self.img_toe_angle_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "Significant Decline" {
            
            self.img_toe_angle_significant_decline.image = check_icon_image
            self.img_toe_angle_moderate_decline.image = uncheck_icon_image
            self.img_toe_angle_no_change.image = uncheck_icon_image
            self.img_toe_angle_moderate_significant.image = uncheck_icon_image
            self.img_toe_angle_significant_improvement.image = uncheck_icon_image
            
        } else {
            
            self.img_toe_angle_significant_decline.image = uncheck_icon_image
            self.img_toe_angle_moderate_decline.image = uncheck_icon_image
            self.img_toe_angle_no_change.image = uncheck_icon_image
            self.img_toe_angle_moderate_significant.image = uncheck_icon_image
            self.img_toe_angle_significant_improvement.image = uncheck_icon_image
            
        }
        
        //
        self.check_and_set_overall(type: "overall")
    }
    
    // # 11 : overall
    @objc func check_and_set_overall(type:String) {
        if (select_rate_the_change[type] as? String) == "Significant Improvement" {
            
            self.img_overall_significant_decline.image = uncheck_icon_image
            self.img_overall_moderate_decline.image = uncheck_icon_image
            self.img_overall_no_change.image = uncheck_icon_image
            self.img_overall_moderate_significant.image = uncheck_icon_image
            self.img_overall_significant_improvement.image = check_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "Moderate Improvement" {
            
            self.img_overall_significant_decline.image = uncheck_icon_image
            self.img_overall_moderate_decline.image = uncheck_icon_image
            self.img_overall_no_change.image = uncheck_icon_image
            self.img_overall_moderate_significant.image = check_icon_image
            self.img_overall_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "No Change" {
            
            self.img_overall_significant_decline.image = uncheck_icon_image
            self.img_overall_moderate_decline.image = uncheck_icon_image
            self.img_overall_no_change.image = check_icon_image
            self.img_overall_moderate_significant.image = uncheck_icon_image
            self.img_overall_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "Moderate Decline" {
            
            self.img_overall_significant_decline.image = uncheck_icon_image
            self.img_overall_moderate_decline.image = check_icon_image
            self.img_overall_no_change.image = uncheck_icon_image
            self.img_overall_moderate_significant.image = uncheck_icon_image
            self.img_overall_significant_improvement.image = uncheck_icon_image
            
        } else if (select_rate_the_change[type] as? String) == "Significant Decline" {
            
            self.img_overall_significant_decline.image = check_icon_image
            self.img_overall_moderate_decline.image = uncheck_icon_image
            self.img_overall_no_change.image = uncheck_icon_image
            self.img_overall_moderate_significant.image = uncheck_icon_image
            self.img_overall_significant_improvement.image = uncheck_icon_image
            
        } else {
            
            self.img_overall_significant_decline.image = uncheck_icon_image
            self.img_overall_moderate_decline.image = uncheck_icon_image
            self.img_overall_no_change.image = uncheck_icon_image
            self.img_overall_moderate_significant.image = uncheck_icon_image
            self.img_overall_significant_improvement.image = uncheck_icon_image
            
        }
    }
    
}
