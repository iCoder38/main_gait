//
//  pdf_syance_phase.swift
//  GAIT
//
//  Created by Dishant Rajput on 27/10/23.
//  Copyright © 2023 EVS. All rights reserved.
//

import UIKit

class pdf_syance_phase: UIView {
    
    //UserInfo
    @IBOutlet weak var lblPatName: UILabel!
    @IBOutlet weak var lblPatDob: UILabel!
    @IBOutlet weak var lblPatDogno: UILabel!
    @IBOutlet weak var lblPatSide: UILabel!
    @IBOutlet weak var lblPatAssDate: UILabel!
    @IBOutlet weak var lblPatOnsetDate: UILabel!
    @IBOutlet weak var lblPatGoal: UILabel!
    @IBOutlet weak var lblPatWalkerAid: UILabel!
    
    //Table_IDS_Data
    @IBOutlet weak var lblIDSFoot: UILabel!
    @IBOutlet weak var lblIDSAnkle: UILabel!
    @IBOutlet weak var lblIDSKnee: UILabel!
    @IBOutlet weak var lblIDSHip: UILabel!
    @IBOutlet weak var lblIDSPelivs: UILabel!
    @IBOutlet weak var lblIDSTrunk: UILabel!
    
    //Table_SS_Data
    @IBOutlet weak var lblSSFoot: UILabel!
    @IBOutlet weak var lblSSAnkle: UILabel!
    @IBOutlet weak var lblSSKneee: UILabel!
    @IBOutlet weak var lblSSHip: UILabel!
    @IBOutlet weak var lblSSPelivs: UILabel!
    @IBOutlet weak var lblSSTrunk: UILabel!
    
    //Table_TDS_Data
    @IBOutlet weak var lblTDSFoot: UILabel!
    @IBOutlet weak var lblTDSAnkle: UILabel!
    @IBOutlet weak var lblTDSKnee: UILabel!
    @IBOutlet weak var lblTDSHip: UILabel!
    @IBOutlet weak var lblTDSPelivs: UILabel!
    @IBOutlet weak var lblTDSTrunk: UILabel!
    
    //Table_Swing_Data
    @IBOutlet weak var lblSwingFoot: UILabel!
    @IBOutlet weak var lblSwingAnkle: UILabel!
    @IBOutlet weak var lblSwingKnee: UILabel!
    @IBOutlet weak var lblSWingHip: UILabel!
    @IBOutlet weak var lblSwingPelivs: UILabel!
    @IBOutlet weak var lblSwingTrunk: UILabel!
     
    //Table_Swing_Data
    @IBOutlet weak var lbl_stance_phase_Foot: UILabel!
    @IBOutlet weak var lbl_stance_phase_Ankle: UILabel!
    @IBOutlet weak var lbl_stance_phase_Knee: UILabel!
    @IBOutlet weak var lbl_stance_phase_Hip: UILabel!
    @IBOutlet weak var lbl_stance_phase_Pelivs: UILabel!
    @IBOutlet weak var lbl_stance_phase_Trunk: UILabel!
    
    //Table_IDS_Data
    @IBOutlet weak var lblLength: UILabel!
    @IBOutlet weak var lblWidth: UILabel!
    @IBOutlet weak var lblAngle: UILabel!
    @IBOutlet weak var lblSwing: UILabel!
    @IBOutlet weak var lblStanceTime: UILabel!
    
    @IBOutlet weak var lblIntervFoucs: UILabel!
    @IBOutlet weak var lblTreatmentGoal: UILabel!
    @IBOutlet weak var lblNotes: UILabel!
    
    /*@IBOutlet weak var stack_one:UIStackView!
    @IBOutlet weak var stack_two:UIStackView!
    @IBOutlet weak var stack_three:UIStackView!
    @IBOutlet weak var stack_four:UIStackView!
    @IBOutlet weak var stack_five:UIStackView!*/
    
    internal func setupViewContent() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
       
        self.setUpData()
    }
    
    func setUpData() {
        
        /*self.stack_one.isHidden = true
        self.stack_two.isHidden = true
        self.stack_three.isHidden = true*/
        
        self.setUpUserData()
        // self.setUpIDSData()
        // self.setUpSSData()
        // self.setUpTDSData()
        self.setUpSwingData()
        self.setUpFocusData()
        self.setUp_stance_phase()
        
        print(self.setUpSwingData as Any)
        
    }
    
    func setUpUserData() {
        // var normalText = "Hi am normal"
        // var boldText  = "And I am BOLD!"
        // var attributedString = NSMutableAttributedString(string:normalText)
        // var attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12)]
        // var boldString = NSMutableAttributedString(string: boldText, attributes:attrs)
        // attributedString.append(boldString)
        // lblPatName.attributedText = (NSMutableAttributedString().bold("Patient Name : ") as AnyObject).underlined(userInfoData["pName"] as? String ?? "")
        // let pName = NSAttributedString(string: userInfoData["pName"] as? String ?? "", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        
        
        //Mark: Albeit that you've had to define these somewhere:

        let normalFont = UIFont(name: "INSERT FONT NAME", size: 15)
        let boldFont = UIFont(name: "INSERT BOLD FONT", size: 15)
        
        //lblPatName.attributedText = addBoldText(fullString: "Check again in 30 DAYS to find more friends", boldPartOfString: "30 DAYS", font: normalFont!, boldFont: boldFont)
        
        lblPatName.text = "Patient Id : \(userInfoData["pName"] as? String ?? "")"
        // lblPatDob.text = "Patient Age : \(userInfoData["pDOB"] as? String ?? "")"
        // lblPatDogno.text = "Diagnosis : \(userInfoData["pDiagnosis"] as? String ?? "")"
        lblPatSide.text = "Observed Side : \(userInfoData["observedSide"] as? String ?? "")"
        // lblPatAssDate.text = "Assessment Date : \(userInfoData["assessmentDate"] as? String ?? "")"
        // lblPatOnsetDate.text = "Onset of Injury/Illness : \(userInfoData["onsetDate"] as? String ?? "")"
        //lblPatGoal.text = "PATIENT GOAL /n\(userInfoData["pGoal"] as? String ?? "")"
        // lblPatGoal.text = "\(userInfoData["pGoal"] as? String ?? "")"
        lblPatWalkerAid.text = "Walking Aid : \(userInfoData["wakingAid"] as? String ?? "")"
    }
    
    func setUpIDSData() {
        lblIDSFoot.text   = selectedIDSData["foot"] as? String
        lblIDSAnkle.text  = selectedIDSData["ankle"] as? String
        lblIDSKnee.text   = selectedIDSData["knee"] as? String
        lblIDSHip.text    = selectedIDSData["hip"] as? String
        lblIDSPelivs.text = selectedIDSData["pelvis"] as? String
        lblIDSTrunk.text  = selectedIDSData["trunk"] as? String
    }
    
    func setUpSSData() {
        lblSSFoot.text   = selectedSLSData["foot"] as? String
        lblSSAnkle.text  = selectedSLSData["ankle"] as? String
        lblSSKneee.text  = selectedSLSData["knee"] as? String
        lblSSHip.text    = selectedSLSData["hip"] as? String
        lblSSPelivs.text = selectedSLSData["pelvis"] as? String
        lblSSTrunk.text  = selectedSLSData["trunk"] as? String
    }
    
    func setUpTDSData() {
        lblTDSFoot.text   = selectedTDSData["foot"] as? String
        lblTDSAnkle.text  = selectedTDSData["ankle"] as? String
        lblTDSKnee.text   = selectedTDSData["knee"] as? String
        lblTDSHip.text    = selectedTDSData["hip"] as? String
        lblTDSPelivs.text = selectedTDSData["pelvis"] as? String
        lblTDSTrunk.text  = selectedTDSData["trunk"] as? String
    }
    
    func setUpSwingData() {
        lblSwingFoot.text   = selectedSwingData["foot"] as? String
        lblSwingAnkle.text  = selectedSwingData["ankle"] as? String
        lblSwingKnee.text   = selectedSwingData["knee"] as? String
        lblSWingHip.text    = selectedSwingData["hip"] as? String
        lblSwingPelivs.text = selectedSwingData["pelvis"] as? String
        lblSwingTrunk.text  = selectedSwingData["trunk"] as? String
    }
    
    func setUp_stance_phase() {
        lbl_stance_phase_Foot.text   = selected_stance_phase["foot"] as? String
        lbl_stance_phase_Ankle.text  = selected_stance_phase["ankle"] as? String
        lbl_stance_phase_Knee.text   = selected_stance_phase["knee"] as? String
        lbl_stance_phase_Hip.text    = selected_stance_phase["hip"] as? String
        lbl_stance_phase_Pelivs.text = selected_stance_phase["pelvis"] as? String
        lbl_stance_phase_Trunk.text  = selected_stance_phase["trunk"] as? String
    }

    func setUpFocusData() {
        
        lblLength.text = "\(selectedAdditionalData["lenght"] as? String ?? "")"
        lblWidth.text  = "\(selectedAdditionalData["width"] as? String ?? "")"
        lblSwing.text  = "\(selectedAdditionalData["swing"] as? String ?? "")"
        lblAngle.text  = "\(selectedAdditionalData["angle"] as? String ?? "")"
        lblSwing.text  = "\(selectedAdditionalData["swing"] as? String ?? "")"
        lblStanceTime.text  = "\(selectedAdditionalData["stancetime"] as? String ?? "")"

        lblIntervFoucs.text = "\(selectedInterventionData["intervention"] as? String ?? "")"
        lblTreatmentGoal.text = "\(selectedInterventionData["treatmentGoal"] as? String ?? "")"
        lblNotes.text = "\(selectedInterventionData["notes"] as? String ?? "")"
        
    }
   
}

/*extension UIView {

  // Export pdf from Save pdf in drectory and return pdf file path
  func exportAsPdfFromView() -> String {
      let pdfPageFrame = self.bounds
      let pdfData = NSMutableData()
      UIGraphicsBeginPDFContextToData(pdfData, pdfPageFrame, nil)
      UIGraphicsBeginPDFPageWithInfo(pdfPageFrame, nil)
      guard let pdfContext = UIGraphicsGetCurrentContext() else { return "" }
      self.layer.render(in: pdfContext)
      UIGraphicsEndPDFContext()
      return self.saveViewPdf(data: pdfData)
  }

    // Save pdf file in document directory
    
    func saveViewPdf(data: NSMutableData) -> String {
        let fileName = "\(userInfoData["pName"] as? String ?? "")_\(userInfoData["pDOB"] as? String ?? "").pdf"
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDirectoryPath = paths[0]
        let pdfPath = docDirectoryPath.appendingPathComponent(fileName)
        if data.write(to: pdfPath, atomically: true) {
            return pdfPath.path
        } else {
            return ""
        }
    }
}*/

//func addBoldText(fullString: NSString, boldPartOfString: NSString, font: UIFont!, boldFont: UIFont!) -> NSAttributedString {
//    let nonBoldFontAttribute = [NSAttributedString.Key.font:font!]
//    let boldFontAttribute = [NSAttributedString.Key.font:boldFont!]
//   let boldString = NSMutableAttributedString(string: fullString as String, attributes:nonBoldFontAttribute)
//    boldString.addAttributes(boldFontAttribute, range: fullString.range(of: boldPartOfString as String))
//   return boldString
//}
