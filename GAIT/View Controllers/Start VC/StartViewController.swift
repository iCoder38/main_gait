//
//  StartViewController.swift
//  GAIT
//
//  Created by Shyam on 05/11/20.
//  Copyright © 2020 EVS. All rights reserved.
//

import UIKit

class StartViewController: BaseViewController , UITextFieldDelegate {
    
    var arr_mut_codes_with_date:NSMutableArray! = []
    
    @IBOutlet weak var txtCode: UITextField!{
        didSet{
            txtCode.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        }
    }
    
    //MARK: - Life Cycle Func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = navigationTitle.startNow
        
        self.txtCode.delegate = self
        
//
        
        let getAccessCodeId = UserDefaults.standard.value(forKey: "key_saved_code") as? String ?? "0"
        
        if getAccessCodeId == "0" {
            
            // let destinationController = self.storyboard?.instantiateViewController(withIdentifier: "StartViewController") as! StartViewController
            // self.setUpRootVC(rootVC: destinationController)
            
        } else {
            
            
            self.validate_number_with_date(str_entered_code: getAccessCodeId)
        }
        
        
//         self.validate_number_with_date(str_entered_code: <#T##String#>)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    //MARK: - UITextField DidChange Method
    
    /*
     code = 300622;
     date = "Jun-30-2022";
 },
 {
     code = 310722;
     date = "Jul-31-2022";
 },
 {
     code = 310822;
     date = "Aug-31-2022";
     */
    @objc func textFieldDidChange(textField: UITextField) {
        
        print(textField.text as Any)
        print(textField.text?.count as Any)
        
        if textField.text?.count == 6 {
            
            print("=====> count is 6 now <====")
            self.validate_number_with_date(str_entered_code: textField.text!)
            
        } else {
            print("=====> count is not 6 <====")
        }
        
        /*if textField.text?.count ?? 0 > 5 {
            
            
            
            if self.isValidAcceesCode(code: textField.text ?? "") == true {
                
                print("=====> yes i am valid")
                
                UserDefaults.standard.set(textField.text, forKey: Keys.accessCode)
                
                
                
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "PatientInformationViewController") as! PatientInformationViewController
                self.navigationController?.pushViewController(pushVC, animated: true)
                
            } else {
                validationString.enterValidCode.showAsToast()
            }
        } else {
            //validationString.enterValidCode.showAsToast()
        }*/
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        
        return count <= 6
     
        // return false
        
    }
    //MARK: - IBActions
    
    @IBAction func tapEmailUrlBtn(_ sender : UIButton){
        
    }
    
    @IBAction func tapUrlBtn(_ sender : UIButton) {
        
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "StartAssessmentViewController") as! StartAssessmentViewController
        self.navigationController?.pushViewController(pushVC, animated: true)
        let strUrl = "https://enability.com/"
        guard URL(string: strUrl) != nil else { return }
        //UIApplication.shared.open(url)
        
    }
        
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
                        
                        UserDefaults.standard.set(str_entered_code, forKey: "key_saved_code")//Keys.accessCode)
                        
                        // let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "PatientInformationViewController") as! PatientInformationViewController
                        // self.navigationController?.pushViewController(pushVC, animated: false)
                        
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
