//
//  AppConstants.swift
//  GAIT
//
//  Created by Shyam on 06/11/20.
//  Copyright © 2020 EVS. All rights reserved.
//

import Foundation
import UIKit

struct Keys {
    static let accessCode = "accessCode"
}

struct navigationTitle {
    static let startNow      = "GET STARTED NOW"
    static let patientInfo   = "Patient Information"
    static let gaitIntervals = "Gait Intervals"
    
    static let ids = "Initial Double Support (IDS)"
    static let sls = "Single Limb Support (SS)"
    static let tds = "Treminal Double Support (TDS)"
    static let swing = "Swing"
    
    static let additional = "Additinal Deviations"
    static let intervention = "Intervention focus is on"
    static let congratulation = "Congratulations!"
    static let pdfDetailsView = "Details View"
}

struct validationString {
    static let code_expired   = "Your code has been expired."
    
    static let enterValidCode   = "Please enter valid code"
    
    static let patientName      = "Please enter the patient name"
    static let patientDob       = "Please select date of birth"
    static let patientDiagnosis = "Please enter the diagnosis"
    static let patientSide      = "Please select observed side"
    static let patientAsseDate  = "Please select assessment date"
    static let patientOnsetDate = "Please select Onset of injury/illness date"
    static let patientGoal      = "Please enter patient goal"
    
    
    static let selectFootOption   = "Please select the foot deviation option"
    static let selectAnkleOption  = "Please select the ankle deviation option"
    static let selectKneeOption   = "Please select the knee deviation option"
    static let selectHipOption    = "Please select the hip deviation option"
    static let selectPelvisOption = "Please select pelvis foot deviation option"
    static let selectTrunkOption  = "Please select the trunk deviation option"
    
    static let selectSetpLengthOption = "Please select the step length option"
    static let selectSetpWidthOption  = "Please select the step width option"
    static let selectTopAngleOption   = "Please select the top angle option"
    static let selectArmSwingOption   = "Please select the arm swing option"
    
    static let selectInterventionFocusOption  = "Please select the intervention focus option"
    
}

struct SectionData {
    let title: String
    let isSelected : Bool
    let data : [RowData]

    var numberOfItems: Int {
        return data.count
    }

    subscript(index: Int) -> String {
        //return data[index]
        return "1"
    }
    
    init(title: String, data: RowData...) {
        self.title = title
        self.data  = data
        self.isSelected = false
    }
}

struct RowData {
    let rowTitle: String
    let isSelected : Bool
    
    init(title: String, data: Bool = false) {
        self.rowTitle = title
        self.isSelected  = data
    } 
}

/*
struct GetListData {
    struct IDSListData {
        static var ldsListData: [SectionData] = {
            let section1 = SectionData(title: "Foot Deviations",
                                       data: RowData.init(title: "Forefoot Contact"),
                                       RowData.init(title: "Foot-flat Contact"),
                                       RowData.init(title: "Foot Slap"))
            let section2 = SectionData(title: "Ankle Deviations",
                                       data: RowData.init(title: "Excessive Plantarflexion"),
                                       RowData.init(title: "Insufficient Plantarflexion"),
                                       RowData.init(title: "Excessive Dorsiflexion"),
                                       RowData.init(title: "Excessive Inversion"),
                                       RowData.init(title: "Excessive Eversion"))
            
            let section3 = SectionData(title: "Knee Deviations",
                                       data: RowData.init(title: "Excessive Flexion"),
                                       RowData.init(title: "Insufficient Flexion"),
                                       RowData.init(title: "Hyperextension"),
                                       RowData.init(title: "Excessive Varus"),
                                       RowData.init(title: "Excessive Valgus"))
            
            let section4 = SectionData(title: "Hip Deviations",
                                       data:RowData.init(title: "Excessive Flexion"),
                                       RowData.init(title: "Insufficient Flexion"),
                                       RowData.init(title: "Excessive Internal Rotation"),
                                       RowData.init(title: "Excessive External Rotation"),
                                       RowData.init(title: "Excessive Abduction"),
                                       RowData.init(title: "Excessive Adduction"))
            
            let section5 = SectionData(title: "Pelvis Deviations",
                                       data: RowData.init(title: "Excessive Forward Rotation"),
                                       RowData.init(title: "Insufficient Forward Rotation"),
                                       RowData.init(title: "Contralateral Drop"))
            let section6 = SectionData(title: "Trunk Deviations",
                                       data: RowData.init(title: "Forward Lean"),
                                       RowData.init(title: "Backward Lean"),
                                       RowData.init(title: "Right Lean"),
                                       RowData.init(title: "Left Lean"))
            return [section1, section2, section3, section4, section5, section6]
        }
    }
}
*/
