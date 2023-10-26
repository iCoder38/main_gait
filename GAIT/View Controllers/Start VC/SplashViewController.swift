//
//  SplashViewController.swift
//  GAIT
//
//  Created by Shyam on 05/11/20.
//  Copyright © 2020 EVS. All rights reserved.
//

import UIKit

class SplashViewController: BaseViewController {

    var arr_mut_codes_with_date:NSMutableArray! = []
    
    @IBOutlet weak var btnGait: UIButton! {
        didSet {
            btnGait.layer.cornerRadius = 10
            btnGait.layer.borderColor = UIColor.appLightGrayColors().cgColor
            btnGait.layer.borderWidth = 1
        }
    }
    
    @IBOutlet weak var btnAssessment: UIButton! {
        didSet {
            btnAssessment.layer.cornerRadius = 10
            btnAssessment.layer.borderColor = UIColor.appLightGrayColors().cgColor
            btnAssessment.layer.borderWidth = 1
        }
    }
    
    @IBOutlet weak var btnInvervention: UIButton! {
        didSet {
            btnInvervention.layer.cornerRadius = 10
            btnInvervention.layer.borderColor = UIColor.appLightGrayColors().cgColor
            btnInvervention.layer.borderWidth = 1
        }
    }
    
    @IBOutlet weak var btnToolbox: UIButton! {
        didSet {
            btnToolbox.layer.cornerRadius = 10
            btnToolbox.layer.borderColor = UIColor.appLightGrayColors().cgColor
            btnToolbox.layer.borderWidth = 1
        }
    }
    
    
    //MARK: - Life Cycle Func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.startVC()
        }
    }
    
    //MARK: - Helper
    
    func startVC() {
        
        let destinationController = self.storyboard?.instantiateViewController(withIdentifier: "StartViewController")
         //self.navigationController?.pushViewController(destinationController!, animated: false)
        self.setUpRootVC(rootVC: destinationController!)
        /*let getAccessCodeId = UserDefaults.standard.value(forKey: "key_saved_code") as? String ?? "0"
        
        if getAccessCodeId == "0" {
            
            let destinationController = self.storyboard?.instantiateViewController(withIdentifier: "StartViewController") as! StartViewController
            self.setUpRootVC(rootVC: destinationController)
            
        } else {
            
            
            self.validate_number_with_date(str_entered_code: getAccessCodeId)
        }
        */
         //print(getAccessCodeId)
        
        
        
        /*
        UserDefaults.standard.removeObject(forKey: Keys.accessCode)
        
        
        
        let destinationController = self.storyboard?.instantiateViewController(withIdentifier: "StartViewController") as! StartViewController
        self.setUpRootVC(rootVC: destinationController)*/
        
        /*let getAccessCodeId = UserDefaults.standard.value(forKey: Keys.accessCode) as? String ?? ""
        
        if self.isValidAcceesCode(code: getAccessCodeId) == true && getAccessCodeId.isEmpty == false {
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "PatientInformationViewController") as! PatientInformationViewController
            self.setUpRootVC(rootVC: pushVC)
            
        } else {
            
            UserDefaults.standard.removeObject(forKey: Keys.accessCode)
            let destinationController = self.storyboard?.instantiateViewController(withIdentifier: "StartViewController") as! StartViewController
            self.setUpRootVC(rootVC: destinationController)
            
        }*/
    }
    
    let section_25 = AccessCode(accessId: 310324, strDate: "Mar-31-2024")
    let section_26 = AccessCode(accessId: 300624, strDate: "Jun-30-2024")
    let section_27 = AccessCode(accessId: 300924, strDate: "Sep-30-2024")
    let section_28 = AccessCode(accessId: 311224, strDate: "Dec-31-2024")
    let section_29 = AccessCode(accessId: 310325, strDate: "Mar-31-2025")
    let section_30 = AccessCode(accessId: 300625, strDate: "Jun-30-2025")
    let section_31 = AccessCode(accessId: 300925, strDate: "Sep-30-2025")
    let section_32 = AccessCode(accessId: 311225, strDate: "Dec-31-2025")
    let section_33 = AccessCode(accessId: 310326, strDate: "Mar-31-2026")
    let section_34 = AccessCode(accessId: 300626, strDate: "Jun-30-2026")
    let section_35 = AccessCode(accessId: 300926, strDate: "Sep-30-2026")
    let section_36 = AccessCode(accessId: 311226, strDate: "Dec-31-2026")
    let section_37 = AccessCode(accessId: 310327, strDate: "Mar-31-2027")
    let section_38 = AccessCode(accessId: 300627, strDate: "Jun-30-2027")
    let section_39 = AccessCode(accessId: 300927, strDate: "Sep-30-2027")
    let section_40 = AccessCode(accessId: 311227, strDate: "Dec-31-2027")
    
    
    
    
    
    
    
    
    
    // MARK: - VALIDATE NUMBER WITH DATE -
    @objc func validate_number_with_date(str_entered_code:String) {
        
        self.arr_mut_codes_with_date.removeAllObjects()
        
        let custom_code = ["310122" ,
                           "280222" ,
                           "310322" ,
                           "300422" ,
                           "310522" ,
                           "300622" ,
                           "310722" ,
                           "310822" ,
                           "300922" ,
                           "311022" ,
                           "301122" ,
                           "311222" ,
                           "310123" ,
                           "280223" ,
                           "310323" ,
                           "300423" ,
                           "310523" ,
                           "300623" ,
                           "310723" ,
                           "310823" ,
                           "300923" ,
                           "311023" ,
                           "301123" ,
                           "311223" ,
                           
                           "150821" ,
                           "301121" ,
                           
                           "310324",
                           "300624",
                           "300924",
                           "311224",
                           "310325",
                           "300625",
                           "300925",
                           "311225",
                           "310326",
                           "300626",
                           "300926",
                           "311226",
                           "310327",
                           "300627",
                           "300927",
                           "311227",
        ]
        
        let custom_code_date = ["Jan-31-2022" ,
                                "Feb-28-2022" ,
                                "Mar-31-2022" ,
                                "Apr-30-2022" ,
                                "May-31-2022" ,
                                "Jun-30-2022" ,
                                "Jul-31-2022" ,
                                "Aug-31-2022" ,
                                "Sep-30-2022" ,
                                "Oct-31-2022" ,
                                "Nov-30-2022" ,
                                "Dec-31-2022" ,
                                "Jan-31-2023" ,
                                "Feb-28-2023" ,
                                "Mar-31-2023" ,
                                "Apr-30-2023" ,
                                "May-31-2023" ,
                                "Jun-30-2023" ,
                                "Jul-31-2023" ,
                                "Aug-31-2023" ,
                                "Sep-30-2023" ,
                                "Oct-31-2023" ,
                                "Nov-30-2023" ,
                                "Dec-31-2023" ,
                                "Aug-15-2021" ,
                                "Nov-30-2021" ,

                                "Mar-31-2024",
                                "Jun-30-2024",
                                "Sep-30-2024",
                                "Dec-31-2024",
                                "Mar-31-2025",
                                "Jun-30-2025",
                                "Sep-30-2025",
                                "Dec-31-2025",
                                "Mar-31-2026",
                                "Jun-30-2026",
                                "Sep-30-2026",
                                "Dec-31-2026",
                                "Mar-31-2027",
                                "Jun-30-2027",
                                "Sep-30-2027",
                                "Dec-31-2027"
        ]
        
        for indexx in 0..<custom_code.count {
        
            let custom_dict_with_date = ["code" : custom_code[indexx],
                                         "date" : custom_code_date[indexx]]
            
            self.arr_mut_codes_with_date.add(custom_dict_with_date)
            
        }
        
        // print(self.arr_mut_codes_with_date as Any)
        
        for indexx_search in 0..<self.arr_mut_codes_with_date.count {
            
            let item = self.arr_mut_codes_with_date[indexx_search] as? [String:Any]
            
            if (item!["code"] as! String) == String(str_entered_code) {
                
                let dateString = (item!["date"] as! String)
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MMM-dd-yyyy"

                if let date = dateFormatter.date(from: dateString) {
                    
                    if date > Date() {
                        
                        print("======> after today <=====")
                        
                        // old code push
                        // let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "StartViewController")
                        // self.navigationController?.pushViewController(pushVC!, animated: true)
                        
                        // new push
                        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "would_to_to_id")
                        self.navigationController?.pushViewController(pushVC!, animated: true)
                        
                        return
                    } else {
                        print("====> code has been expired <====")
                        
                        validationString.code_expired.showAsToast()
                        
                        return
                    }
                }
            } else {
                
                // print("=====> DATA NOT MATCHED <=====")
                // validationString.enterValidCode.showAsToast()
                
            }
            
        }
    }
    
    
}

