//
//  PatientInformationViewController.swift
//  GAIT
//
//  Created by Shyam on 05/11/20.
//  Copyright © 2020 EVS. All rights reserved.
//

import UIKit
import DropDown

struct userData {
    var patientName: String
    var patientDOB: String
    var diagnosis: String
    var observedSide: String
    var assessmentDate: String
}

var userInfoData = NSMutableDictionary.init()

class PatientInformationViewController: BaseViewController {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtDiagnosis: UITextField!
    @IBOutlet weak var txtGoal: UITextField!
    @IBOutlet weak var txtViewGoal: UITextView!{
        didSet{
            txtViewGoal.layer.cornerRadius = 5
            txtViewGoal.layer.borderWidth = 1
            txtViewGoal.layer.borderColor = UIColor.appLightGrayColors().cgColor
        }
    }
    
    @IBOutlet weak var txtWalkingAid: UITextField!{
        didSet{
            txtWalkingAid.tag = 88
            txtWalkingAid.isUserInteractionEnabled = false
        }
    }
    
    @IBOutlet weak var txtSide: UITextField!{
        didSet{
            txtSide.tag = 44
            txtSide.addTarget(self, action: #selector(specialDateTextFieldClick(_:)), for: .editingDidBegin)
            txtSide.isUserInteractionEnabled = false
        }
    }
    
    @IBOutlet weak var txtDOB: UITextField!{
        didSet {
            txtDOB.keyboardType = .default
            // txtDOB.tag = 22
            // txtDOB.addTarget(self, action: #selector(specialDateTextFieldClick(_:)), for: .editingDidBegin)
        }
    }
    
    @IBOutlet weak var txtADate: UITextField!{
        didSet{
            txtADate.tag = 55
            txtADate.addTarget(self, action: #selector(specialDateTextFieldClick(_:)), for: .editingDidBegin)
        }
    }
    
    @IBOutlet weak var txtOnsetDate: UITextField!{
        didSet{
            txtOnsetDate.tag = 66
            txtOnsetDate.addTarget(self, action: #selector(specialDateTextFieldClick(_:)), for: .editingDidBegin)
        }
    }
    
    let sideDropDown = DropDown()
    let walkingDropDown = DropDown()
    
    //MARK: - Life Cycle Func -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setUpNavigationBar()
        self.setUpNavigationWithBack(titleStr: navigationTitle.patientInfo)
        
         // self.navigationController?.navigationBar.backgroundColor = UIColor.appLightNavColors()
        // self.navigationController?.setNavigationBarHidden(true, animated: true)
        // self.backToPatientInfo()
        // self.setUpNavigationWithBack(titleStr: navigationTitle.sls)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: - Helper -
    func isValid() -> Bool {
        if self.txtName.text?.isEmpty == true {
            Alert.showTostMessage(message: validationString.patientName, delay: 2.0, controller: self)
        }else if self.txtDOB.text?.isEmpty == true{
            Alert.showTostMessage(message: validationString.patientDob, delay: 2.0, controller: self)
        }else if self.txtDiagnosis.text?.isEmpty == true{
            Alert.showTostMessage(message: validationString.patientDiagnosis, delay: 2.0, controller: self)
        }else if self.txtSide.text?.isEmpty == true{
            Alert.showTostMessage(message: validationString.patientSide, delay: 2.0, controller: self)
        }else if self.txtADate.text?.isEmpty == true{
            Alert.showTostMessage(message: validationString.patientAsseDate, delay: 2.0, controller: self)
        }else if self.txtOnsetDate.text?.isEmpty == true{
            Alert.showTostMessage(message: validationString.patientOnsetDate, delay: 2.0, controller: self)
        }else if self.txtViewGoal.text?.isEmpty == true {
            //|| self.txtViewGoal.text == "Enter Goal"{
            Alert.showTostMessage(message: validationString.patientGoal, delay: 2.0, controller: self)
        } else {
            return true
        }
        return false
    }
    
    func saveUserData(){
        userInfoData.removeAllObjects()
        userInfoData.setObject(self.txtName.text!, forKey: "pName" as NSCopying)
         userInfoData.setObject(self.txtDOB.text!, forKey: "pDOB" as NSCopying)
         userInfoData.setObject(self.txtDiagnosis.text!, forKey: "pDiagnosis" as NSCopying)
         userInfoData.setObject(self.txtSide.text!, forKey: "observedSide" as NSCopying)
         userInfoData.setObject(self.txtADate.text!, forKey: "assessmentDate" as NSCopying)
         userInfoData.setObject(self.txtOnsetDate.text!, forKey: "onsetDate" as NSCopying)
         userInfoData.setObject(" \(self.txtViewGoal.text!)", forKey: "pGoal" as NSCopying)
        userInfoData.setObject(self.txtWalkingAid.text!, forKey: "wakingAid" as NSCopying)
    }
    
    @objc func datePickerFromValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        //dateFormatter.dateFormat = "dd-MMM-yyyy hh:mm:ss"
        //dateFormatter.dateFormat = "MMMM, dd yyyy"
        
        dateFormatter.dateFormat = "dd MMM yyyy"
        
        if sender.tag == self.txtDOB.tag{
            self.txtDOB.text = dateFormatter.string(from: sender.date)
        }else if sender.tag == self.txtADate.tag{
            self.txtADate.text = dateFormatter.string(from: sender.date)
        }else if sender.tag == self.txtOnsetDate.tag{
            self.txtOnsetDate.text = dateFormatter.string(from: sender.date)
        }
    }
    
    //MARK: - IBActions
    
    @IBAction func specialDateTextFieldClick(_ sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePicker.Mode.date
        datePickerView.tag = sender.tag
        
        if sender.tag == 22 {
            
            // datePickerView.set18YearValidation()
            // self.txtDOB.inputView = datePickerView
            
        } else if sender.tag == 55{
            //datePickerView.set18YearValidation(backYear: 0)
            self.txtADate.inputView = datePickerView
        }else{
            self.txtOnsetDate.inputView = datePickerView
        }
        datePickerView.addTarget(self, action: #selector(self.datePickerFromValueChanged), for: UIControl.Event.valueChanged)
    }
    
    @IBAction func showSideDropDown(_ sender : UIButton){
        sideDropDown.anchorView = sender
        sideDropDown.bottomOffset = CGPoint(x: 0, y: sender.bounds.height)
        sideDropDown.dataSource = ["Right", "Left"]
        // Action triggered on selection
        sideDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.txtSide.text = item
        }
        // Will set a custom width instead of the anchor view width
        sideDropDown.width = 200
        sideDropDown.show()
    }

    @IBAction func showWalkingAidDropDown(_ sender : UIButton){
        walkingDropDown.anchorView = sender
        walkingDropDown.bottomOffset = CGPoint(x: 0, y: sender.bounds.height)
        walkingDropDown.dataSource = ["None", "Cane", "Crutches", "Walker", "Orthosis", "Prosthesis", "Other" ]
        // Action triggered on selection
        walkingDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.txtWalkingAid.text = item
        }
        // Will set a custom width instead of the anchor view width
        walkingDropDown.width = 200
        walkingDropDown.show()
    }

    
    @IBAction func tapContinueBtn(_ sender : UIButton) {
        
        // if isValid() == true {
        
        self.saveUserData()
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "StartAssessmentViewController") as! StartAssessmentViewController
        self.navigationController?.pushViewController(pushVC, animated: true)
        
        // }
    }
    
}
