//
//  Extension_Class.swift
//  GAIT
//
//  Created by Shyam on 05/11/20.
//  Copyright © 2020 EVS. All rights reserved.
//

import Foundation
import UIKit
import Toast_Swift

extension UIColor {
    
    convenience init(_ red: CGFloat,_ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1) {
        self.init(cgColor: UIColor.init(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha).cgColor)
    }
    
    class func appDarkNavColors() -> UIColor{
        return UIColor.init(named: "App_Dark_Nav_Color")!
    }
    
    class func appLightNavColors() -> UIColor{
        return UIColor.init(named: "App_Light_Nav_Color")!
    }
    
    class func appRedColors() -> UIColor{
        return UIColor.init(named: "App_Red_Color")!
    }
    
    class func appGreenColors() -> UIColor{
        return UIColor.init(named: "App_Green_Color")!
    }
    
    class func appOrangColors() -> UIColor{
        return UIColor.init(named: "App_Orang_Color")!
    }
    
    class func appLightGrayColors() -> UIColor{
        return UIColor.init(named: "App_Light_Gray_Color")!
    }
}

extension UIAlertController {
    
    func show() {
        present(animated: true, completion: nil)
    }
    
    func present(animated: Bool, completion: (() -> Void)?) {
        if let rootVC = UIApplication.shared.keyWindow?.rootViewController {
            presentFromController(controller: rootVC, animated: animated, completion: completion)
        }
    }
    
    private func presentFromController(controller: UIViewController, animated: Bool, completion: (() -> Void)?) {
        if let navVC = controller as? UINavigationController,
            let visibleVC = navVC.visibleViewController {
            presentFromController(controller: visibleVC, animated: animated, completion: completion)
        }  else {
            controller.present(self, animated: animated, completion: completion);
        }
    }
    
    func addAction(title: String?, style: UIAlertAction.Style, handler: ((UIAlertAction) -> Void)?) {
        let alertAction = UIAlertAction(title: title, style: style, handler: handler)
        self.addAction(alertAction)
    }
}

extension String{
    
    func showAsToast(_ VC:UIViewController? = nil, duration : TimeInterval = 2.5){
        let msgString = self
        if self.isEmpty == true {
            //msgString = serverErrorMsg
        }else{
            var tStyle = ToastManager.shared.style
            tStyle.messageAlignment = NSTextAlignment.center
            tStyle.messageColor = UIColor.white
            tStyle.backgroundColor = UIColor.gray
            ToastManager.shared.position = .bottom
            ToastManager.shared.duration = duration
            if let presentCont = MyAppDelegate.window?.rootViewController?.presentedViewController {
                presentCont.view.makeToast(msgString, duration: duration, style: tStyle)
            } else if let rootViewCont = MyAppDelegate.window?.rootViewController {
                rootViewCont.view.makeToast(msgString, duration: duration, style: tStyle)
            } else if let VC = VC {
                VC.view.makeToast(msgString, duration: duration, style: tStyle)
            }
        }
    }
    
    func showAsAlert(title: String = "", _ VC: UIViewController? = nil){
        let msgString = self
        if self.isEmpty == true {
            //msgString = serverErrorMsg
        }else{
            let alert=UIAlertController(title: title, message: msgString, preferredStyle: UIAlertController.Style.alert)
            let OK = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            alert .addAction(OK)
            if let vc = VC {
                vc.present(alert, animated: true, completion: nil)
            } else {
                MyAppDelegate.window?.rootViewController?.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func withBoldText(text: String, font: UIFont? = nil) -> NSAttributedString {
        let _font = font ?? UIFont.systemFont(ofSize: 17, weight: .regular)
        let fullString = NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.font: _font])
        //let boldFontAttribute: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: _font.pointSize)]
        
        let boldFontAttribute: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)]
        
        //let boldFontAttribute: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.init(name: "gait_bold.otf", size: _font.pointSize)!]
    
        let range = (self as NSString).range(of: text)
        fullString.addAttributes(boldFontAttribute, range: range)
        return fullString
    }
}

@IBDesignable class TextViewWithPlaceholder: UITextView {

    override var text: String! { // Ensures that the placeholder text is never returned as the field's text
        get {
            if showingPlaceholder {
                return "" // When showing the placeholder, there's no real text to return
            } else { return super.text }
        }
        set { super.text = newValue }
    }
    @IBInspectable var placeholderText: String = ""
    @IBInspectable var placeholderTextColor: UIColor = UIColor(red: 0.78, green: 0.78, blue: 0.80, alpha: 1.0) // Standard iOS placeholder color (#C7C7CD). See https://stackoverflow.com/questions/31057746/whats-the-default-color-for-placeholder-text-in-uitextfield
    private var showingPlaceholder: Bool = true // Keeps track of whether the field is currently showing a placeholder

    override func didMoveToWindow() {
        super.didMoveToWindow()
        if text.isEmpty {
            showPlaceholderText() // Load up the placeholder text when first appearing, but not if coming back to a view where text was already entered
        }
    }

    override func becomeFirstResponder() -> Bool {
        // If the current text is the placeholder, remove it
        if showingPlaceholder {
            text = nil
            textColor = nil // Put the text back to the default, unmodified color
            showingPlaceholder = false
        }
        return super.becomeFirstResponder()
    }

    override func resignFirstResponder() -> Bool {
        // If there's no text, put the placeholder back
        if text.isEmpty {
            showPlaceholderText()
        }
        return super.resignFirstResponder()
    }

    private func showPlaceholderText() {
        showingPlaceholder = true
        textColor = placeholderTextColor
        text = placeholderText
    }
}

extension Date{
    func getPrevDate(nextIndex: Int = 1) -> Date{
        //let yesterday = Date(timeInterval: -86400, since: Date())
        //let tomorrow = Date(timeInterval: 86400, since: Date())
        
        //let nextDate = Date(timeInterval: (TimeInterval(86400 * nextIndex)), since: self)
        let prevDate = Date(timeInterval: (TimeInterval(-86400 * nextIndex)), since: self)
        return prevDate
    }
}

extension UIDatePicker {
    func set18YearValidation(backYear: Int = -18) {
        var currentDate: Date = Date()
        if backYear == 0{
            currentDate = currentDate.getPrevDate()
        }
        var calendar: Calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.timeZone = TimeZone(identifier: "UTC")!
        var components: DateComponents = DateComponents()
        components.calendar = calendar
        components.year = backYear
        let maxDate: Date = calendar.date(byAdding: components, to: currentDate)!
        components.year = -150
        let minDate: Date = calendar.date(byAdding: components, to: currentDate)!
        self.minimumDate = minDate
        self.maximumDate = maxDate
    }
}
