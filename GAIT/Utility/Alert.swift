//
//  Alert.swift
//  GAIT
//
//  Created by Shyam on 06/11/20.
//  Copyright © 2020 EVS. All rights reserved.
//

import Foundation
import UIKit


class Alert: NSObject {
    
    //MARK:- Show Tost Message...
    
    class func showTostMessage(message:String, delay:Double, controller:UIViewController!){
        let alert = UIAlertController(title: nil,
                                      message: message as String,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.show()
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            // do stuff 42 seconds later
            alert.dismiss(animated: true, completion: nil)
        }
        // Use
        //Alert.showTostMessage(message: "Server connection failed ! Please try later.", delay: 3.0, controller: self)
    }
    
    class func showAlert(alerttitle :String, alertmessage: String,ButtonTitle: String, viewController: UIViewController){
           let alertController = UIAlertController(title: alerttitle, message: alertmessage, preferredStyle: .alert)
           let okButtonOnAlertAction = UIAlertAction(title: ButtonTitle, style: .default)
           { (action) -> Void in
               //what happens when "ok" is pressed
           }
           alertController.addAction(okButtonOnAlertAction)
           alertController.show()
       }
}
