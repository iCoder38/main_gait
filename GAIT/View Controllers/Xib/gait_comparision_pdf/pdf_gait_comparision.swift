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
        self.check_and_set_step_width(type: "toe")
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
    }
}
