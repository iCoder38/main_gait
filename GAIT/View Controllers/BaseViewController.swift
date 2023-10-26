//
//  BaseViewController.swift
//  GAIT
//
//  Created by Shyam on 05/11/20.
//  Copyright © 2020 EVS. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - SetUP Navigation Helper func
    
    func setUpRootVC(rootVC: UIViewController){
        let navigationController = UINavigationController(rootViewController: rootVC)
        navigationController.navigationBar.backgroundColor = UIColor.white
        self.setUpNavigationBar()
        self.view.window?.rootViewController = navigationController
    }
    
    func setUpNavigationBar(){
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = UIColor.appLightNavColors()
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        } else {
            // Fallback on earlier versions <= 12.4
            UINavigationBar.appearance().barTintColor = UIColor.appLightNavColors()
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        }
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().isTranslucent = false
    }
    
    func setUpNavigationWithBack(titleStr: String){
        self.navigationItem.title = titleStr.uppercased()
        // Back Button X
        let backButton = UIBarButtonItem.init(image: #imageLiteral(resourceName: "back_icon").withRenderingMode(.alwaysOriginal) , style: .plain, target: self, action: #selector(self.backClickMethod))
        self.navigationItem.leftBarButtonItem = backButton
        backButton.tintColor = .black
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @objc func backClickMethod() {
        self.navigationItem.titleView = nil
        self.navigationController?.popViewController(animated: true)
    }
    
    func backToPatientInfo() {
        self.navigationItem.titleView = nil
        let arr_controller:[UIViewController] = (self.navigationController?.viewControllers)!
        _ = self.navigationController?.popToViewController(arr_controller[1], animated: true)
    }

    lazy var accessCodeIds: [AccessCode] = {
        let section1 = AccessCode(accessId: 310122, strDate: "Jan-31-2022")
        let section2 = AccessCode(accessId: 280222, strDate: "Feb-28-2022")
        let section3 = AccessCode(accessId: 310322, strDate: "Mar-31-2022")
        let section4 = AccessCode(accessId: 300422, strDate: "Apr-30-2022")
        let section5 = AccessCode(accessId: 310522, strDate: "May-31-2022")
        let section6 = AccessCode(accessId: 300622, strDate: "Jun-30-2022")
        let section7 = AccessCode(accessId: 310722, strDate: "Jul-31-2022")
        let section8  = AccessCode(accessId: 310822, strDate: "Aug-31-2022")
        let section9  = AccessCode(accessId: 300922, strDate: "Sep-30-2022")
        let section10 = AccessCode(accessId: 311022, strDate: "Oct-31-2022")
        let section11 = AccessCode(accessId: 301122, strDate: "Nov-30-2022")
        let section12 = AccessCode(accessId: 311222, strDate: "Dec-31-2022")
        
        let section13 = AccessCode(accessId: 310123, strDate: "Jan-31-2023")
        let section14 = AccessCode(accessId: 280223, strDate: "Feb-28-2023")
        let section15 = AccessCode(accessId: 310323, strDate: "Mar-31-2023")
        let section16 = AccessCode(accessId: 300423, strDate: "Apr-30-2023")
        let section17 = AccessCode(accessId: 310523, strDate: "May-31-2023")
        let section18 = AccessCode(accessId: 300623, strDate: "Jun-30-2023")
        let section19 = AccessCode(accessId: 310723, strDate: "Jul-31-2023")
        let section20 = AccessCode(accessId: 310823, strDate: "Aug-31-2023")
        let section21 = AccessCode(accessId: 300923, strDate: "Sep-30-2023")
        let section22 = AccessCode(accessId: 311023, strDate: "Oct-31-2023")
        let section23 = AccessCode(accessId: 301123, strDate: "Nov-30-2023")
        let section24 = AccessCode(accessId: 311223, strDate: "Dec-31-2023")
        
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
        
        let section0 = AccessCode(accessId: 150821, strDate: "Aug-15-2021")
        let section01 = AccessCode(accessId: 301121, strDate: "Nov-30-2021")
        
        return [section0,section01, section1, section2, section3, section4, section5, section6, section7, section8, section9, section10, section11, section12,section13, section14, section15, section16, section17, section18, section19, section20,section21, section22, section23, section24
                , section_25
                , section_26
                , section_27
                , section_28
                , section_29
                , section_30
                , section_31
                , section_32
                , section_33
                , section_34
                , section_35
                , section_36
                , section_37
                , section_38
                , section_39
                , section_40
        ]
    }()
    
    func isValidAcceesCode(code:String)-> Bool{
        //let codeId = Int(code)
        guard let codeId = Int(code) else { return false }
        //String to Date Convert
        
//        var dateString = "2014-01-12"
//        var dateFormatter = NSDateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        let strToDate = dateFormatter.dateFromString(dateString)
        
        //CONVERT FROM NSDate to String

        let todayDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM-dd-yyyy"
        let dateString = dateFormatter.string(from: todayDate)
        print(dateString)
        for item in accessCodeIds{
            if dateString < item.date && codeId == item.id{
                return true
            }
        }
        return false
    }
}

struct AccessCode {
    var id: Int
    var date: String
    
    init(accessId: Int, strDate: String){
        id = accessId
        date = strDate
    }
}
