//
//  SwingViewController.swift
//  GAIT
//
//  Created by Shyam on 05/11/20.
//  Copyright © 2020 EVS. All rights reserved.
//

import UIKit

import UIKit
 
var selected_stance_phase = NSMutableDictionary.init()

class stance_phase: UIViewController {

    var ankle_index = 1
    var knee_index = 2
    var hip_index = 3
    var pelvis_index = 4
    var trunk_index = 5
    
    @IBOutlet weak var tble_view:UITableView!
    
    var arr_mut_would_like_to:NSMutableArray! = []
    
    var (footArr, ankleArr, pelvisArr ,kneeArr, hipArr, trunkArr) = ([String](),[String](),[String](),[String](),[String](),[String]())
    
    var arr_foot:NSMutableArray! = []
    var arr_ankle:NSMutableArray! = []
    var arr_knee:NSMutableArray! = []
    var arr_hip:NSMutableArray! = []
    var arr_pelvis:NSMutableArray! = []
    var arr_trunk:NSMutableArray! = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        // self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationItem.title = "stance phase".uppercased()
        // Back Button X
        let backButton = UIBarButtonItem.init(image: #imageLiteral(resourceName: "back_icon").withRenderingMode(.alwaysOriginal) , style: .plain, target: self, action: #selector(self.backClickMethod))
        self.navigationItem.leftBarButtonItem = backButton
        backButton.tintColor = .black
        self.navigationController?.isNavigationBarHidden = false
        
        self.tble_view.separatorColor = .clear
        
        self.tble_view.delegate = self
        self.tble_view.dataSource = self
        self.tble_view.reloadData()
        
        // MARK: - FOOT DATA SORTING -
        // foot data
        let arr_foot_data = ["Forefoot Contact","Foot-flat Contact","Foot Slap","Early Heel Rise","Delayed Heel Rise"]
        
        for indexx in 0..<arr_foot_data.count {
            let custom_foot = [
                "name":"\(arr_foot_data[indexx])",
                "type":"no"
            ]
            self.arr_foot.add(custom_foot)
        }
        
        // MARK: - ANKLE SORTING -
        // foot data
        let arr_ankle_data = ["Excessive Plantarflexion","Insufficient Plantarflexion","Excessive Dorsiflexion","Insufficient Dorsiflexion","Inversion : Slight","Inversion : Moderate","Inversion : Excessive",
                              "Eversion : Slight","Eversion : Moderate","Eversion : Excessive",
                              "Stiff ankle","Unstable Ankle"]
        
        for indexx in 0..<arr_ankle_data.count {
            let custom_foot = [
                "name":"\(arr_ankle_data[indexx])",
                "type":"no"
            ]
            self.arr_ankle.add(custom_foot)
        }
        
        // MARK: - KNEE SORTING -
        // foot data
        let arr_knee_data = ["Excessive Flexion","Insufficient Flexion","Hyperextension",
                             
                             "Varus : Slight","Varus : Moderate","Varus : Excessive",
                             
                             "Valgus : Slight","Valgus : Moderate","Valgus : Excessive",
                             "Stiff Knee", "Unstable Knee"]
        
        for indexx in 0..<arr_knee_data.count {
            let custom_foot = [
                "name":"\(arr_knee_data[indexx])",
                "type":"no"
            ]
            self.arr_knee.add(custom_foot)
        }
        
        // MARK: - PELVIS SORTING -
        // foot data
        let arr_pelvis_data = ["Insufficient Forward Rotation","Excessive Forward Rotation","Insufficient Backward Rotation","Excessive Backward Rotation","Contralateral Drop","Excessive Anterior Tilt","Restricted Pelvic Movement"]
        
        for indexx in 0..<arr_pelvis_data.count {
            let custom_foot = [
                "name":"\(arr_pelvis_data[indexx])",
                "type":"no"
            ]
            self.arr_pelvis.add(custom_foot)
        }
        
        // MARK: - TRUNK SORTING -
        // foot data
        let arr_trunk_data = ["Forward Lean","Backward Lean","Right Lean","Left Lean","Restricted Trunk Rotation"]
        
        for indexx in 0..<arr_trunk_data.count {
            let custom_foot = [
                "name":"\(arr_trunk_data[indexx])",
                "type":"no"
            ]
            self.arr_trunk.add(custom_foot)
        }
        
        // MARK: - HIP SORTING -
         
        let arr_hip_data = ["Insufficient Flexion","Insufficient Extension","Excessive External Rotation",
                            
                            "Abduction : Slight",
                            "Abduction : Moderate",
                            "Abduction : Excessive",
                            
                            "Adduction : Slight",
                            "Adduction : Moderate",
                            "Adduction : Excessive",
                            
                            "Internal Rotation : Slight",
                            "Internal Rotation : Moderate",
                            "Internal Rotation : Excessive",
                            
                            "Stiff Hip"]
        
        for indexx in 0..<arr_hip_data.count {
            let custom_foot = [
                "name":"\(arr_hip_data[indexx])",
                "type":"no"
            ]
            self.arr_hip.add(custom_foot)
        }
        
         
        
        
    }
    
    @objc func backClickMethod() {
        self.navigationController?.popViewController(animated: true)
    }

    @objc func show_data() {
        print(self.arr_foot as Any)
        print(self.arr_pelvis as Any)
        print(self.arr_trunk as Any)
        print(self.arr_hip as Any)
        
        // FOOT
        if let foot_ns_array = self.arr_foot as NSArray as? [String] {
            print(foot_ns_array)
        }
    }
    
    @objc func save_and_continue_click_method() {
        print(self.arr_foot as Any)
        // FOOT
        self.footArr = [String]()
        for foot_index in 0..<self.arr_foot.count {
            //
            let item = self.arr_foot[foot_index] as? [String:Any]
            if (item!["type"] as! String) == "yes" {
                footArr.append(item!["name"] as! String)
            }
        }
        print(self.footArr as Any)
        
        // PELVIS
        self.pelvisArr = [String]()
        for foot_index in 0..<self.arr_pelvis.count {
            //
            let item = self.arr_pelvis[foot_index] as? [String:Any]
            if (item!["type"] as! String) == "yes" {
                pelvisArr.append(item!["name"] as! String)
            }
        }
        print(self.pelvisArr as Any)
        
        // TRUNK
        self.trunkArr = [String]()
        for foot_index in 0..<self.arr_trunk.count {
            //
            let item = self.arr_trunk[foot_index] as? [String:Any]
            if (item!["type"] as! String) == "yes" {
                trunkArr.append(item!["name"] as! String)
            }
        }
        print(self.trunkArr as Any)
        
        // ANKLE
        print(self.arr_ankle as Any)
        print(self.ankleArr as Any)
        self.ankleArr = [String]()
        print(self.ankleArr as Any)
        for foot_index in 0..<self.arr_ankle.count {
            //
            let item = self.arr_ankle[foot_index] as? [String:Any]
            if (item!["type"] as! String) == "yes" {
                ankleArr.append(item!["name"] as! String)
            }
        }
        // print(self.ankleArr as Any)
        
        // KNEE
        print(self.arr_knee as Any)
        print(self.kneeArr as Any)
        self.kneeArr = [String]()
        print(self.kneeArr as Any)
        for foot_index in 0..<self.arr_knee.count {
            //
            let item = self.arr_knee[foot_index] as? [String:Any]
            if (item!["type"] as! String) == "yes" {
                kneeArr.append(item!["name"] as! String)
            }
        }
         print(self.kneeArr as Any)
        
        
        
        // HIP
        print(self.arr_hip as Any)
        print(self.hipArr as Any)
        self.hipArr = [String]()
        print(self.hipArr as Any)
        for foot_index in 0..<self.arr_hip.count {
            //
            let item = self.arr_hip[foot_index] as? [String:Any]
            if (item!["type"] as! String) == "yes" {
                hipArr.append(item!["name"] as! String)
            }
        }
         print(self.hipArr as Any)
        
        
        
        
        // MANAGE ALL
        selected_stance_phase.setObject(footArr.joined(separator:"\n"), forKey: "foot" as NSCopying)
        selected_stance_phase.setObject(ankleArr.joined(separator:"\n"), forKey: "ankle" as NSCopying)
        selected_stance_phase.setObject(kneeArr.joined(separator:"\n"), forKey: "knee" as NSCopying)
        selected_stance_phase.setObject(hipArr.joined(separator:"\n"), forKey: "hip" as NSCopying)
        selected_stance_phase.setObject(pelvisArr.joined(separator:"\n"), forKey: "pelvis" as NSCopying)
        selected_stance_phase.setObject(trunkArr.joined(separator:"\n"), forKey: "trunk" as NSCopying)
        
        print(selected_stance_phase as Any)
        
        // push to swing screen
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "SwingViewController") as! SwingViewController
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
    @objc func fareFootClickMethod() {
         let indexPath = IndexPath.init(row: 0, section: 0)
         let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Forefoot Contact"
        
         print(cell.btn_foot_farefoot.tag as Any)
        
        if (cell.btn_foot_farefoot.tag == 10) {
            
            cell.btn_foot_farefoot.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_foot, my_name: my_name)
            
            //
            cell.btn_foot_farefoot.tag = 11
        } else {
            cell.btn_foot_farefoot.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_foot, my_name: my_name)
                        //
            cell.btn_foot_farefoot.tag = 10
        }
        
        // show data
         self.show_data()
    }
    
    @objc func footFlatClickMethod() {
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Foot-flat Contact"
        
         print(cell.btn_foot_footFlat.tag as Any)
        if (cell.btn_foot_footFlat.tag == 20) {
            
            cell.btn_foot_footFlat.setImage(UIImage(named: "check_icon"), for: .normal)
            
            
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_foot, my_name: my_name)
            
            //
            cell.btn_foot_footFlat.tag = 21
        } else {
            cell.btn_foot_footFlat.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_foot, my_name: my_name)
            
            
            cell.btn_foot_footFlat.tag = 20
        }
        
        // show data
         self.show_data()
        
    }
    
    @objc func footSlapClickMethod() {
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Foot Slap"
        
        print(cell.btn_foot_footSlap.tag as Any)
        if (cell.btn_foot_footSlap.tag == 30) {
            
            cell.btn_foot_footSlap.setImage(UIImage(named: "check_icon"), for: .normal)
           
            
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_foot, my_name: my_name)
            
            //
            cell.btn_foot_footSlap.tag = 31
        } else {
            cell.btn_foot_footSlap.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_foot, my_name: my_name)
            
            cell.btn_foot_footSlap.tag = 30
        }
        
        // show data
        self.show_data()
    }
    
    @objc func earlyHeelRiseClickMethod() {
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Early Heel Rise"
        
        print(cell.btn_foot_earlyHeelRise.tag as Any)
        if (cell.btn_foot_earlyHeelRise.tag == 40) {
            
            cell.btn_foot_earlyHeelRise.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_foot, my_name: my_name)
            
            //
            cell.btn_foot_earlyHeelRise.tag = 41
        } else {
            cell.btn_foot_earlyHeelRise.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_foot, my_name: my_name)
            
            cell.btn_foot_earlyHeelRise.tag = 40
        }
        
        // show data
        self.show_data()
    }
    
    @objc func delayedHeelRiseClickMethod() {
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Delayed Heel Rise"
        
        print(cell.btn_foot_delayedHeelRise.tag as Any)
        if (cell.btn_foot_delayedHeelRise.tag == 50) {
            
            cell.btn_foot_delayedHeelRise.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_foot, my_name: my_name)
            
            //
            cell.btn_foot_delayedHeelRise.tag = 51
        } else {
            cell.btn_foot_delayedHeelRise.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_foot, my_name: my_name)
            
            cell.btn_foot_delayedHeelRise.tag = 50
        }
        
        // show data
        self.show_data()
    }
    
    // MARK: - PELVIS -
    @objc func insufficientForwardClickMethod() {
        let indexPath = IndexPath.init(row: pelvis_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Insufficient Forward Rotation"
        
        print(cell.btn_pelvis_insufficient_forward.tag as Any)
        if (cell.btn_pelvis_insufficient_forward.tag == 60) {
            
            cell.btn_pelvis_insufficient_forward.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_pelvis, my_name: my_name)
            
            cell.btn_pelvis_insufficient_forward.tag = 61
        } else {
            cell.btn_pelvis_insufficient_forward.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_pelvis, my_name: my_name)
            
            //
            cell.btn_pelvis_insufficient_forward.tag = 60
        }
        // show data
        self.show_data()
    }
    
    @objc func excessive_forward_ClickMethod() {
        let indexPath = IndexPath.init(row: pelvis_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Excessive Forward Rotation"
        
        print(cell.btn_pelvis_excessive_forward.tag as Any)
        if (cell.btn_pelvis_excessive_forward.tag == 70) {
            
            cell.btn_pelvis_excessive_forward.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_pelvis, my_name: my_name)
            
            cell.btn_pelvis_excessive_forward.tag = 71
        } else {
            cell.btn_pelvis_excessive_forward.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_pelvis, my_name: my_name)
            
            cell.btn_pelvis_excessive_forward.tag = 70
        }
        // show data
        self.show_data()
    }
    
    @objc func insufficient_backward_ClickMethod() {
        let indexPath = IndexPath.init(row: pelvis_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Insufficient Backward Rotation"
        
        print(cell.btn_pelvis_insufficient_backward.tag as Any)
        if (cell.btn_pelvis_insufficient_backward.tag == 80) {
            
            cell.btn_pelvis_insufficient_backward.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_pelvis, my_name: my_name)
            
            cell.btn_pelvis_insufficient_backward.tag = 81
        } else {
            cell.btn_pelvis_insufficient_backward.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_pelvis, my_name: my_name)
            
            cell.btn_pelvis_insufficient_backward.tag = 80
        }
        // show data
        self.show_data()
    }
    
    @objc func excessive_backward_ClickMethod() {
        let indexPath = IndexPath.init(row: pelvis_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Excessive Backward Rotation"
        
        print(cell.btn_pelvis_excessive_backward.tag as Any)
        if (cell.btn_pelvis_excessive_backward.tag == 90) {
            
            cell.btn_pelvis_excessive_backward.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_pelvis, my_name: my_name)
            
            cell.btn_pelvis_excessive_backward.tag = 91
        } else {
            cell.btn_pelvis_excessive_backward.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_pelvis, my_name: my_name)
            
            cell.btn_pelvis_excessive_backward.tag = 90
        }
        // show data
        self.show_data()
    }
    
    @objc func contralateral_dropClickMethod() {
        let indexPath = IndexPath.init(row: pelvis_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Contralateral Drop"
        
        print(cell.btn_pelvis_contralateral_drop.tag as Any)
        if (cell.btn_pelvis_contralateral_drop.tag == 100) {
            
            cell.btn_pelvis_contralateral_drop.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_pelvis, my_name: my_name)
            
            cell.btn_pelvis_contralateral_drop.tag = 101
        } else {
            cell.btn_pelvis_contralateral_drop.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_pelvis, my_name: my_name)
            
            cell.btn_pelvis_contralateral_drop.tag = 100
        }
        // show data
        self.show_data()
    }
    
    @objc func excessive_anteriorClickMethod() {
        let indexPath = IndexPath.init(row: pelvis_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Excessive Anterior Tilt"
        
        print(cell.btn_pelvis_excessive_anterior.tag as Any)
        if (cell.btn_pelvis_excessive_anterior.tag == 110) {
            
            cell.btn_pelvis_excessive_anterior.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_pelvis, my_name: my_name)
            
            cell.btn_pelvis_excessive_anterior.tag = 111
        } else {
            cell.btn_pelvis_excessive_anterior.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_pelvis, my_name: my_name)
            
            cell.btn_pelvis_excessive_anterior.tag = 110
        }
        // show data
        self.show_data()
    }
    
    @objc func restricted_pelvicClickMethod() {
        let indexPath = IndexPath.init(row: pelvis_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Restricted Pelvic Movement"
        
        print(cell.btn_pelvis_restricted_pelvic.tag as Any)
        if (cell.btn_pelvis_restricted_pelvic.tag == 120) {
            
            cell.btn_pelvis_restricted_pelvic.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_pelvis, my_name: my_name)
            
            cell.btn_pelvis_restricted_pelvic.tag = 121
        } else {
            cell.btn_pelvis_restricted_pelvic.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_pelvis, my_name: my_name)
            
            cell.btn_pelvis_restricted_pelvic.tag = 120
        }
        // show data
        self.show_data()
    }
    
    /*
     cell.btn_trunk_forward.addTarget(self, action: #selector(trunk_forward_ClickMethod), for: .touchUpInside)
     cell.btn_trunk_backward.addTarget(self, action: #selector(trunk_backward_ClickMethod), for: .touchUpInside)
     cell.btn_trunk_right.addTarget(self, action: #selector(trunk_right_ClickMethod), for: .touchUpInside)
     cell.btn_trunk_left.addTarget(self, action: #selector(trunk_left_ClickMethod), for: .touchUpInside)
     cell.btn_trunk_restricted.addTarget(self, action: #selector(trunk_restricted_ClickMethod), for: .touchUpInside)
     */
    // MARK: - TRUNK -
    @objc func trunk_forward_ClickMethod() {
        let indexPath = IndexPath.init(row: trunk_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Forward Lean"
        
        print(cell.btn_trunk_forward.tag as Any)
        if (cell.btn_trunk_forward.tag == 130) {
            
            cell.btn_trunk_forward.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_trunk, my_name: my_name)
            
            cell.btn_trunk_forward.tag = 131
        } else {
            cell.btn_trunk_forward.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_trunk, my_name: my_name)
            
            cell.btn_trunk_forward.tag = 130
        }
        // show data
        self.show_data()
    }
    
    @objc func trunk_backward_ClickMethod() {
        let indexPath = IndexPath.init(row: trunk_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Backward Lean"
        
        print(cell.btn_trunk_backward.tag as Any)
        if (cell.btn_trunk_backward.tag == 140) {
            
            cell.btn_trunk_backward.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_trunk, my_name: my_name)
            
            cell.btn_trunk_backward.tag = 141
        } else {
            cell.btn_trunk_backward.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_trunk, my_name: my_name)
            
            cell.btn_trunk_backward.tag = 140
        }
        // show data
        self.show_data()
    }
    
    
    @objc func trunk_right_ClickMethod() {
        let indexPath = IndexPath.init(row: trunk_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Right Lean"
        
        print(cell.btn_trunk_right.tag as Any)
        if (cell.btn_trunk_right.tag == 150) {
            
            cell.btn_trunk_right.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_trunk, my_name: my_name)
            
            cell.btn_trunk_right.tag = 151
        } else {
            cell.btn_trunk_right.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_trunk, my_name: my_name)
            
            cell.btn_trunk_right.tag = 150
        }// show data
        self.show_data()
    }
    
    
    @objc func trunk_left_ClickMethod() {
        let indexPath = IndexPath.init(row: trunk_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Left Lean"
        print(cell.btn_trunk_left.tag as Any)
        if (cell.btn_trunk_left.tag == 160) {
            
            cell.btn_trunk_left.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_trunk, my_name: my_name)
            
            cell.btn_trunk_left.tag = 161
        } else {
            cell.btn_trunk_left.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_trunk, my_name: my_name)
            
            cell.btn_trunk_left.tag = 160
        }// show data
        self.show_data()
    }
    
    
    @objc func trunk_restricted_ClickMethod() {
        let indexPath = IndexPath.init(row: trunk_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Restricted Trunk Rotation"
        
        print(cell.btn_trunk_restricted.tag as Any)
        if (cell.btn_trunk_restricted.tag == 170) {
            
            cell.btn_trunk_restricted.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_trunk, my_name: my_name)
            
            cell.btn_trunk_restricted.tag = 171
        } else {
            cell.btn_trunk_restricted.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_trunk, my_name: my_name)
            
            cell.btn_trunk_restricted.tag = 170
        }
        // show data
        self.show_data()
    }
    
    
    /*
     cell..addTarget(self, action: #selector(ankle_excessive_plant_clicked_method), for: .touchUpInside)
     cell..addTarget(self, action: #selector(ankle_excessive_plant_clicked_method), for: .touchUpInside)
     cell.btn_ankle_excessive_dorsirflexion.addTarget(self, action: #selector(ankle_excessive_plant_clicked_method), for: .touchUpInside)
     cell.btn_ankle_insufficient_dorsirflextion.addTarget(self, action: #selector(ankle_excessive_plant_clicked_method), for: .touchUpInside)
     
     cell.btn_inversion_main.addTarget(self, action: #selector(ankle_excessive_plant_clicked_method), for: .touchUpInside)
     cell.btn_inversion_main_Slight.addTarget(self, action: #selector(ankle_excessive_plant_clicked_method), for: .touchUpInside)
     cell.btn_inversion_main_Moderate.addTarget(self, action: #selector(ankle_excessive_plant_clicked_method), for: .touchUpInside)
     cell.btn_inversion_main_Excessive.addTarget(self, action: #selector(ankle_excessive_plant_clicked_method), for: .touchUpInside)
     
     cell.btn_ankle_eversion_main.addTarget(self, action: #selector(ankle_excessive_plant_clicked_method), for: .touchUpInside)
     cell.btn_ankle_eversion_main_slight.addTarget(self, action: #selector(ankle_excessive_plant_clicked_method), for: .touchUpInside)
     cell.btn_ankle_eversion_main_moderate.addTarget(self, action: #selector(ankle_excessive_plant_clicked_method), for: .touchUpInside)
     cell.btn_ankle_eversion_main_excessive.addTarget(self, action: #selector(ankle_excessive_plant_clicked_method), for: .touchUpInside)
     
     cell.btn_ankle_stiff.addTarget(self, action: #selector(ankle_excessive_plant_clicked_method), for: .touchUpInside)
     cell.btn_ankle_unstable.addTarget(self, action: #selector(ankle_excessive_plant_clicked_method), for: .touchUpInside)
     
     */
    // MARK: - ANKLE -
    @objc func ankle_excessive_plant_clicked_method() {
        let indexPath = IndexPath.init(row: ankle_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Excessive Plantarflexion"
        
        print(cell.btn_ankle_excessive_plant.tag as Any)
        if (cell.btn_ankle_excessive_plant.tag == 180) {
            
            cell.btn_ankle_excessive_plant.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_ankle, my_name: my_name)
            
            cell.btn_ankle_excessive_plant.tag = 181
        } else {
            cell.btn_ankle_excessive_plant.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_ankle, my_name: my_name)
            
            cell.btn_ankle_excessive_plant.tag = 180
        }
    }
    
    @objc func ankle_insufficient_plant_clicked_method() {
        let indexPath = IndexPath.init(row: ankle_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Insufficient Plantarflexion"
        
        print(cell.btn_ankle_insufficient_plant.tag as Any)
        if (cell.btn_ankle_insufficient_plant.tag == 190) {
            
            cell.btn_ankle_insufficient_plant.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_ankle, my_name: my_name)
            
            cell.btn_ankle_insufficient_plant.tag = 191
        } else {
            cell.btn_ankle_insufficient_plant.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_ankle, my_name: my_name)
            
            cell.btn_ankle_insufficient_plant.tag = 190
        }
    }
    
    @objc func ankle_excessive_dorsirflexion_clicked_method() {
        let indexPath = IndexPath.init(row: ankle_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Excessive Dorsiflexion"
        
        print(cell.btn_ankle_excessive_dorsirflexion.tag as Any)
        if (cell.btn_ankle_excessive_dorsirflexion.tag == 200) {
            
            cell.btn_ankle_excessive_dorsirflexion.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_ankle, my_name: my_name)
            
            cell.btn_ankle_excessive_dorsirflexion.tag = 201
        } else {
            cell.btn_ankle_excessive_dorsirflexion.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_ankle, my_name: my_name)
            
            cell.btn_ankle_excessive_dorsirflexion.tag = 200
        }
    }
    
    @objc func ankle_insufficient_dorsirflextion_clicked_method() {
        let indexPath = IndexPath.init(row: ankle_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Insufficient Dorsiflexion"
        
        print(cell.btn_ankle_insufficient_dorsirflextion.tag as Any)
        if (cell.btn_ankle_insufficient_dorsirflextion.tag == 210) {
            
            cell.btn_ankle_insufficient_dorsirflextion.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            for indexx in 0..<self.arr_ankle.count {
                let item = self.arr_ankle[indexx] as? [String:Any]
                
                if "\(item!["name"]!)" == my_name {
                    print(indexx)
                    // remove
                    self.arr_ankle.removeObject(at: indexx)
                    // insert
                    let custom_foot = [
                        "name":my_name,
                        "type":"yes"
                    ]
                    self.arr_ankle.insert(custom_foot, at: indexx)
                    
                }
            }
            
            cell.btn_ankle_insufficient_dorsirflextion.tag = 211
        } else {
            cell.btn_ankle_insufficient_dorsirflextion.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_ankle, my_name: my_name)
            
            cell.btn_ankle_insufficient_dorsirflextion.tag = 210
        }
    }
    
    @objc func ankle_inversion_main_clicked_method() {
        let indexPath = IndexPath.init(row: ankle_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Inversion"
        
        print(cell.btn_inversion_main.tag as Any)
        if (cell.btn_inversion_main.tag == 220) {
            
            cell.btn_inversion_main.setImage(UIImage(named: "check_icon"), for: .normal)
           
            cell.btn_inversion_main.tag = 221
        } else {
            cell.btn_inversion_main.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            print(self.arr_ankle as Any)
            
            // remove 1
            for indexx in 0..<self.arr_ankle.count {
                let item = self.arr_ankle[indexx] as? [String:Any]
                
                if "\(item!["name"]!)" == "Inversion : Slight" {
                    print(indexx)
                    // remove
                    self.arr_ankle.removeObject(at: indexx)
                    // insert
                    let custom_foot = [
                        "name":"Inversion : Slight",
                        "type":"no"
                    ]
                    self.arr_ankle.insert(custom_foot, at: indexx)
                    
                }
            }
            // remove 2
            for indexx in 0..<self.arr_ankle.count {
                let item = self.arr_ankle[indexx] as? [String:Any]
                
                if "\(item!["name"]!)" == "Inversion : Moderate" {
                    print(indexx)
                    // remove
                    self.arr_ankle.removeObject(at: indexx)
                    // insert
                    let custom_foot = [
                        "name":"Inversion : Moderate",
                        "type":"no"
                    ]
                    self.arr_ankle.insert(custom_foot, at: indexx)
                    
                }
            }
            // remove 3
            for indexx in 0..<self.arr_ankle.count {
                let item = self.arr_ankle[indexx] as? [String:Any]
                
                if "\(item!["name"]!)" == "Inversion : Excessive" {
                    print(indexx)
                    // remove
                    self.arr_ankle.removeObject(at: indexx)
                    // insert
                    let custom_foot = [
                        "name":"Inversion : Excessive",
                        "type":"no"
                    ]
                    self.arr_ankle.insert(custom_foot, at: indexx)
                    
                }
            }
            
            // SUB TYPE ALSO DE-SELECT
            cell.btn_inversion_main_Slight.setImage(UIImage(named: "unchecked"), for: .normal)
            cell.btn_inversion_main_Moderate.setImage(UIImage(named: "unchecked"), for: .normal)
            cell.btn_inversion_main_Excessive.setImage(UIImage(named: "unchecked"), for: .normal)
            
            cell.btn_inversion_main_Slight.tag = 230
            cell.btn_inversion_main_Moderate.tag = 240
            cell.btn_inversion_main_Excessive.tag = 250
            
            cell.btn_inversion_main.tag = 220
            print(self.arr_ankle as Any)
        }
    }
    
    @objc func ankle_inversion_main_Slight_clicked_method() {
        let indexPath = IndexPath.init(row: ankle_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Inversion : Slight"
        
        if (cell.btn_inversion_main.tag == 221) {
            
            print(cell.btn_inversion_main_Slight.tag as Any)
            if (cell.btn_inversion_main_Slight.tag == 230) {
                
                cell.btn_inversion_main_Slight.setImage(UIImage(named: "checked"), for: .normal)
                
                // add
                self.add_data_in_array(dynamic_mut_arr: arr_ankle, my_name: my_name)
                
                // remove 2
                for indexx in 0..<self.arr_ankle.count {
                    let item = self.arr_ankle[indexx] as? [String:Any]
                    
                    if "\(item!["name"]!)" == "Inversion : Moderate" {
                        print(indexx)
                        // remove
                        self.arr_ankle.removeObject(at: indexx)
                        // insert
                        let custom_foot = [
                            "name":"Inversion : Moderate",
                            "type":"no"
                        ]
                        self.arr_ankle.insert(custom_foot, at: indexx)
                        
                    }
                }
                // remove 3
                for indexx in 0..<self.arr_ankle.count {
                    let item = self.arr_ankle[indexx] as? [String:Any]
                    
                    if "\(item!["name"]!)" == "Inversion : Excessive" {
                        print(indexx)
                        // remove
                        self.arr_ankle.removeObject(at: indexx)
                        // insert
                        let custom_foot = [
                            "name":"Inversion : Excessive",
                            "type":"no"
                        ]
                        self.arr_ankle.insert(custom_foot, at: indexx)
                        
                    }
                }
                
                // uncheck other
                cell.btn_inversion_main_Moderate.setImage(UIImage(named: "unchecked"), for: .normal)
                cell.btn_inversion_main_Excessive.setImage(UIImage(named: "unchecked"), for: .normal)
                
                cell.btn_inversion_main_Slight.tag = 231
            } else {
                cell.btn_inversion_main_Slight.setImage(UIImage(named: "unchecked"), for: .normal)
                
                // remove
                self.remove_data_in_array(dynamic_mut_arr: arr_ankle, my_name: my_name)
                
                cell.btn_inversion_main_Slight.tag = 230
            }
        } else {
            print("YOU HAVE TO SELECT INVERSION")
        }
        
        
    }
    
    @objc func ankle_inversion_main_Moderate_clicked_method() {
        let indexPath = IndexPath.init(row: ankle_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Inversion : Moderate"
        
        if (cell.btn_inversion_main.tag == 221) {
        print(cell.btn_inversion_main_Moderate.tag as Any)
        if (cell.btn_inversion_main_Moderate.tag == 240) {
            
            cell.btn_inversion_main_Moderate.setImage(UIImage(named: "checked"), for: .normal)
            
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_ankle, my_name: my_name)
            
            // remove 1
            for indexx in 0..<self.arr_ankle.count {
                let item = self.arr_ankle[indexx] as? [String:Any]
                
                if "\(item!["name"]!)" == "Inversion : Slight" {
                    print(indexx)
                    // remove
                    self.arr_ankle.removeObject(at: indexx)
                    // insert
                    let custom_foot = [
                        "name":"Inversion : Slight",
                        "type":"no"
                    ]
                    self.arr_ankle.insert(custom_foot, at: indexx)
                    
                }
            }
            // remove 3
            for indexx in 0..<self.arr_ankle.count {
                let item = self.arr_ankle[indexx] as? [String:Any]
                
                if "\(item!["name"]!)" == "Inversion : Excessive" {
                    print(indexx)
                    // remove
                    self.arr_ankle.removeObject(at: indexx)
                    // insert
                    let custom_foot = [
                        "name":"Inversion : Excessive",
                        "type":"no"
                    ]
                    self.arr_ankle.insert(custom_foot, at: indexx)
                    
                }
            }
            
            // uncheck other
            cell.btn_inversion_main_Slight.setImage(UIImage(named: "unchecked"), for: .normal)
            cell.btn_inversion_main_Excessive.setImage(UIImage(named: "unchecked"), for: .normal)
            
            cell.btn_inversion_main_Moderate.tag = 241
        } else {
            cell.btn_inversion_main_Moderate.setImage(UIImage(named: "unchecked"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_ankle, my_name: my_name)
            
            cell.btn_inversion_main_Moderate.tag = 240
        }
        } else {
            print("YOU HAVE TO SELECT INVERSION")
        }
    }
    
    @objc func ankle_inversion_main_Excessive_clicked_method() {
        let indexPath = IndexPath.init(row: ankle_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Inversion : Excessive"
        
        if (cell.btn_inversion_main.tag == 221) {
            print(cell.btn_inversion_main_Excessive.tag as Any)
            if (cell.btn_inversion_main_Excessive.tag == 250) {
                
                cell.btn_inversion_main_Excessive.setImage(UIImage(named: "checked"), for: .normal)
                
                // add
                self.add_data_in_array(dynamic_mut_arr: arr_ankle, my_name: my_name)
                
                // remove 1
                for indexx in 0..<self.arr_ankle.count {
                    let item = self.arr_ankle[indexx] as? [String:Any]
                    
                    if "\(item!["name"]!)" == "Inversion : Slight" {
                        print(indexx)
                        // remove
                        self.arr_ankle.removeObject(at: indexx)
                        // insert
                        let custom_foot = [
                            "name":"Inversion : Slight",
                            "type":"no"
                        ]
                        self.arr_ankle.insert(custom_foot, at: indexx)
                        
                    }
                }
                // remove 2
                for indexx in 0..<self.arr_ankle.count {
                    let item = self.arr_ankle[indexx] as? [String:Any]
                    
                    if "\(item!["name"]!)" == "Inversion : Moderate" {
                        print(indexx)
                        // remove
                        self.arr_ankle.removeObject(at: indexx)
                        // insert
                        let custom_foot = [
                            "name":"Inversion : Moderate",
                            "type":"no"
                        ]
                        self.arr_ankle.insert(custom_foot, at: indexx)
                        
                    }
                }
                
                
                
                
                
                // uncheck other
                cell.btn_inversion_main_Slight.setImage(UIImage(named: "unchecked"), for: .normal)
                cell.btn_inversion_main_Moderate.setImage(UIImage(named: "unchecked"), for: .normal)
                
                cell.btn_inversion_main_Excessive.tag = 251
            } else {
                cell.btn_inversion_main_Excessive.setImage(UIImage(named: "unchecked"), for: .normal)
                
                // remove
                self.remove_data_in_array(dynamic_mut_arr: arr_ankle, my_name: my_name)
                
                cell.btn_inversion_main_Excessive.tag = 250
            }
        } else {
            print("YOU HAVE TO SELECT INVERSION")
        }
    }
    
    // MARK: - EVERION Start -
    @objc func ankle_eversion_main_clicked_method() {
        let indexPath = IndexPath.init(row: ankle_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Eversion"
        
        print(cell.btn_ankle_eversion_main.tag as Any)
        if (cell.btn_ankle_eversion_main.tag == 260) {
            
            cell.btn_ankle_eversion_main.setImage(UIImage(named: "check_icon"), for: .normal)
            
            cell.btn_ankle_eversion_main.tag = 261
        } else {
            cell.btn_ankle_eversion_main.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // SUB TYPE ALSO DE-SELECT
            cell.btn_ankle_eversion_main_slight.setImage(UIImage(named: "unchecked"), for: .normal)
            cell.btn_ankle_eversion_main_moderate.setImage(UIImage(named: "unchecked"), for: .normal)
            cell.btn_ankle_eversion_main_excessive.setImage(UIImage(named: "unchecked"), for: .normal)
            
            cell.btn_ankle_eversion_main_slight.tag = 270
            cell.btn_ankle_eversion_main_moderate.tag = 280
            cell.btn_ankle_eversion_main_excessive.tag = 290
            
            self.remove_data_in_array(dynamic_mut_arr: arr_ankle, my_name: "Eversion : Slight")
            self.remove_data_in_array(dynamic_mut_arr: arr_ankle, my_name: "Eversion : Moderate")
            self.remove_data_in_array(dynamic_mut_arr: arr_ankle, my_name: "Eversion : Excessive")
            
            cell.btn_ankle_eversion_main.tag = 260
        }
    }
    
    @objc func ankle_eversion_main_slight_clicked_method() {
        let indexPath = IndexPath.init(row: ankle_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Eversion : Slight"
        
        if (cell.btn_ankle_eversion_main.tag == 261) {
            
            print(cell.btn_ankle_eversion_main_slight.tag as Any)
            if (cell.btn_ankle_eversion_main_slight.tag == 270) {
                
                cell.btn_ankle_eversion_main_slight.setImage(UIImage(named: "checked"), for: .normal)
                
                // add
                self.add_data_in_array(dynamic_mut_arr: arr_ankle, my_name: my_name)
                
                
                
                // remove other two
                cell.btn_ankle_eversion_main_moderate.setImage(UIImage(named: "unchecked"), for: .normal)
                cell.btn_ankle_eversion_main_moderate.tag = 280
                
                cell.btn_ankle_eversion_main_excessive.setImage(UIImage(named: "unchecked"), for: .normal)
                cell.btn_ankle_eversion_main_excessive.tag = 290
                
                self.remove_data_in_array(dynamic_mut_arr: arr_ankle, my_name: "Eversion : Moderate")
                self.remove_data_in_array(dynamic_mut_arr: arr_ankle, my_name: "Eversion : Excessive")
                
                cell.btn_ankle_eversion_main_slight.tag = 271
            } else {
                cell.btn_ankle_eversion_main_slight.setImage(UIImage(named: "unchecked"), for: .normal)
                
                // remove
                self.remove_data_in_array(dynamic_mut_arr: arr_ankle, my_name: my_name)
                
                cell.btn_ankle_eversion_main_slight.tag = 270
            }
        }    else {
            print("YOU HAVE TO SELECT EVERION")
        }
    }
    
    @objc func ankle_eversion_main_moderate_clicked_method() {
        let indexPath = IndexPath.init(row: ankle_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Eversion : Moderate"
        
        if (cell.btn_ankle_eversion_main.tag == 261) {
            
            print(cell.btn_ankle_eversion_main_moderate.tag as Any)
            if (cell.btn_ankle_eversion_main_moderate.tag == 280) {
                
                cell.btn_ankle_eversion_main_moderate.setImage(UIImage(named: "checked"), for: .normal)
                
                // add
                self.add_data_in_array(dynamic_mut_arr: arr_ankle, my_name: my_name)
                
                // remove two
                cell.btn_ankle_eversion_main_slight.setImage(UIImage(named: "unchecked"), for: .normal)
                cell.btn_ankle_eversion_main_slight.tag = 270
                cell.btn_ankle_eversion_main_excessive.setImage(UIImage(named: "unchecked"), for: .normal)
                cell.btn_ankle_eversion_main_excessive.tag = 290
                
                self.remove_data_in_array(dynamic_mut_arr: arr_ankle, my_name: "Eversion : Slight")
                self.remove_data_in_array(dynamic_mut_arr: arr_ankle, my_name: "Eversion : Excessive")
                
                cell.btn_ankle_eversion_main_moderate.tag = 281
            } else {
                cell.btn_ankle_eversion_main_moderate.setImage(UIImage(named: "unchecked"), for: .normal)
                
                // remove
                self.remove_data_in_array(dynamic_mut_arr: arr_ankle, my_name: my_name)
                
                cell.btn_ankle_eversion_main_moderate.tag = 280
            }
            
        }    else {
            print("YOU HAVE TO SELECT EVERION")
        }
    }
    
    @objc func ankle_eversion_main_excessive_clicked_method() {
        let indexPath = IndexPath.init(row: ankle_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Eversion : Excessive"
        
        if (cell.btn_ankle_eversion_main.tag == 261) {
            
            print(cell.btn_ankle_eversion_main_excessive.tag as Any)
            if (cell.btn_ankle_eversion_main_excessive.tag == 290) {
                
                cell.btn_ankle_eversion_main_excessive.setImage(UIImage(named: "checked"), for: .normal)
                
                // add
                self.add_data_in_array(dynamic_mut_arr: arr_ankle, my_name: my_name)
                
                // remove two
                cell.btn_ankle_eversion_main_slight.setImage(UIImage(named: "unchecked"), for: .normal)
                cell.btn_ankle_eversion_main_slight.tag = 270
                cell.btn_ankle_eversion_main_moderate.setImage(UIImage(named: "unchecked"), for: .normal)
                cell.btn_ankle_eversion_main_moderate.tag = 280
                
                self.remove_data_in_array(dynamic_mut_arr: arr_ankle, my_name: "Eversion : Slight")
                self.remove_data_in_array(dynamic_mut_arr: arr_ankle, my_name: "Eversion : Moderate")
                
                cell.btn_ankle_eversion_main_excessive.tag = 291
            } else {
                cell.btn_ankle_eversion_main_excessive.setImage(UIImage(named: "unchecked"), for: .normal)
                
                // remove
                self.remove_data_in_array(dynamic_mut_arr: arr_ankle, my_name: my_name)
                
                cell.btn_ankle_eversion_main_excessive.tag = 290
            }
            
        }    else {
            print("YOU HAVE TO SELECT EVERION")
        }
    }
    
    // MARK: - EVERION End -
    
    @objc func ankle_stiff_clicked_method() {
        let indexPath = IndexPath.init(row: ankle_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Stiff ankle"
        
        print(cell.btn_ankle_stiff.tag as Any)
        if (cell.btn_ankle_stiff.tag == 300) {
            
            cell.btn_ankle_stiff.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_ankle, my_name: my_name)
            
            cell.btn_ankle_stiff.tag = 301
        } else {
            cell.btn_ankle_stiff.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_trunk, my_name: my_name)
            
            cell.btn_ankle_stiff.tag = 300
        }
    }
     
    @objc func ankle_unstable_clicked_method() {
        let indexPath = IndexPath.init(row: ankle_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Unstable Ankle"
        
        print(cell.btn_ankle_unstable.tag as Any)
        if (cell.btn_ankle_unstable.tag == 310) {
            
            cell.btn_ankle_unstable.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_ankle, my_name: my_name)
            
            cell.btn_ankle_unstable.tag = 311
        } else {
            cell.btn_ankle_unstable.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_trunk, my_name: my_name)
            
            cell.btn_ankle_unstable.tag = 310
        }
    }
    
    // MARK: - KNEE -
    /*
    cell.btn_knee_excessive_flexion.addTarget(self, action: #selector(knee_excessive_flexion_clicked_method), for: .touchUpInside)
    cell.btn_knee_insufficient_flexion.addTarget(self, action: #selector(knee_insufficient_flexion_clicked_method), for: .touchUpInside)
    cell.btn_knee_hyperextension.addTarget(self, action: #selector(knee_hyperextension_clicked_method), for: .touchUpInside)
    */
    @objc func knee_excessive_flexion_clicked_method() {
        let indexPath = IndexPath.init(row: knee_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Excessive Flexion"
        
        print(cell.btn_knee_excessive_flexion.tag as Any)
        if (cell.btn_knee_excessive_flexion.tag == 320) {
            
            cell.btn_knee_excessive_flexion.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_knee, my_name: my_name)
            
            cell.btn_knee_excessive_flexion.tag = 321
        } else {
            cell.btn_knee_excessive_flexion.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_knee, my_name: my_name)
            
            cell.btn_knee_excessive_flexion.tag = 320
        }
    }
    @objc func knee_insufficient_flexion_clicked_method() {
        let indexPath = IndexPath.init(row: knee_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Insufficient Flexion"
        
        print(cell.btn_knee_insufficient_flexion.tag as Any)
        if (cell.btn_knee_insufficient_flexion.tag == 330) {
            
            cell.btn_knee_insufficient_flexion.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_knee, my_name: my_name)
            
            cell.btn_knee_insufficient_flexion.tag = 331
        } else {
            cell.btn_knee_insufficient_flexion.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_knee, my_name: my_name)
            
            cell.btn_knee_insufficient_flexion.tag = 330
        }
    }
    @objc func knee_hyperextension_clicked_method() {
        let indexPath = IndexPath.init(row: knee_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Hyperextension"
        
        print(cell.btn_knee_hyperextension.tag as Any)
        if (cell.btn_knee_hyperextension.tag == 340) {
            
            cell.btn_knee_hyperextension.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_knee, my_name: my_name)
            
            cell.btn_knee_hyperextension.tag = 341
        } else {
            cell.btn_knee_hyperextension.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_knee, my_name: my_name)
            
            cell.btn_knee_hyperextension.tag = 340
        }
    }
    
    /*
     cell.btn_knee_varus_main.addTarget(self, action: #selector(knee_varus_main_clicked_method), for: .touchUpInside)
     cell.btn_knee_varus_slight.addTarget(self, action: #selector(knee_varus_slight_clicked_method), for: .touchUpInside)
     cell.btn_knee_varus_moderate.addTarget(self, action: #selector(knee_varus_moderate_clicked_method), for: .touchUpInside)
     cell.btn_knee_varus_excessive.addTarget(self, action: #selector(knee_varus_excessive_clicked_method), for: .touchUpInside)
     */
    @objc func knee_varus_main_clicked_method() {
        let indexPath = IndexPath.init(row: knee_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        
        
        print(cell.btn_knee_varus_main.tag as Any)
        if (cell.btn_knee_varus_main.tag == 350) {
            
            cell.btn_knee_varus_main.setImage(UIImage(named: "check_icon"), for: .normal)
            
            cell.btn_knee_varus_main.tag = 351
        } else {
            cell.btn_knee_varus_main.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // uncheck sub category
            cell.btn_knee_varus_slight.setImage(UIImage(named: "unchecked"), for: .normal)
            cell.btn_knee_varus_moderate.setImage(UIImage(named: "unchecked"), for: .normal)
            cell.btn_knee_varus_excessive.setImage(UIImage(named: "unchecked"), for: .normal)
            
            cell.btn_knee_varus_slight.tag = 360
            cell.btn_knee_varus_moderate.tag = 370
            cell.btn_knee_varus_excessive.tag = 380
            
            self.remove_data_in_array(dynamic_mut_arr: arr_knee, my_name: "Varus : Slight")
            self.remove_data_in_array(dynamic_mut_arr: arr_knee, my_name: "Varus : Moderate")
            self.remove_data_in_array(dynamic_mut_arr: arr_knee, my_name: "Varus : Excessive")
            
            cell.btn_knee_varus_main.tag = 350
        }
    }
    @objc func knee_varus_slight_clicked_method() {
        let indexPath = IndexPath.init(row: knee_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Varus : Slight"
        
        if (cell.btn_knee_varus_main.tag == 351) {
            
            print(cell.btn_knee_varus_slight.tag as Any)
            if (cell.btn_knee_varus_slight.tag == 360) {
                
                cell.btn_knee_varus_slight.setImage(UIImage(named: "checked"), for: .normal)
                
                // add
                self.add_data_in_array(dynamic_mut_arr: arr_knee, my_name: my_name)
                
                // remove two
                cell.btn_knee_varus_moderate.setImage(UIImage(named: "unchecked"), for: .normal)
                cell.btn_knee_varus_moderate.tag = 370
                cell.btn_knee_varus_excessive.setImage(UIImage(named: "unchecked"), for: .normal)
                cell.btn_knee_varus_excessive.tag = 380
                
                self.remove_data_in_array(dynamic_mut_arr: arr_knee, my_name: "Varus : Moderate")
                self.remove_data_in_array(dynamic_mut_arr: arr_knee, my_name: "Varus : Excessive")
                
                cell.btn_knee_varus_slight.tag = 361
            } else {
                cell.btn_knee_varus_slight.setImage(UIImage(named: "unchecked"), for: .normal)
                
                // remove
                self.remove_data_in_array(dynamic_mut_arr: arr_knee, my_name: my_name)
                
                cell.btn_knee_varus_slight.tag = 360
            }
            
        } else {
            
        }
    }
    
    @objc func knee_varus_moderate_clicked_method() {
        let indexPath = IndexPath.init(row: knee_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Varus : Moderate"
        
        if (cell.btn_knee_varus_main.tag == 351) {
        print(cell.btn_knee_varus_moderate.tag as Any)
        if (cell.btn_knee_varus_moderate.tag == 370) {
            
            cell.btn_knee_varus_moderate.setImage(UIImage(named: "checked"), for: .normal)
            
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_knee, my_name: my_name)
            
            // remove two
            cell.btn_knee_varus_slight.setImage(UIImage(named: "unchecked"), for: .normal)
            cell.btn_knee_varus_slight.tag = 360
            cell.btn_knee_varus_excessive.setImage(UIImage(named: "unchecked"), for: .normal)
            cell.btn_knee_varus_excessive.tag = 380
            
            self.remove_data_in_array(dynamic_mut_arr: arr_knee, my_name: "Varus : Slight")
            self.remove_data_in_array(dynamic_mut_arr: arr_knee, my_name: "Varus : Excessive")
            
            cell.btn_knee_varus_moderate.tag = 371
        } else {
            cell.btn_knee_varus_moderate.setImage(UIImage(named: "unchecked"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_knee, my_name: my_name)
            
            cell.btn_knee_varus_moderate.tag = 370
        }
        } else {
            
        }
    }
    @objc func knee_varus_excessive_clicked_method() {
        let indexPath = IndexPath.init(row: knee_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Varus : Excessive"
        
        if (cell.btn_knee_varus_main.tag == 351) {
            
            print(cell.btn_knee_varus_excessive.tag as Any)
            if (cell.btn_knee_varus_excessive.tag == 380) {
                
                cell.btn_knee_varus_excessive.setImage(UIImage(named: "checked"), for: .normal)
                
                // add
                self.add_data_in_array(dynamic_mut_arr: arr_knee, my_name: my_name)
                
                // remove two
                cell.btn_knee_varus_slight.setImage(UIImage(named: "unchecked"), for: .normal)
                cell.btn_knee_varus_slight.tag = 360
                cell.btn_knee_varus_moderate.setImage(UIImage(named: "unchecked"), for: .normal)
                cell.btn_knee_varus_moderate.tag = 370
                
                self.remove_data_in_array(dynamic_mut_arr: arr_knee, my_name: "Varus : Slight")
                self.remove_data_in_array(dynamic_mut_arr: arr_knee, my_name: "Varus : Moderate")
                
                cell.btn_knee_varus_excessive.tag = 381
            } else {
                cell.btn_knee_varus_excessive.setImage(UIImage(named: "unchecked"), for: .normal)
                
                // remove
                self.remove_data_in_array(dynamic_mut_arr: arr_knee, my_name: my_name)
                
                cell.btn_knee_varus_excessive.tag = 380
            }
        } else {
            
        }
    }
    
    /*
     cell.btn_knee_valgus_main.addTarget(self, action: #selector(knee_valgus_main_clicked_method), for: .touchUpInside)
    cell.btn_knee_valgus_slight.addTarget(self, action: #selector(knee_valgus_slight_clicked_method), for: .touchUpInside)
    cell.btn_knee_valgus_moderate.addTarget(self, action: #selector(knee_valgus_moderate_clicked_method), for: .touchUpInside)
    cell.btn_knee_valgus_excessive.addTarget(self, action: #selector(knee_valgus_excessive_clicked_method), for: .touchUpInside)
    */
    @objc func knee_valgus_main_clicked_method() {
        let indexPath = IndexPath.init(row: knee_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Valgus"
        
        print(cell.btn_knee_valgus_main.tag as Any)
        if (cell.btn_knee_valgus_main.tag == 390) {
            
            cell.btn_knee_valgus_main.setImage(UIImage(named: "check_icon"), for: .normal)
            
            cell.btn_knee_valgus_main.tag = 391
        } else {
            cell.btn_knee_valgus_main.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove all
            cell.btn_knee_valgus_slight.setImage(UIImage(named: "unchecked"), for: .normal)
            cell.btn_knee_valgus_slight.tag = 400
            cell.btn_knee_valgus_moderate.setImage(UIImage(named: "unchecked"), for: .normal)
            cell.btn_knee_valgus_moderate.tag = 410
            cell.btn_knee_valgus_excessive.setImage(UIImage(named: "unchecked"), for: .normal)
            cell.btn_knee_valgus_excessive.tag = 420
            
            self.remove_data_in_array(dynamic_mut_arr: arr_knee, my_name: "Valgus : Slight")
            self.remove_data_in_array(dynamic_mut_arr: arr_knee, my_name: "Valgus : Moderate")
            self.remove_data_in_array(dynamic_mut_arr: arr_knee, my_name: "Valgus : Excessive")
            
            cell.btn_knee_valgus_main.tag = 390
        }
    }
    @objc func knee_valgus_slight_clicked_method() {
        let indexPath = IndexPath.init(row: knee_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Valgus : Slight"
        
        if (cell.btn_knee_valgus_main.tag == 391) {
            
        print(cell.btn_knee_valgus_slight.tag as Any)
        if (cell.btn_knee_valgus_slight.tag == 400) {
            
            cell.btn_knee_valgus_slight.setImage(UIImage(named: "checked"), for: .normal)
            
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_knee, my_name: my_name)
            
            // remove two
            cell.btn_knee_valgus_moderate.setImage(UIImage(named: "unchecked"), for: .normal)
            cell.btn_knee_valgus_moderate.tag = 410
            cell.btn_knee_valgus_excessive.setImage(UIImage(named: "unchecked"), for: .normal)
            cell.btn_knee_valgus_excessive.tag = 420
            
            self.remove_data_in_array(dynamic_mut_arr: arr_knee, my_name: "Valgus : Moderate")
            self.remove_data_in_array(dynamic_mut_arr: arr_knee, my_name: "Valgus : Excessive")
            
            cell.btn_knee_valgus_slight.tag = 401
        } else {
            cell.btn_knee_valgus_slight.setImage(UIImage(named: "unchecked"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr:arr_knee, my_name: my_name)
            
            cell.btn_knee_valgus_slight.tag = 400
        }
        } else {
            
        }
    }
    @objc func knee_valgus_moderate_clicked_method() {
        let indexPath = IndexPath.init(row: knee_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Valgus : Moderate"
        
        if (cell.btn_knee_valgus_main.tag == 391) {
            
        print(cell.btn_knee_valgus_moderate.tag as Any)
        if (cell.btn_knee_valgus_moderate.tag == 410) {
            
            cell.btn_knee_valgus_moderate.setImage(UIImage(named: "checked"), for: .normal)
            
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_knee, my_name: my_name)
            
            // remove two
            cell.btn_knee_valgus_slight.setImage(UIImage(named: "unchecked"), for: .normal)
            cell.btn_knee_valgus_slight.tag = 400
            cell.btn_knee_valgus_excessive.setImage(UIImage(named: "unchecked"), for: .normal)
            cell.btn_knee_valgus_excessive.tag = 420
            
            self.remove_data_in_array(dynamic_mut_arr: arr_knee, my_name: "Valgus : Slight")
            self.remove_data_in_array(dynamic_mut_arr: arr_knee, my_name: "Valgus : Excessive")
            
            cell.btn_knee_valgus_moderate.tag = 411
        } else {
            cell.btn_knee_valgus_moderate.setImage(UIImage(named: "unchecked"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_knee, my_name: my_name)
            
            cell.btn_knee_valgus_moderate.tag = 410
        }
        } else {
            
        }
    }
    @objc func knee_valgus_excessive_clicked_method() {
        let indexPath = IndexPath.init(row: knee_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Valgus : Excessive"
        
        if (cell.btn_knee_valgus_main.tag == 391) {
            
            print(cell.btn_knee_valgus_excessive.tag as Any)
            if (cell.btn_knee_valgus_excessive.tag == 420) {
                
                cell.btn_knee_valgus_excessive.setImage(UIImage(named: "checked"), for: .normal)
                
                // add
                self.add_data_in_array(dynamic_mut_arr: arr_knee, my_name: my_name)
                
                // remove two
                cell.btn_knee_valgus_slight.setImage(UIImage(named: "unchecked"), for: .normal)
                cell.btn_knee_valgus_slight.tag = 400
                cell.btn_knee_valgus_moderate.setImage(UIImage(named: "unchecked"), for: .normal)
                cell.btn_knee_valgus_moderate.tag = 410
                
                self.remove_data_in_array(dynamic_mut_arr: arr_knee, my_name: "Valgus : Slight")
                self.remove_data_in_array(dynamic_mut_arr: arr_knee, my_name: "Valgus : Moderate")
                
                cell.btn_knee_valgus_excessive.tag = 421
            } else {
                cell.btn_knee_valgus_excessive.setImage(UIImage(named: "unchecked"), for: .normal)
                
                // remove
                self.remove_data_in_array(dynamic_mut_arr:arr_knee, my_name: my_name)
                
                cell.btn_knee_valgus_excessive.tag = 420
            }
        } else {
            
        }
    }
    /*
     cell.btn_knee_stiff.addTarget(self, action: #selector(knee_stiff_clicked_method), for: .touchUpInside)
     cell.btn_knee_unstable.addTarget(self, action: #selector(knee_unstable_clicked_method), for: .touchUpInside)
     */
    @objc func knee_stiff_clicked_method() {
        let indexPath = IndexPath.init(row: knee_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Stiff Knee"
        
        print(cell.btn_knee_stiff.tag as Any)
        if (cell.btn_knee_stiff.tag == 430) {
            
            cell.btn_knee_stiff.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_knee, my_name: my_name)
            
            cell.btn_knee_stiff.tag = 431
        } else {
            cell.btn_knee_stiff.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_knee, my_name: my_name)
            
            cell.btn_knee_stiff.tag = 430
        }
    }
    @objc func knee_unstable_clicked_method() {
        let indexPath = IndexPath.init(row: knee_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Unstable Knee"
        
        print(cell.btn_knee_unstable.tag as Any)
        if (cell.btn_knee_unstable.tag == 440) {
            
            cell.btn_knee_unstable.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_knee, my_name: my_name)
            
            cell.btn_knee_unstable.tag = 441
        } else {
            cell.btn_knee_unstable.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_knee, my_name: my_name)
            
            cell.btn_knee_unstable.tag = 440
        }
    }
    
    // MARK: - ADD ITEM IN ARRAY -
    @objc func add_data_in_array(dynamic_mut_arr:NSMutableArray,my_name:String) {
        
        // add
        for indexx in 0..<dynamic_mut_arr.count {
            let item = dynamic_mut_arr[indexx] as? [String:Any]
            
            if "\(item!["name"]!)" == my_name {
                print(indexx)
                // remove
                dynamic_mut_arr.removeObject(at: indexx)
                // insert
                let custom_foot = [
                    "name":my_name,
                    "type":"yes"
                ]
                dynamic_mut_arr.insert(custom_foot, at: indexx)
                
            }
        }
        
    }
    
    // MARK: - REMOVE ITEM IN ARRAY -
    @objc func remove_data_in_array(dynamic_mut_arr:NSMutableArray,my_name:String) {
        
        // remove
        for indexx in 0..<dynamic_mut_arr.count {
            let item = dynamic_mut_arr[indexx] as? [String:Any]
            
            if "\(item!["name"]!)" == my_name {
                print(indexx)
                // remove
                dynamic_mut_arr.removeObject(at: indexx)
                // insert
                let custom_foot = [
                    "name":my_name,
                    "type":"no"
                ]
                dynamic_mut_arr.insert(custom_foot, at: indexx)
                
            }
        }
        
    }
   
    //
    /*func saveSalectedData(){
        if var selectedPath = self.tblView.indexPathsForSelectedRows{
            selectedPath = selectedPath.sorted()
            var (footArr, ankleArr, kneeArr, hipArr, pelvisArr, trunkArr) = ([String](),[String](),[String](),[String](),[String](),[String]())
            for data in selectedPath{
                switch data.section {
                case 0:
                    let selectedStr = swingListData[data.section].data[data.row].rowTitle
                    footArr.append(selectedStr)
                case 1:
                    let selectedStr = swingListData[data.section].data[data.row].rowTitle
                    ankleArr.append(selectedStr)
                case 2:
                    let selectedStr = swingListData[data.section].data[data.row].rowTitle
                    kneeArr.append(selectedStr)
                case 3:
                    let selectedStr = swingListData[data.section].data[data.row].rowTitle
                    hipArr.append(selectedStr)
                case 4:
                    let selectedStr = swingListData[data.section].data[data.row].rowTitle
                    pelvisArr.append(selectedStr)
                case 5:
                    let selectedStr = swingListData[data.section].data[data.row].rowTitle
                    trunkArr.append(selectedStr)
                default:
                    break
                }
            }
            
            selected_stance_phase.setObject(footArr.joined(separator:"\n"), forKey: "foot" as NSCopying)
            selected_stance_phase.setObject(ankleArr.joined(separator:"\n"), forKey: "ankle" as NSCopying)
            selected_stance_phase.setObject(kneeArr.joined(separator:"\n"), forKey: "knee" as NSCopying)
            selected_stance_phase.setObject(hipArr.joined(separator:"\n"), forKey: "hip" as NSCopying)
            selected_stance_phase.setObject(pelvisArr.joined(separator:"\n"), forKey: "pelvis" as NSCopying)
            selected_stance_phase.setObject(trunkArr.joined(separator:"\n"), forKey: "trunk" as NSCopying)
            print(selected_stance_phase)
        }
    }*/
    //
    
    /*
     cell..addTarget(self, action: #selector(hip_insufficient_flexion_clicked_method), for: .touchUpInside)
     cell..addTarget(self, action: #selector(hip_insufficient_extension_clicked_method), for: .touchUpInside)
     cell..addTarget(self, action: #selector(hip_excessive_external_rotation_clicked_method), for: .touchUpInside)
     cell..addTarget(self, action: #selector(hip_stiff_clicked_method), for: .touchUpInside)
     
     */
    // MARK: - HIP -
    @objc func hip_insufficient_flexion_clicked_method() {
        let indexPath = IndexPath.init(row: hip_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Insufficient Flexion"
        
        print(cell.btn_hip_insufficient_flexion.tag as Any)
        if (cell.btn_hip_insufficient_flexion.tag == 450) {
            
            cell.btn_hip_insufficient_flexion.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_hip, my_name: my_name)
            
            cell.btn_hip_insufficient_flexion.tag = 451
        } else {
            cell.btn_hip_insufficient_flexion.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: my_name)
            
            cell.btn_hip_insufficient_flexion.tag = 450
        }
    }
    @objc func hip_insufficient_extension_clicked_method() {
        let indexPath = IndexPath.init(row: hip_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Insufficient Extension"
        
        print(cell.btn_hip_insufficient_extension.tag as Any)
        if (cell.btn_hip_insufficient_extension.tag == 460) {
            
            cell.btn_hip_insufficient_extension.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_hip, my_name: my_name)
            
            cell.btn_hip_insufficient_extension.tag = 461
        } else {
            cell.btn_hip_insufficient_extension.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: my_name)
            
            cell.btn_hip_insufficient_extension.tag = 460
        }
    }
    @objc func hip_excessive_external_rotation_clicked_method() {
        let indexPath = IndexPath.init(row: hip_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Excessive External Rotation"
        
        print(cell.btn_hip_excessive_external_rotation.tag as Any)
        if (cell.btn_hip_excessive_external_rotation.tag == 470) {
            
            cell.btn_hip_excessive_external_rotation.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_hip, my_name: my_name)
            
            cell.btn_hip_excessive_external_rotation.tag = 471
        } else {
            cell.btn_hip_excessive_external_rotation.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: my_name)
            
            cell.btn_hip_excessive_external_rotation.tag = 470
        }
    }
    @objc func hip_stiff_clicked_method() {
        let indexPath = IndexPath.init(row: hip_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Stiff Hip"
        
        print(cell.btn_hip_stiff.tag as Any)
        if (cell.btn_hip_stiff.tag == 600) {
            
            cell.btn_hip_stiff.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_hip, my_name: my_name)
            
            cell.btn_hip_stiff.tag = 601
        } else {
            cell.btn_hip_stiff.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: my_name)
            
            cell.btn_hip_stiff.tag = 600
        }
    }
    
    /*
     
     cell..addTarget(self, action: #selector(hip_abduction_clicked_method), for: .touchUpInside)
     cell..addTarget(self, action: #selector(hip_abduction_slight_clicked_method), for: .touchUpInside)
     cell..addTarget(self, action: #selector(hip_abduction_moderate_clicked_method), for: .touchUpInside)
     cell..addTarget(self, action: #selector(hip_abduction_excessive_clicked_method), for: .touchUpInside)
     
     */
    // abduction
    @objc func hip_abduction_clicked_method() {
        let indexPath = IndexPath.init(row: hip_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Abduction"
        
        print(cell.btn_hip_abduction.tag as Any)
        if (cell.btn_hip_abduction.tag == 480) {
            
            cell.btn_hip_abduction.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_hip, my_name: my_name)
            
            cell.btn_hip_abduction.tag = 481
        } else {
            cell.btn_hip_abduction.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: my_name)
            
            cell.btn_hip_abduction_slight.setImage(UIImage(named: "unchecked"), for: .normal)
            cell.btn_hip_abduction_slight.tag = 460
            
            cell.btn_hip_abduction_moderate.setImage(UIImage(named: "unchecked"), for: .normal)
            cell.btn_hip_abduction_moderate.tag = 470
            
            cell.btn_hip_abduction_excessive.setImage(UIImage(named: "unchecked"), for: .normal)
            cell.btn_hip_abduction_excessive.tag = 600
            
            self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: "Abduction : Slight")
            self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: "Abduction : Moderate")
            self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: "Abduction : Excessive")
            
            cell.btn_hip_abduction.tag = 480
        }
    }
    @objc func hip_abduction_slight_clicked_method() {
        let indexPath = IndexPath.init(row: hip_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Abduction : Slight"
        
        if (cell.btn_hip_abduction.tag == 481) {
            
            print(cell.btn_hip_abduction_slight.tag as Any)
            if (cell.btn_hip_abduction_slight.tag == 490) {
                
                cell.btn_hip_abduction_slight.setImage(UIImage(named: "checked"), for: .normal)
                
                // add
                self.add_data_in_array(dynamic_mut_arr: arr_hip, my_name: my_name)
                
                cell.btn_hip_abduction_moderate.setImage(UIImage(named: "unchecked"), for: .normal)
                cell.btn_hip_abduction_moderate.tag = 500
                
                cell.btn_hip_abduction_excessive.setImage(UIImage(named: "unchecked"), for: .normal)
                cell.btn_hip_abduction_excessive.tag = 510
                
                self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: "Abduction : Moderate")
                self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: "Abduction : Excessive")
                
                cell.btn_hip_abduction_slight.tag = 491
            } else {
                cell.btn_hip_abduction_slight.setImage(UIImage(named: "unchecked"), for: .normal)
                
                // remove
                self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: my_name)
                
                cell.btn_hip_abduction_slight.tag = 490
            }
        } else {
            
        }
       
    }
    @objc func hip_abduction_moderate_clicked_method() {
        let indexPath = IndexPath.init(row: hip_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Abduction : Moderate"
        
        if (cell.btn_hip_abduction.tag == 481) {
            
        print(cell.btn_hip_abduction_moderate.tag as Any)
        if (cell.btn_hip_abduction_moderate.tag == 500) {
            
            cell.btn_hip_abduction_moderate.setImage(UIImage(named: "checked"), for: .normal)
            
            // add
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_hip, my_name: my_name)
            
            cell.btn_hip_abduction_excessive.setImage(UIImage(named: "unchecked"), for: .normal)
            cell.btn_hip_abduction_excessive.tag = 510
            
            cell.btn_hip_abduction_slight.setImage(UIImage(named: "unchecked"), for: .normal)
            cell.btn_hip_abduction_slight.tag = 490
            
            self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: "Abduction : Slight")
            self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: "Abduction : Excessive")
            
            cell.btn_hip_abduction_moderate.tag = 501
        } else {
            cell.btn_hip_abduction_moderate.setImage(UIImage(named: "unchecked"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: my_name)
            
            cell.btn_hip_abduction_moderate.tag = 500
        }
        } else {
            
        }
    }
    @objc func hip_abduction_excessive_clicked_method() {
        let indexPath = IndexPath.init(row: hip_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Abduction : Excessive"
        
        if (cell.btn_hip_abduction.tag == 481) {
            
            print(cell.btn_hip_abduction_excessive.tag as Any)
            if (cell.btn_hip_abduction_excessive.tag == 510) {
                
                cell.btn_hip_abduction_excessive.setImage(UIImage(named: "checked"), for: .normal)
                
                // add
                // add
                self.add_data_in_array(dynamic_mut_arr: arr_hip, my_name: my_name)
                
                cell.btn_hip_abduction_moderate.setImage(UIImage(named: "unchecked"), for: .normal)
                cell.btn_hip_abduction_moderate.tag = 470
                
                cell.btn_hip_abduction_slight.setImage(UIImage(named: "unchecked"), for: .normal)
                cell.btn_hip_abduction_slight.tag = 490
                
                self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: "Abduction : Slight")
                self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: "Abduction : Moderate")
                
                cell.btn_hip_abduction_excessive.tag = 511
            } else {
                cell.btn_hip_abduction_excessive.setImage(UIImage(named: "unchecked"), for: .normal)
                
                // remove
                self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: my_name)
                
                cell.btn_hip_abduction_excessive.tag = 510
            }
        } else {
            
        }
    }
    
    /*
     
     cell..addTarget(self, action: #selector(hip_adduction_clicked_method), for: .touchUpInside)
     cell..addTarget(self, action: #selector(hip_adduction_slight_clicked_method), for: .touchUpInside)
     cell..addTarget(self, action: #selector(hip_adduction_moderate_clicked_method), for: .touchUpInside)
     cell..addTarget(self, action: #selector(hip_adduction_excessive_clicked_method), for: .touchUpInside)
     
     */
    // Adduction
    @objc func hip_adduction_clicked_method() {
        let indexPath = IndexPath.init(row: hip_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Adduction"
        
        print(cell.btn_hip_adduction.tag as Any)
        if (cell.btn_hip_adduction.tag == 520) {
            
            cell.btn_hip_adduction.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_hip, my_name: my_name)
            
            cell.btn_hip_adduction.tag = 521
        } else {
            cell.btn_hip_adduction.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: my_name)
            
            
            cell.btn_hip_adduction_slight.setImage(UIImage(named: "unchecked"), for: .normal)
            cell.btn_hip_adduction_slight.tag = 530
             
            cell.btn_hip_adduction_excessive.setImage(UIImage(named: "unchecked"), for: .normal)
            cell.btn_hip_adduction_excessive.tag = 550
            
            cell.btn_hip_adduction_moderate.setImage(UIImage(named: "unchecked"), for: .normal)
            cell.btn_hip_adduction_moderate.tag = 540
            
            self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: "Adduction : Slight")
            self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: "Adduction : Moderate")
            self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: "Adduction : Excessive")
            
            
            cell.btn_hip_adduction.tag = 520
        }
    }
    @objc func hip_adduction_slight_clicked_method() {
        let indexPath = IndexPath.init(row: hip_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Adduction : Slight"
        
        if (cell.btn_hip_adduction.tag == 521) {
            
            print(cell.btn_hip_adduction_slight.tag as Any)
            if (cell.btn_hip_adduction_slight.tag == 530) {
                
                cell.btn_hip_adduction_slight.setImage(UIImage(named: "checked"), for: .normal)
                
                // add
                self.add_data_in_array(dynamic_mut_arr: arr_hip, my_name: my_name)
                   
                cell.btn_hip_adduction_excessive.setImage(UIImage(named: "unchecked"), for: .normal)
                cell.btn_hip_adduction_excessive.tag = 550
                
                cell.btn_hip_adduction_moderate.setImage(UIImage(named: "unchecked"), for: .normal)
                cell.btn_hip_adduction_moderate.tag = 540
                
                self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: "Adduction : Moderate")
                self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: "Adduction : Excessive")
                
                
                cell.btn_hip_adduction_slight.tag = 531
            } else {
                cell.btn_hip_adduction_slight.setImage(UIImage(named: "unchecked"), for: .normal)
                
                // remove
                self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: my_name)
                
                cell.btn_hip_adduction_slight.tag = 530
            }
        } else {
            
        }
        
    }
    @objc func hip_adduction_moderate_clicked_method() {
        let indexPath = IndexPath.init(row: hip_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Adduction : Moderate"
        
        if (cell.btn_hip_adduction.tag == 521) {
            
            print(cell.btn_hip_adduction_moderate.tag as Any)
            if (cell.btn_hip_adduction_moderate.tag == 540) {
                
                cell.btn_hip_adduction_moderate.setImage(UIImage(named: "checked"), for: .normal)
                
                // add
                // add
                self.add_data_in_array(dynamic_mut_arr: arr_hip, my_name: my_name)
                
                
                cell.btn_hip_adduction_slight.setImage(UIImage(named: "unchecked"), for: .normal)
                cell.btn_hip_adduction_slight.tag = 530
                 
                cell.btn_hip_adduction_excessive.setImage(UIImage(named: "unchecked"), for: .normal)
                cell.btn_hip_adduction_excessive.tag = 550
                
                self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: "Adduction : Slight")
                self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: "Adduction : Excessive")
                
                
                cell.btn_hip_adduction_moderate.tag = 541
            } else {
                cell.btn_hip_adduction_moderate.setImage(UIImage(named: "unchecked"), for: .normal)
                
                // remove
                self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: my_name)
                
                cell.btn_hip_adduction_moderate.tag = 540
            }
        } else {
            
        }
    }
    @objc func hip_adduction_excessive_clicked_method() {
        let indexPath = IndexPath.init(row: hip_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Adduction : Excessive"
        
        if (cell.btn_hip_adduction.tag == 521) {
            
            print(cell.btn_hip_adduction_excessive.tag as Any)
            if (cell.btn_hip_adduction_excessive.tag == 550) {
                
                cell.btn_hip_adduction_excessive.setImage(UIImage(named: "checked"), for: .normal)
                
                // add
                self.add_data_in_array(dynamic_mut_arr: arr_hip, my_name: my_name)
                
                cell.btn_hip_adduction_slight.setImage(UIImage(named: "unchecked"), for: .normal)
                cell.btn_hip_adduction_slight.tag = 530
                
                cell.btn_hip_adduction_moderate.setImage(UIImage(named: "unchecked"), for: .normal)
                cell.btn_hip_adduction_moderate.tag = 540
                 
                self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: "Adduction : Slight")
                self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: "Adduction : Moderate")
                
                cell.btn_hip_adduction_excessive.tag = 551
            } else {
                cell.btn_hip_adduction_excessive.setImage(UIImage(named: "unchecked"), for: .normal)
                
                // remove
                self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: my_name)
                
                cell.btn_hip_adduction_excessive.tag = 550
            }
        } else {
            
        }
    }
    
    /*
     
     cell..addTarget(self, action: #selector(hip_internal_rotation_clicked_method), for: .touchUpInside)
     cell..addTarget(self, action: #selector(hip_internal_rotation_slight_clicked_method), for: .touchUpInside)
     cell..addTarget(self, action: #selector(hip_internal_rotation_moderate_clicked_method), for: .touchUpInside)
     cell..addTarget(self, action: #selector(hip_internal_rotation_excessive_clicked_method), for: .touchUpInside)
     */
    // Internal Rotation
    @objc func hip_internal_rotation_clicked_method() {
        let indexPath = IndexPath.init(row: hip_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Internal Rotation"
        
        print(cell.btn_hip_internal_rotation.tag as Any)
        if (cell.btn_hip_internal_rotation.tag == 560) {
            
            cell.btn_hip_internal_rotation.setImage(UIImage(named: "check_icon"), for: .normal)
            
            // add
            self.add_data_in_array(dynamic_mut_arr: arr_hip, my_name: my_name)
            
            cell.btn_hip_internal_rotation.tag = 561
        } else {
            cell.btn_hip_internal_rotation.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // remove
            self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: my_name)
            
            
            cell.btn_hip_internal_rotation_slight.setImage(UIImage(named: "unchecked"), for: .normal)
            cell.btn_hip_internal_rotation_slight.tag = 530
             
            cell.btn_hip_internal_rotation_excessive.setImage(UIImage(named: "unchecked"), for: .normal)
            cell.btn_hip_internal_rotation_excessive.tag = 550
            
            cell.btn_hip_internal_rotation_moderate.setImage(UIImage(named: "unchecked"), for: .normal)
            cell.btn_hip_internal_rotation_moderate.tag = 540
            
            self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: "Internal Rotation : Slight")
            self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: "Internal Rotation : Moderate")
            self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: "Internal Rotation : Excessive")
            
            
            cell.btn_hip_internal_rotation.tag = 560
        }
    }
    @objc func hip_internal_rotation_slight_clicked_method() {
        let indexPath = IndexPath.init(row: hip_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Internal Rotation : Slight"
        
        if (cell.btn_hip_internal_rotation.tag == 561) {
            
            print(cell.btn_hip_internal_rotation_slight.tag as Any)
            if (cell.btn_hip_internal_rotation_slight.tag == 570) {
                
                cell.btn_hip_internal_rotation_slight.setImage(UIImage(named: "checked"), for: .normal)
                
                // add
                self.add_data_in_array(dynamic_mut_arr: arr_hip, my_name: my_name)
                   
                cell.btn_hip_internal_rotation_excessive.setImage(UIImage(named: "unchecked"), for: .normal)
                cell.btn_hip_internal_rotation_excessive.tag = 590
                
                cell.btn_hip_internal_rotation_moderate.setImage(UIImage(named: "unchecked"), for: .normal)
                cell.btn_hip_internal_rotation_moderate.tag = 580
                
                self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: "Internal Rotation : Moderate")
                self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: "Internal Rotation : Excessive")
                
                
                cell.btn_hip_internal_rotation_slight.tag = 571
            } else {
                cell.btn_hip_internal_rotation_slight.setImage(UIImage(named: "unchecked"), for: .normal)
                
                // remove
                self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: my_name)
                
                cell.btn_hip_internal_rotation_slight.tag = 570
            }
        } else {
            
        }
        
    }
    @objc func hip_internal_rotation_moderate_clicked_method() {
        let indexPath = IndexPath.init(row: hip_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Internal Rotation : Moderate"
        
        if (cell.btn_hip_internal_rotation.tag == 561) {
            
            print(cell.btn_hip_internal_rotation_moderate.tag as Any)
            if (cell.btn_hip_internal_rotation_moderate.tag == 580) {
                
                cell.btn_hip_internal_rotation_moderate.setImage(UIImage(named: "checked"), for: .normal)
                
                // add
                // add
                self.add_data_in_array(dynamic_mut_arr: arr_hip, my_name: my_name)
                
                
                cell.btn_hip_internal_rotation_slight.setImage(UIImage(named: "unchecked"), for: .normal)
                cell.btn_hip_internal_rotation_slight.tag = 570
                 
                cell.btn_hip_internal_rotation_excessive.setImage(UIImage(named: "unchecked"), for: .normal)
                cell.btn_hip_internal_rotation_excessive.tag = 590
                
                self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: "Internal Rotation : Slight")
                self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: "Internal Rotation : Excessive")
                
                
                cell.btn_hip_internal_rotation_moderate.tag = 581
            } else {
                cell.btn_hip_internal_rotation_moderate.setImage(UIImage(named: "unchecked"), for: .normal)
                
                // remove
                self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: my_name)
                
                cell.btn_hip_internal_rotation_moderate.tag = 580
            }
        } else {
            
        }
    }
    @objc func hip_internal_rotation_excessive_clicked_method() {
        let indexPath = IndexPath.init(row: hip_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        let my_name = "Internal Rotation : Excessive"
        
        if (cell.btn_hip_internal_rotation.tag == 561) {
            
            print(cell.btn_hip_internal_rotation_excessive.tag as Any)
            if (cell.btn_hip_internal_rotation_excessive.tag == 590) {
                
                cell.btn_hip_internal_rotation_excessive.setImage(UIImage(named: "checked"), for: .normal)
                
                // add
                self.add_data_in_array(dynamic_mut_arr: arr_hip, my_name: my_name)
                
                cell.btn_hip_internal_rotation_slight.setImage(UIImage(named: "unchecked"), for: .normal)
                cell.btn_hip_internal_rotation_slight.tag = 570
                
                cell.btn_hip_internal_rotation_moderate.setImage(UIImage(named: "unchecked"), for: .normal)
                cell.btn_hip_internal_rotation_moderate.tag = 580
                 
                self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: "Internal Rotation : Slight")
                self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: "Internal Rotation : Moderate")
                
                cell.btn_hip_internal_rotation_excessive.tag = 591
            } else {
                cell.btn_hip_internal_rotation_excessive.setImage(UIImage(named: "unchecked"), for: .normal)
                
                // remove
                self.remove_data_in_array(dynamic_mut_arr: arr_hip, my_name: my_name)
                
                cell.btn_hip_internal_rotation_excessive.tag = 590
            }
        } else {
            
        }
    }
    
    
    
    
    
    
    @objc func btn_foot_deviation_one_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897833075/8c42daf276?share=copy"
        pushVC.str_video_header = " Forefoot Contact"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_foot_deviation_two_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897833533/dcb1a2eb4f?share=copy"
        pushVC.str_video_header = " Footflat Contact"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_foot_deviation_three_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897833600/c6f089d392?share=copy"
        pushVC.str_video_header = " Foot Slap"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_foot_deviation_four_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897833510/b6ecd8dd31?share=copy"
        pushVC.str_video_header = " Early Heel Rise"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_foot_deviation_five_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897833553/628a6581f8?share=copy"
        pushVC.str_video_header = " Delayed Heel Rise"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
    
    // # 2
    @objc func btn_ankle_deviation_one_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897881277/47f13c23e0?share=copy"
        pushVC.str_video_header = " Excessive Plantarflexion"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_ankle_deviation_two_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897881281/1c74468830?share=copy"
        pushVC.str_video_header = " Insufficient Plantarflexion"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_ankle_deviation_three_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897881305/716f3d823a?share=copy"
        pushVC.str_video_header = " Excessive Dorsiflexion"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_ankle_deviation_four_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897881242/8d17af6659?share=copy"
        pushVC.str_video_header = " Insufficient Dorsiflexion"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_ankle_deviation_five_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897881248/49378048bb?share=copy"
        pushVC.str_video_header = " Inversion"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_ankle_deviation_six_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897881258/65530fcbe6?share=copy"
        pushVC.str_video_header = " Eversion"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_ankle_deviation_seven_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897881333/8ebfb10d13?share=copy"
        pushVC.str_video_header = " Stiff Ankle"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_ankle_deviation_eight_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897881694/5e1a8c05a1?share=copy"
        pushVC.str_video_header = " Unstable Ankle"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
    
    // # 3
    @objc func btn_knee_deviation_one_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897885690/0b043e6e65?share=copy"
        pushVC.str_video_header = " Excessive flexion"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_knee_deviation_two_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897885431/b238c220a5?share=copy"
        pushVC.str_video_header = " Insufficient flexion"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_knee_deviation_three_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897885404/a9e154dc12?share=copy"
        pushVC.str_video_header = " Hyperextension"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_knee_deviation_four_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897885381/8de0f46389?share=copy"
        pushVC.str_video_header = " Varus"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_knee_deviation_five_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897885374/fc380932f5?share=copy"
        pushVC.str_video_header = " Valgus"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_knee_deviation_six_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897974136/e28bce5bd0?share=copy"
        pushVC.str_video_header = " Stiff Knee"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_knee_deviation_seven_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897885361/d1770ea098?share=copy"
        pushVC.str_video_header = " Unstable Knee"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
    
    // # 4
    @objc func btn_hip_deviation_one_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897885808/3e12d31529?share=copy"
        pushVC.str_video_header = " Insufficient Flexion"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_hip_deviation_two_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897885804/a521c98059?share=copy"
        pushVC.str_video_header = " Insufficient Extension"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_hip_deviation_three_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897885798/cd107952c5?share=copy"
        pushVC.str_video_header = " Excessive External Rotation"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_hip_deviation_four_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897885791/a8f60e9c49?share=copy"
        pushVC.str_video_header = " Abduction"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_hip_deviation_five_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897885785/39f118c013?share=copy"
        pushVC.str_video_header = " Adduction"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_hip_deviation_six_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897885771/3f5e79f678?share=copy"
        pushVC.str_video_header = " Internal Rotation"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_hip_deviation_seven_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897885754/dfd36ef2c2?share=copy"
        pushVC.str_video_header = " Stiff Hip"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
    
    // # 5
    @objc func btn_pelvis_one_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897974760/54cccf321d?share=copy"
        pushVC.str_video_header = " Insufficient Forward Rotation"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_pelvis_two_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897974755/f03108756a?share=copy"
        pushVC.str_video_header = " Excessive Forward Rotation"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_pelvis_three_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897974748/edfc60ea77?share=copy"
        pushVC.str_video_header = " Insufficient Backward Rotation"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_pelvis_four_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897974741/5f7dcbcd0d?share=copy"
        pushVC.str_video_header = " Excessive Backward Rotation"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_pelvis_five_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897974728/4a4a984851?share=copy"
        pushVC.str_video_header = " Contralateral Drop"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_pelvis_six_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897974719/ee8461597c?share=copy"
        pushVC.str_video_header = " Excessive Anterior Tilt"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_pelvis_seven_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/897974707/86d62b726d?share=copy"
        pushVC.str_video_header = " Restricted Pelvic Movement"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
    // # 6
    @objc func btn_trunk_one_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/898010877/b42525dc13?share=copy"
        pushVC.str_video_header = " Forward Lean"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_trunk_two_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/898010869/e6d4ddd1ce?share=copy"
        pushVC.str_video_header = " Backward Lean"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_trunk_three_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/898010860/466901b562?share=copy"
        pushVC.str_video_header = " Right Lean"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_trunk_four_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/898010849/0aa3dad0ef?share=copy"
        pushVC.str_video_header = " Left Lean"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    @objc func btn_trunk_five_click() {
        //
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://vimeo.com/898010883/0c694b895a?share=copy"
        pushVC.str_video_header = " Restricted Trunk Rotation"
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
}


extension stance_phase:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0) {
            
            let cell:stance_phase_table_cell = tableView.dequeueReusableCell(withIdentifier: "one_table_cell") as! stance_phase_table_cell
            cell.backgroundColor = .white
            
            let backgroundView = UIView()
            backgroundView.backgroundColor = .clear
            cell.selectedBackgroundView = backgroundView
            
            /*
             @IBOutlet  weak var :UILabel!
             @IBOutlet  weak var :UILabel!
             @IBOutlet  weak var :UILabel!
             @IBOutlet  weak var :UILabel!
             @IBOutlet  weak var :UILabel!
             */
            
            let tap1 = UITapGestureRecognizer(target: self, action: #selector(fareFootClickMethod))
            cell.lbl_foot_farefoot.isUserInteractionEnabled = true
            cell.lbl_foot_farefoot.addGestureRecognizer(tap1)
            
            let tap2 = UITapGestureRecognizer(target: self, action: #selector(footFlatClickMethod))
            cell.lbl_foot_footFlat.isUserInteractionEnabled = true
            cell.lbl_foot_footFlat.addGestureRecognizer(tap2)
            
            let tap3 = UITapGestureRecognizer(target: self, action: #selector(footSlapClickMethod))
            cell.lbl_foot_footSlap.isUserInteractionEnabled = true
            cell.lbl_foot_footSlap.addGestureRecognizer(tap3)
            
            let tap4 = UITapGestureRecognizer(target: self, action: #selector(earlyHeelRiseClickMethod))
            cell.lbl_foot_earlyHeelRise.isUserInteractionEnabled = true
            cell.lbl_foot_earlyHeelRise.addGestureRecognizer(tap4)
            
            let tap5 = UITapGestureRecognizer(target: self, action: #selector(delayedHeelRiseClickMethod))
            cell.lbl_foot_delayedHeelRise.isUserInteractionEnabled = true
            cell.lbl_foot_delayedHeelRise.addGestureRecognizer(tap5)
            
            cell.btn_foot_farefoot.addTarget(self, action: #selector(fareFootClickMethod), for: .touchUpInside)
            cell.btn_foot_footFlat.addTarget(self, action: #selector(footFlatClickMethod), for: .touchUpInside)
            cell.btn_foot_footSlap.addTarget(self, action: #selector(footSlapClickMethod), for: .touchUpInside)
            cell.btn_foot_earlyHeelRise.addTarget(self, action: #selector(earlyHeelRiseClickMethod), for: .touchUpInside)
            cell.btn_foot_delayedHeelRise.addTarget(self, action: #selector(delayedHeelRiseClickMethod), for: .touchUpInside)
            
            cell.btn_foot_deviation_one.addTarget(self, action: #selector(btn_foot_deviation_one_click), for: .touchUpInside)
            cell.btn_foot_deviation_two.addTarget(self, action: #selector(btn_foot_deviation_two_click), for: .touchUpInside)
            cell.btn_foot_deviation_three.addTarget(self, action: #selector(btn_foot_deviation_three_click), for: .touchUpInside)
            cell.btn_foot_deviation_four.addTarget(self, action: #selector(btn_foot_deviation_four_click), for: .touchUpInside)
            cell.btn_foot_deviation_five.addTarget(self, action: #selector(btn_foot_deviation_five_click), for: .touchUpInside)
            
            
            
            return cell
            
        } else if (indexPath.row == 4) {
            
            let cell:stance_phase_table_cell = tableView.dequeueReusableCell(withIdentifier: "five_table_cell") as! stance_phase_table_cell
            cell.backgroundColor = .white
            
            let backgroundView = UIView()
            backgroundView.backgroundColor = .clear
            cell.selectedBackgroundView = backgroundView
          
            /*
             @IBOutlet weak var lbl_pelvis_insufficient_forward:UILabel!
             @IBOutlet weak var lbl_pelvis_excessive_forward:UILabel!
             @IBOutlet weak var lbl_pelvis_insufficient_backward:UILabel!
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             */
            
            let tap1 = UITapGestureRecognizer(target: self, action: #selector(insufficientForwardClickMethod))
            cell.lbl_pelvis_insufficient_forward.isUserInteractionEnabled = true
            cell.lbl_pelvis_insufficient_forward.addGestureRecognizer(tap1)
            
            let tap2 = UITapGestureRecognizer(target: self, action: #selector(excessive_forward_ClickMethod))
            cell.lbl_pelvis_excessive_forward.isUserInteractionEnabled = true
            cell.lbl_pelvis_excessive_forward.addGestureRecognizer(tap2)
            
            let tap3 = UITapGestureRecognizer(target: self, action: #selector(insufficient_backward_ClickMethod))
            cell.lbl_pelvis_insufficient_backward.isUserInteractionEnabled = true
            cell.lbl_pelvis_insufficient_backward.addGestureRecognizer(tap3)
            
            let tap4 = UITapGestureRecognizer(target: self, action: #selector(excessive_backward_ClickMethod))
            cell.lbl_pelvis_excessive_backward.isUserInteractionEnabled = true
            cell.lbl_pelvis_excessive_backward.addGestureRecognizer(tap4)
            
            let tap5 = UITapGestureRecognizer(target: self, action: #selector(contralateral_dropClickMethod))
            cell.lbl_pelvis_contralateral_drop.isUserInteractionEnabled = true
            cell.lbl_pelvis_contralateral_drop.addGestureRecognizer(tap5)
            
            let tap6 = UITapGestureRecognizer(target: self, action: #selector(excessive_anteriorClickMethod))
            cell.lbl_pelvis_excessive_anterior.isUserInteractionEnabled = true
            cell.lbl_pelvis_excessive_anterior.addGestureRecognizer(tap6)
            
            let tap7 = UITapGestureRecognizer(target: self, action: #selector(restricted_pelvicClickMethod))
            cell.lbl_pelvis_restricted_pelvic.isUserInteractionEnabled = true
            cell.lbl_pelvis_restricted_pelvic.addGestureRecognizer(tap7)
            
            cell.btn_pelvis_insufficient_forward.addTarget(self, action: #selector(insufficientForwardClickMethod), for: .touchUpInside)
            cell.btn_pelvis_excessive_forward.addTarget(self, action: #selector(excessive_forward_ClickMethod), for: .touchUpInside)
            cell.btn_pelvis_insufficient_backward.addTarget(self, action: #selector(insufficient_backward_ClickMethod), for: .touchUpInside)
            cell.btn_pelvis_excessive_backward.addTarget(self, action: #selector(excessive_backward_ClickMethod), for: .touchUpInside)
            cell.btn_pelvis_contralateral_drop.addTarget(self, action: #selector(contralateral_dropClickMethod), for: .touchUpInside)
            cell.btn_pelvis_excessive_anterior.addTarget(self, action: #selector(excessive_anteriorClickMethod), for: .touchUpInside)
            cell.btn_pelvis_restricted_pelvic.addTarget(self, action: #selector(restricted_pelvicClickMethod), for: .touchUpInside)
            
            cell.btn_pelvis_one.addTarget(self, action: #selector(btn_pelvis_one_click), for: .touchUpInside)
            cell.btn_pelvis_two.addTarget(self, action: #selector(btn_pelvis_two_click), for: .touchUpInside)
            cell.btn_pelvis_three.addTarget(self, action: #selector(btn_pelvis_three_click), for: .touchUpInside)
            cell.btn_pelvis_four.addTarget(self, action: #selector(btn_pelvis_four_click), for: .touchUpInside)
            cell.btn_pelvis_five.addTarget(self, action: #selector(btn_pelvis_five_click), for: .touchUpInside)
            cell.btn_pelvis_six.addTarget(self, action: #selector(btn_pelvis_six_click), for: .touchUpInside)
            cell.btn_pelvis_seven.addTarget(self, action: #selector(btn_pelvis_seven_click), for: .touchUpInside)
            
            return cell
            
        } else if (indexPath.row == 5) {
            
            let cell:stance_phase_table_cell = tableView.dequeueReusableCell(withIdentifier: "six_table_cell") as! stance_phase_table_cell
            cell.backgroundColor = .white
            
            let backgroundView = UIView()
            backgroundView.backgroundColor = .clear
            cell.selectedBackgroundView = backgroundView
          
            /*
              Forward Lean
              Backward Lean
              Right Lean
              Left Lean
              Restricted Trunk Rotation
             */
            
            /*
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             */
            
            let tap1 = UITapGestureRecognizer(target: self, action: #selector(trunk_forward_ClickMethod))
            cell.lbl_trunk_forward.isUserInteractionEnabled = true
            cell.lbl_trunk_forward.addGestureRecognizer(tap1)
            
            let tap2 = UITapGestureRecognizer(target: self, action: #selector(trunk_backward_ClickMethod))
            cell.lbl_trunk_backward.isUserInteractionEnabled = true
            cell.lbl_trunk_backward.addGestureRecognizer(tap2)
            
            let tap3 = UITapGestureRecognizer(target: self, action: #selector(trunk_right_ClickMethod))
            cell.lbl_trunk_right.isUserInteractionEnabled = true
            cell.lbl_trunk_right.addGestureRecognizer(tap3)
            
            let tap4 = UITapGestureRecognizer(target: self, action: #selector(trunk_left_ClickMethod))
            cell.lbl_trunk_left.isUserInteractionEnabled = true
            cell.lbl_trunk_left.addGestureRecognizer(tap4)
            
            let tap5 = UITapGestureRecognizer(target: self, action: #selector(trunk_restricted_ClickMethod))
            cell.lbl_trunk_restricted.isUserInteractionEnabled = true
            cell.lbl_trunk_restricted.addGestureRecognizer(tap5)
             
            cell.btn_trunk_forward.addTarget(self, action: #selector(trunk_forward_ClickMethod), for: .touchUpInside)
            cell.btn_trunk_backward.addTarget(self, action: #selector(trunk_backward_ClickMethod), for: .touchUpInside)
            cell.btn_trunk_right.addTarget(self, action: #selector(trunk_right_ClickMethod), for: .touchUpInside)
            cell.btn_trunk_left.addTarget(self, action: #selector(trunk_left_ClickMethod), for: .touchUpInside)
            cell.btn_trunk_restricted.addTarget(self, action: #selector(trunk_restricted_ClickMethod), for: .touchUpInside)
            
            cell.btn_save_and_continue.addTarget(self, action: #selector(save_and_continue_click_method), for: .touchUpInside)
            
            cell.btn_trunk_one.addTarget(self, action: #selector(btn_trunk_one_click), for: .touchUpInside)
            cell.btn_trunk_two.addTarget(self, action: #selector(btn_trunk_two_click), for: .touchUpInside)
            cell.btn_trunk_three.addTarget(self, action: #selector(btn_trunk_three_click), for: .touchUpInside)
            cell.btn_trunk_four.addTarget(self, action: #selector(btn_trunk_four_click), for: .touchUpInside)
            cell.btn_trunk_five.addTarget(self, action: #selector(btn_trunk_five_click), for: .touchUpInside)
            
            
            
            return cell
            
        } else if (indexPath.row == 1) {
            
            let cell:stance_phase_table_cell = tableView.dequeueReusableCell(withIdentifier: "two_table_cell") as! stance_phase_table_cell
            cell.backgroundColor = .white
            
            let backgroundView = UIView()
            backgroundView.backgroundColor = .clear
            cell.selectedBackgroundView = backgroundView
          
           //  cell.btn_trunk_forward.addTarget(self, action: #selector(trunk_forward_ClickMethod), for: .touchUpInside)
            
            /*
             @IBOutlet weak var :UIButton!
             @IBOutlet weak var :UIButton!
             @IBOutlet weak var :UIButton!
             @IBOutlet weak var :UIButton!
             @IBOutlet weak var :UIButton!
             @IBOutlet weak var :UIButton!
             @IBOutlet weak var :UIButton!
             @IBOutlet weak var :UIButton!
             @IBOutlet weak var :UIButton!
             @IBOutlet weak var :UIButton!
             @IBOutlet weak var :UIButton!
             @IBOutlet weak var :UIButton!
             @IBOutlet weak var :UIButton!
             @IBOutlet weak var :UIButton!
             @IBOutlet weak var btn_ankle_eversion_main:UIButton!
             @IBOutlet weak var btn_ankle_eversion_main_slight:UIButton!
             @IBOutlet weak var btn_ankle_eversion_main_moderate:UIButton!
             @IBOutlet weak var btn_ankle_eversion_main_excessive:UIButton!
             */
            
            /*
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             */
            
            let tap1 = UITapGestureRecognizer(target: self, action: #selector(ankle_excessive_plant_clicked_method))
            cell.lbl_ankle_excessive_plant.isUserInteractionEnabled = true
            cell.lbl_ankle_excessive_plant.addGestureRecognizer(tap1)
            
            let tap2 = UITapGestureRecognizer(target: self, action: #selector(ankle_insufficient_plant_clicked_method))
            cell.lbl_ankle_insufficient_plant.isUserInteractionEnabled = true
            cell.lbl_ankle_insufficient_plant.addGestureRecognizer(tap2)
            
            let tap3 = UITapGestureRecognizer(target: self, action: #selector(ankle_excessive_dorsirflexion_clicked_method))
            cell.lbl_ankle_excessive_dorsirflexion.isUserInteractionEnabled = true
            cell.lbl_ankle_excessive_dorsirflexion.addGestureRecognizer(tap3)
            
            let tap4 = UITapGestureRecognizer(target: self, action: #selector(ankle_insufficient_dorsirflextion_clicked_method))
            cell.lbl_ankle_insufficient_dorsirflextion.isUserInteractionEnabled = true
            cell.lbl_ankle_insufficient_dorsirflextion.addGestureRecognizer(tap4)
            
            let tap5 = UITapGestureRecognizer(target: self, action: #selector(ankle_inversion_main_clicked_method))
            cell.lbl_inversion_main.isUserInteractionEnabled = true
            cell.lbl_inversion_main.addGestureRecognizer(tap5)
            
            let tap6 = UITapGestureRecognizer(target: self, action: #selector(ankle_inversion_main_Slight_clicked_method))
            cell.lbl_inversion_main_Slight.isUserInteractionEnabled = true
            cell.lbl_inversion_main_Slight.addGestureRecognizer(tap6)
            
            let tap7 = UITapGestureRecognizer(target: self, action: #selector(ankle_inversion_main_Moderate_clicked_method))
            cell.lbl_inversion_main_Moderate.isUserInteractionEnabled = true
            cell.lbl_inversion_main_Moderate.addGestureRecognizer(tap7)
            
            let tap8 = UITapGestureRecognizer(target: self, action: #selector(ankle_inversion_main_Excessive_clicked_method))
            cell.lbl_inversion_main_Excessive.isUserInteractionEnabled = true
            cell.lbl_inversion_main_Excessive.addGestureRecognizer(tap8)
            
            let tap9 = UITapGestureRecognizer(target: self, action: #selector(ankle_eversion_main_clicked_method))
            cell.lbl_ankle_eversion_main.isUserInteractionEnabled = true
            cell.lbl_ankle_eversion_main.addGestureRecognizer(tap9)
            
            let tap10 = UITapGestureRecognizer(target: self, action: #selector(ankle_eversion_main_slight_clicked_method))
            cell.lbl_ankle_eversion_main_slight.isUserInteractionEnabled = true
            cell.lbl_ankle_eversion_main_slight.addGestureRecognizer(tap10)
            
            let tap11 = UITapGestureRecognizer(target: self, action: #selector(ankle_eversion_main_moderate_clicked_method))
            cell.lbl_ankle_eversion_main_moderate.isUserInteractionEnabled = true
            cell.lbl_ankle_eversion_main_moderate.addGestureRecognizer(tap11)
            
            let tap12 = UITapGestureRecognizer(target: self, action: #selector(ankle_eversion_main_excessive_clicked_method))
            cell.lbl_ankle_eversion_main_excessive.isUserInteractionEnabled = true
            cell.lbl_ankle_eversion_main_excessive.addGestureRecognizer(tap12)
            
            let tap13 = UITapGestureRecognizer(target: self, action: #selector(ankle_stiff_clicked_method))
            cell.lbl_ankle_stiff.isUserInteractionEnabled = true
            cell.lbl_ankle_stiff.addGestureRecognizer(tap13)
            
            let tap14 = UITapGestureRecognizer(target: self, action: #selector(ankle_unstable_clicked_method))
            cell.lbl_ankle_unstable.isUserInteractionEnabled = true
            cell.lbl_ankle_unstable.addGestureRecognizer(tap14)
            
            cell.btn_ankle_excessive_plant.addTarget(self, action: #selector(ankle_excessive_plant_clicked_method), for: .touchUpInside)
            cell.btn_ankle_insufficient_plant.addTarget(self, action: #selector(ankle_insufficient_plant_clicked_method), for: .touchUpInside)
            cell.btn_ankle_excessive_dorsirflexion.addTarget(self, action: #selector(ankle_excessive_dorsirflexion_clicked_method), for: .touchUpInside)
            cell.btn_ankle_insufficient_dorsirflextion.addTarget(self, action: #selector(ankle_insufficient_dorsirflextion_clicked_method), for: .touchUpInside)
            
            cell.btn_inversion_main.addTarget(self, action: #selector(ankle_inversion_main_clicked_method), for: .touchUpInside)
            cell.btn_inversion_main_Slight.addTarget(self, action: #selector(ankle_inversion_main_Slight_clicked_method), for: .touchUpInside)
            cell.btn_inversion_main_Moderate.addTarget(self, action: #selector(ankle_inversion_main_Moderate_clicked_method), for: .touchUpInside)
            cell.btn_inversion_main_Excessive.addTarget(self, action: #selector(ankle_inversion_main_Excessive_clicked_method), for: .touchUpInside)
            
            cell.btn_ankle_eversion_main.addTarget(self, action: #selector(ankle_eversion_main_clicked_method), for: .touchUpInside)
            cell.btn_ankle_eversion_main_slight.addTarget(self, action: #selector(ankle_eversion_main_slight_clicked_method), for: .touchUpInside)
            cell.btn_ankle_eversion_main_moderate.addTarget(self, action: #selector(ankle_eversion_main_moderate_clicked_method), for: .touchUpInside)
            cell.btn_ankle_eversion_main_excessive.addTarget(self, action: #selector(ankle_eversion_main_excessive_clicked_method), for: .touchUpInside)
            
            cell.btn_ankle_stiff.addTarget(self, action: #selector(ankle_stiff_clicked_method), for: .touchUpInside)
            cell.btn_ankle_unstable.addTarget(self, action: #selector(ankle_unstable_clicked_method), for: .touchUpInside)
            
            
            cell.btn_ankle_deviation_one.addTarget(self, action: #selector(btn_ankle_deviation_one_click), for: .touchUpInside)
            cell.btn_ankle_deviation_two.addTarget(self, action: #selector(btn_ankle_deviation_two_click), for: .touchUpInside)
            cell.btn_ankle_deviation_three.addTarget(self, action: #selector(btn_ankle_deviation_three_click), for: .touchUpInside)
            cell.btn_ankle_deviation_four.addTarget(self, action: #selector(btn_ankle_deviation_four_click), for: .touchUpInside)
            cell.btn_ankle_deviation_five.addTarget(self, action: #selector(btn_ankle_deviation_five_click), for: .touchUpInside)
            cell.btn_ankle_deviation_six.addTarget(self, action: #selector(btn_ankle_deviation_six_click), for: .touchUpInside)
            cell.btn_ankle_deviation_seven.addTarget(self, action: #selector(btn_ankle_deviation_seven_click), for: .touchUpInside)
            cell.btn_ankle_deviation_eight.addTarget(self, action: #selector(btn_ankle_deviation_eight_click), for: .touchUpInside)
            
            return cell
            
        } else if (indexPath.row == 2) {
            
            let cell:stance_phase_table_cell = tableView.dequeueReusableCell(withIdentifier: "three_table_cell") as! stance_phase_table_cell
            cell.backgroundColor = .white
            
            let backgroundView = UIView()
            backgroundView.backgroundColor = .clear
            cell.selectedBackgroundView = backgroundView
          
            /*
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             */
            
            let tap1 = UITapGestureRecognizer(target: self, action: #selector(knee_excessive_flexion_clicked_method))
            cell.lbl_knee_excessive_flexion.isUserInteractionEnabled = true
            cell.lbl_knee_excessive_flexion.addGestureRecognizer(tap1)
            
            let tap2 = UITapGestureRecognizer(target: self, action: #selector(knee_insufficient_flexion_clicked_method))
            cell.lbl_knee_insufficient_flexion.isUserInteractionEnabled = true
            cell.lbl_knee_insufficient_flexion.addGestureRecognizer(tap2)
            
            let tap3 = UITapGestureRecognizer(target: self, action: #selector(knee_hyperextension_clicked_method))
            cell.lbl_knee_hyperextension.isUserInteractionEnabled = true
            cell.lbl_knee_hyperextension.addGestureRecognizer(tap3)
            
            cell.btn_knee_excessive_flexion.addTarget(self, action: #selector(knee_excessive_flexion_clicked_method), for: .touchUpInside)
            cell.btn_knee_insufficient_flexion.addTarget(self, action: #selector(knee_insufficient_flexion_clicked_method), for: .touchUpInside)
            cell.btn_knee_hyperextension.addTarget(self, action: #selector(knee_hyperextension_clicked_method), for: .touchUpInside)
            
//            @IBOutlet weak var :UILabel!
//            @IBOutlet weak var :UILabel!
//            @IBOutlet weak var :UILabel!
//            @IBOutlet weak var :UILabel!
            
            let tap4 = UITapGestureRecognizer(target: self, action: #selector(knee_varus_main_clicked_method))
            cell.lbl_knee_varus_main.isUserInteractionEnabled = true
            cell.lbl_knee_varus_main.addGestureRecognizer(tap4)
            
            let tap5 = UITapGestureRecognizer(target: self, action: #selector(knee_varus_slight_clicked_method))
            cell.lbl_knee_varus_slight.isUserInteractionEnabled = true
            cell.lbl_knee_varus_slight.addGestureRecognizer(tap5)
            
            let tap6 = UITapGestureRecognizer(target: self, action: #selector(knee_varus_moderate_clicked_method))
            cell.lbl_knee_varus_moderate.isUserInteractionEnabled = true
            cell.lbl_knee_varus_moderate.addGestureRecognizer(tap6)
            
            let tap7 = UITapGestureRecognizer(target: self, action: #selector(knee_varus_excessive_clicked_method))
            cell.lbl_knee_varus_excessive.isUserInteractionEnabled = true
            cell.lbl_knee_varus_excessive.addGestureRecognizer(tap7)
            
            cell.btn_knee_varus_main.addTarget(self, action: #selector(knee_varus_main_clicked_method), for: .touchUpInside)
            cell.btn_knee_varus_slight.addTarget(self, action: #selector(knee_varus_slight_clicked_method), for: .touchUpInside)
            cell.btn_knee_varus_moderate.addTarget(self, action: #selector(knee_varus_moderate_clicked_method), for: .touchUpInside)
            cell.btn_knee_varus_excessive.addTarget(self, action: #selector(knee_varus_excessive_clicked_method), for: .touchUpInside)
            
            /*
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             */
            
            let tap8 = UITapGestureRecognizer(target: self, action: #selector(knee_valgus_main_clicked_method))
            cell.lbl_knee_valgus_main.isUserInteractionEnabled = true
            cell.lbl_knee_valgus_main.addGestureRecognizer(tap8)
            
            let tap9 = UITapGestureRecognizer(target: self, action: #selector(knee_valgus_slight_clicked_method))
            cell.lbl_knee_valgus_slight.isUserInteractionEnabled = true
            cell.lbl_knee_valgus_slight.addGestureRecognizer(tap9)
            
            let tap10 = UITapGestureRecognizer(target: self, action: #selector(knee_valgus_moderate_clicked_method))
            cell.lbl_knee_valgus_moderate.isUserInteractionEnabled = true
            cell.lbl_knee_valgus_moderate.addGestureRecognizer(tap10)
            
            let tap11 = UITapGestureRecognizer(target: self, action: #selector(knee_valgus_excessive_clicked_method))
            cell.lbl_knee_valgus_excessive.isUserInteractionEnabled = true
            cell.lbl_knee_valgus_excessive.addGestureRecognizer(tap11)
            
            cell.btn_knee_valgus_main.addTarget(self, action: #selector(knee_valgus_main_clicked_method), for: .touchUpInside)
            cell.btn_knee_valgus_slight.addTarget(self, action: #selector(knee_valgus_slight_clicked_method), for: .touchUpInside)
            cell.btn_knee_valgus_moderate.addTarget(self, action: #selector(knee_valgus_moderate_clicked_method), for: .touchUpInside)
            cell.btn_knee_valgus_excessive.addTarget(self, action: #selector(knee_valgus_excessive_clicked_method), for: .touchUpInside)
            
            /*
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             */
            let tap12 = UITapGestureRecognizer(target: self, action: #selector(knee_stiff_clicked_method))
            cell.lbl_knee_stiff.isUserInteractionEnabled = true
            cell.lbl_knee_stiff.addGestureRecognizer(tap12)
            
            let tap13 = UITapGestureRecognizer(target: self, action: #selector(knee_unstable_clicked_method))
            cell.lbl_knee_unstable.isUserInteractionEnabled = true
            cell.lbl_knee_unstable.addGestureRecognizer(tap13)
            
            cell.btn_knee_stiff.addTarget(self, action: #selector(knee_stiff_clicked_method), for: .touchUpInside)
            cell.btn_knee_unstable.addTarget(self, action: #selector(knee_unstable_clicked_method), for: .touchUpInside)
            
            
            cell.btn_knee_deviation_one.addTarget(self, action: #selector(btn_knee_deviation_one_click), for: .touchUpInside)
            cell.btn_knee_deviation_two.addTarget(self, action: #selector(btn_knee_deviation_two_click), for: .touchUpInside)
            cell.btn_knee_deviation_three.addTarget(self, action: #selector(btn_knee_deviation_three_click), for: .touchUpInside)
            cell.btn_knee_deviation_four.addTarget(self, action: #selector(btn_knee_deviation_four_click), for: .touchUpInside)
            cell.btn_knee_deviation_five.addTarget(self, action: #selector(btn_knee_deviation_five_click), for: .touchUpInside)
            cell.btn_knee_deviation_six.addTarget(self, action: #selector(btn_knee_deviation_six_click), for: .touchUpInside)
            cell.btn_knee_deviation_seven.addTarget(self, action: #selector(btn_knee_deviation_seven_click), for: .touchUpInside)
            
            
            return cell
            
        } else if (indexPath.row == 3) {
            
            let cell:stance_phase_table_cell = tableView.dequeueReusableCell(withIdentifier: "four_table_cell") as! stance_phase_table_cell
            cell.backgroundColor = .white
            
            let backgroundView = UIView()
            backgroundView.backgroundColor = .clear
            cell.selectedBackgroundView = backgroundView
          
            
            /*
             // MARK: - HIP -
             @IBOutlet weak var btn_hip_insufficient_flexion:UIButton!
             @IBOutlet weak var btn_hip_insufficient_extension:UIButton!
             @IBOutlet weak var btn_hip_excessive_external_rotation:UIButton!
             @IBOutlet weak var btn_hip_stiff:UIButton!
             // abduction
             @IBOutlet weak var btn_hip_abduction:UIButton!
             @IBOutlet weak var btn_hip_abduction_slight:UIButton!
             @IBOutlet weak var btn_hip_abduction_moderate:UIButton!
             @IBOutlet weak var btn_hip_abduction_excessive:UIButton!
             // abduction
             @IBOutlet weak var btn_hip_adduction:UIButton!
             @IBOutlet weak var btn_hip_adduction_slight:UIButton!
             @IBOutlet weak var btn_hip_adduction_moderate:UIButton!
             @IBOutlet weak var btn_hip_adduction_excessive:UIButton!
             // Internal Rotation
             @IBOutlet weak var btn_hip_internal_rotation:UIButton!
             @IBOutlet weak var btn_hip_internal_rotation_slight:UIButton!
             @IBOutlet weak var btn_hip_internal_rotation_moderate:UIButton!
             @IBOutlet weak var btn_hip_internal_rotation_excessive:UIButton!
             
             
             
             // Stiff Hip
             /*
              
              
              
              
              
              */
             */
            
            /*
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             */
            
            let tap1 = UITapGestureRecognizer(target: self, action: #selector(hip_insufficient_flexion_clicked_method))
            cell.lbl_hip_insufficient_flexion.isUserInteractionEnabled = true
            cell.lbl_hip_insufficient_flexion.addGestureRecognizer(tap1)
            
            let tap2 = UITapGestureRecognizer(target: self, action: #selector(hip_insufficient_extension_clicked_method))
            cell.lbl_hip_insufficient_extension.isUserInteractionEnabled = true
            cell.lbl_hip_insufficient_extension.addGestureRecognizer(tap2)
            
            let tap3 = UITapGestureRecognizer(target: self, action: #selector(hip_excessive_external_rotation_clicked_method))
            cell.lbl_hip_excessive_external_rotation.isUserInteractionEnabled = true
            cell.lbl_hip_excessive_external_rotation.addGestureRecognizer(tap3)
            
            let tap4 = UITapGestureRecognizer(target: self, action: #selector(hip_stiff_clicked_method))
            cell.lbl_hip_stiff.isUserInteractionEnabled = true
            cell.lbl_hip_stiff.addGestureRecognizer(tap4)
            
            cell.btn_hip_insufficient_flexion.addTarget(self, action: #selector(hip_insufficient_flexion_clicked_method), for: .touchUpInside)
            cell.btn_hip_insufficient_extension.addTarget(self, action: #selector(hip_insufficient_extension_clicked_method), for: .touchUpInside)
            cell.btn_hip_excessive_external_rotation.addTarget(self, action: #selector(hip_excessive_external_rotation_clicked_method), for: .touchUpInside)
            cell.btn_hip_stiff.addTarget(self, action: #selector(hip_stiff_clicked_method), for: .touchUpInside)
            
            /*
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             */
            
            let tap5 = UITapGestureRecognizer(target: self, action: #selector(hip_abduction_clicked_method))
            cell.lbl_hip_abduction.isUserInteractionEnabled = true
            cell.lbl_hip_abduction.addGestureRecognizer(tap5)
            
            let tap6 = UITapGestureRecognizer(target: self, action: #selector(hip_abduction_slight_clicked_method))
            cell.lbl_hip_abduction_slight.isUserInteractionEnabled = true
            cell.lbl_hip_abduction_slight.addGestureRecognizer(tap6)
            
            let tap7 = UITapGestureRecognizer(target: self, action: #selector(hip_abduction_moderate_clicked_method))
            cell.lbl_hip_abduction_moderate.isUserInteractionEnabled = true
            cell.lbl_hip_abduction_moderate.addGestureRecognizer(tap7)
            
            let tap8 = UITapGestureRecognizer(target: self, action: #selector(hip_abduction_excessive_clicked_method))
            cell.lbl_hip_abduction_excessive.isUserInteractionEnabled = true
            cell.lbl_hip_abduction_excessive.addGestureRecognizer(tap8)
            
            /*
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             */
            
            cell.btn_hip_abduction.addTarget(self, action: #selector(hip_abduction_clicked_method), for: .touchUpInside)
            cell.btn_hip_abduction_slight.addTarget(self, action: #selector(hip_abduction_slight_clicked_method), for: .touchUpInside)
            cell.btn_hip_abduction_moderate.addTarget(self, action: #selector(hip_abduction_moderate_clicked_method), for: .touchUpInside)
            cell.btn_hip_abduction_excessive.addTarget(self, action: #selector(hip_abduction_excessive_clicked_method), for: .touchUpInside)
            
            let tap9 = UITapGestureRecognizer(target: self, action: #selector(hip_adduction_clicked_method))
            cell.lbl_hip_adduction.isUserInteractionEnabled = true
            cell.lbl_hip_adduction.addGestureRecognizer(tap9)
            
            let tap10 = UITapGestureRecognizer(target: self, action: #selector(hip_adduction_slight_clicked_method))
            cell.lbl_hip_adduction_slight.isUserInteractionEnabled = true
            cell.lbl_hip_adduction_slight.addGestureRecognizer(tap10)
            
            let tap11 = UITapGestureRecognizer(target: self, action: #selector(hip_adduction_moderate_clicked_method))
            cell.lbl_hip_adduction_moderate.isUserInteractionEnabled = true
            cell.lbl_hip_adduction_moderate.addGestureRecognizer(tap11)
            
            let tap12 = UITapGestureRecognizer(target: self, action: #selector(hip_adduction_excessive_clicked_method))
            cell.lbl_hip_adduction_excessive.isUserInteractionEnabled = true
            cell.lbl_hip_adduction_excessive.addGestureRecognizer(tap12)
            
            cell.btn_hip_adduction.addTarget(self, action: #selector(hip_adduction_clicked_method), for: .touchUpInside)
            cell.btn_hip_adduction_slight.addTarget(self, action: #selector(hip_adduction_slight_clicked_method), for: .touchUpInside)
            cell.btn_hip_adduction_moderate.addTarget(self, action: #selector(hip_adduction_moderate_clicked_method), for: .touchUpInside)
            cell.btn_hip_adduction_excessive.addTarget(self, action: #selector(hip_adduction_excessive_clicked_method), for: .touchUpInside)
            
            /*
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             @IBOutlet weak var :UILabel!
             */
            let tap13 = UITapGestureRecognizer(target: self, action: #selector(hip_internal_rotation_clicked_method))
            cell.lbl_hip_internal_rotation.isUserInteractionEnabled = true
            cell.lbl_hip_internal_rotation.addGestureRecognizer(tap13)
            
            let tap14 = UITapGestureRecognizer(target: self, action: #selector(hip_internal_rotation_slight_clicked_method))
            cell.lbl_hip_internal_rotation_slight.isUserInteractionEnabled = true
            cell.lbl_hip_internal_rotation_slight.addGestureRecognizer(tap14)
            
            let tap15 = UITapGestureRecognizer(target: self, action: #selector(hip_internal_rotation_moderate_clicked_method))
            cell.lbl_hip_internal_rotation_moderate.isUserInteractionEnabled = true
            cell.lbl_hip_internal_rotation_moderate.addGestureRecognizer(tap15)
            
            let tap16 = UITapGestureRecognizer(target: self, action: #selector(hip_internal_rotation_excessive_clicked_method))
            cell.lbl_hip_internal_rotation_excessive.isUserInteractionEnabled = true
            cell.lbl_hip_internal_rotation_excessive.addGestureRecognizer(tap16)
            
            cell.btn_hip_internal_rotation.addTarget(self, action: #selector(hip_internal_rotation_clicked_method), for: .touchUpInside)
            cell.btn_hip_internal_rotation_slight.addTarget(self, action: #selector(hip_internal_rotation_slight_clicked_method), for: .touchUpInside)
            cell.btn_hip_internal_rotation_moderate.addTarget(self, action: #selector(hip_internal_rotation_moderate_clicked_method), for: .touchUpInside)
            cell.btn_hip_internal_rotation_excessive.addTarget(self, action: #selector(hip_internal_rotation_excessive_clicked_method), for: .touchUpInside)
            
            
            
            cell.btn_hip_deviation_one.addTarget(self, action: #selector(btn_hip_deviation_one_click), for: .touchUpInside)
            cell.btn_hip_deviation_two.addTarget(self, action: #selector(btn_hip_deviation_two_click), for: .touchUpInside)
            cell.btn_hip_deviation_three.addTarget(self, action: #selector(btn_hip_deviation_three_click), for: .touchUpInside)
            cell.btn_hip_deviation_four.addTarget(self, action: #selector(btn_hip_deviation_four_click), for: .touchUpInside)
            cell.btn_hip_deviation_five.addTarget(self, action: #selector(btn_hip_deviation_five_click), for: .touchUpInside)
            cell.btn_hip_deviation_six.addTarget(self, action: #selector(btn_hip_deviation_six_click), for: .touchUpInside)
            cell.btn_hip_deviation_seven.addTarget(self, action: #selector(btn_hip_deviation_seven_click), for: .touchUpInside)
            
            
            
            
            
            return cell
            
        } else {
            let cell:stance_phase_table_cell = tableView.dequeueReusableCell(withIdentifier: "crash_my_app") as! stance_phase_table_cell
            cell.backgroundColor = .white
            
            let backgroundView = UIView()
            backgroundView.backgroundColor = .clear
            cell.selectedBackgroundView = backgroundView
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 0) {
            return 250
        } else if (indexPath.row == 5) {
            return 364
        } else if (indexPath.row == 1) {
            return 568
        } else if (indexPath.row == 2) {
            return 524
        } else if (indexPath.row == 4) {
            return 336
        } else if (indexPath.row == 3) {
            return 620
        } else {
            return 0
        }
        
    }
    
}


class stance_phase_table_cell: UITableViewCell {

    @IBOutlet  weak var lbl_foot_farefoot:UILabel!
    @IBOutlet  weak var lbl_foot_footFlat:UILabel!
    @IBOutlet  weak var lbl_foot_footSlap:UILabel!
    @IBOutlet  weak var lbl_foot_earlyHeelRise:UILabel!
    @IBOutlet  weak var lbl_foot_delayedHeelRise:UILabel!
    
    // foot deviation
    @IBOutlet  weak var btn_foot_farefoot:UIButton! {
        didSet {
            btn_foot_farefoot.tag = 10
            
        }
    }
    @IBOutlet  weak var btn_foot_footFlat:UIButton! {
        didSet {
            btn_foot_footFlat.tag = 20
        }
    }
    @IBOutlet  weak var btn_foot_footSlap:UIButton! {
        didSet {
            btn_foot_footSlap.tag = 30
        }
    }
    @IBOutlet  weak var btn_foot_earlyHeelRise:UIButton! {
        didSet {
            btn_foot_earlyHeelRise.tag = 40
        }
    }
    @IBOutlet  weak var btn_foot_delayedHeelRise:UIButton! {
        didSet {
            btn_foot_delayedHeelRise.tag = 50
        }
    }
    
    @IBOutlet weak var lbl_index_number:UILabel! {
        didSet {
            lbl_index_number.textColor = .black
            lbl_index_number.clipsToBounds = true
            lbl_index_number.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var lbl_title:UILabel! {
        didSet {
            lbl_title.backgroundColor = .clear
            lbl_title.textColor = .black
        }
    }
    
    /*
      Insufficient Forward Rotation
      Excessive Forward Rotation
      Insufficient Backward Rotation
      Excessive Backward Rotation
      Contralateral Drop
      Excessive Anterior Tilt
      Restricted Pelvic Movement
     */
    // pelvis deviation
    @IBOutlet weak var lbl_pelvis_insufficient_forward:UILabel!
    @IBOutlet weak var lbl_pelvis_excessive_forward:UILabel!
    @IBOutlet weak var lbl_pelvis_insufficient_backward:UILabel!
    @IBOutlet weak var lbl_pelvis_excessive_backward:UILabel!
    @IBOutlet weak var lbl_pelvis_contralateral_drop:UILabel!
    @IBOutlet weak var lbl_pelvis_excessive_anterior:UILabel!
    @IBOutlet weak var lbl_pelvis_restricted_pelvic:UILabel!
    
    @IBOutlet weak var btn_pelvis_insufficient_forward:UIButton! {
        didSet {
            btn_pelvis_insufficient_forward.tag = 60
        }
    }
    @IBOutlet weak var btn_pelvis_excessive_forward:UIButton! {
        didSet {
            btn_pelvis_excessive_forward.tag = 70
        }
    }
    @IBOutlet weak var btn_pelvis_insufficient_backward:UIButton! {
        didSet {
            btn_pelvis_insufficient_backward.tag = 80
        }
    }
    @IBOutlet weak var btn_pelvis_excessive_backward:UIButton! {
        didSet {
            btn_pelvis_excessive_backward.tag = 90
        }
    }
    @IBOutlet weak var btn_pelvis_contralateral_drop:UIButton! {
        didSet {
            btn_pelvis_contralateral_drop.tag = 100
        }
    }
    @IBOutlet weak var btn_pelvis_excessive_anterior:UIButton! {
        didSet {
            btn_pelvis_excessive_anterior.tag = 110
        }
    }
    @IBOutlet weak var btn_pelvis_restricted_pelvic:UIButton! {
        didSet {
            btn_pelvis_restricted_pelvic.tag = 120
        }
    }

    /*
      Forward Lean
      Backward Lean
      Right Lean
      Left Lean
      Restricted Trunk Rotation
     */
    
    @IBOutlet weak var lbl_trunk_forward:UILabel!
    @IBOutlet weak var lbl_trunk_backward:UILabel!
    @IBOutlet weak var lbl_trunk_right:UILabel!
    @IBOutlet weak var lbl_trunk_left:UILabel!
    @IBOutlet weak var lbl_trunk_restricted:UILabel!
    
    // trunk deviation
    @IBOutlet weak var btn_trunk_forward:UIButton! {
        didSet {
            btn_trunk_forward.tag = 130
        }
    }
    
    @IBOutlet weak var btn_trunk_backward:UIButton! {
        didSet {
            btn_trunk_backward.tag = 140
        }
    }
    
    @IBOutlet weak var btn_trunk_right:UIButton! {
        didSet {
            btn_trunk_right.tag = 150
        }
    }
    
    @IBOutlet weak var btn_trunk_left:UIButton! {
        didSet {
            btn_trunk_left.tag = 160
        }
    }
    
    @IBOutlet weak var btn_trunk_restricted:UIButton! {
        didSet {
            btn_trunk_restricted.tag = 170
        }
    }
    
    /*
      Excessive Plantarflexion
      Insufficient Plantarflexion
      Excessive Dorsiflexion
      Insufficient Dorsiflexion
      Inversion
     Slight   Moderate    Excessive
      Eversion
     Slight   Moderate    Excessive
      Stiff ankle
      Unstable Ankle
      Eversion
     Slight   Moderate    Excessive
      Stiff ankle
      Unstable Ankle
     */
    
    @IBOutlet weak var lbl_ankle_excessive_plant:UILabel!
    @IBOutlet weak var lbl_ankle_insufficient_plant:UILabel!
    @IBOutlet weak var lbl_ankle_excessive_dorsirflexion:UILabel!
    @IBOutlet weak var lbl_ankle_insufficient_dorsirflextion:UILabel!
    @IBOutlet weak var lbl_inversion_main:UILabel!
    @IBOutlet weak var lbl_inversion_main_Slight:UILabel!
    @IBOutlet weak var lbl_inversion_main_Moderate:UILabel!
    @IBOutlet weak var lbl_inversion_main_Excessive:UILabel!
    @IBOutlet weak var lbl_ankle_eversion_main:UILabel!
    @IBOutlet weak var lbl_ankle_eversion_main_slight:UILabel!
    @IBOutlet weak var lbl_ankle_eversion_main_moderate:UILabel!
    @IBOutlet weak var lbl_ankle_eversion_main_excessive:UILabel!
    @IBOutlet weak var lbl_ankle_stiff:UILabel!
    @IBOutlet weak var lbl_ankle_unstable:UILabel!
    
    // trunk deviation
    @IBOutlet weak var btn_ankle_excessive_plant:UIButton! {
        didSet {
            btn_ankle_excessive_plant.tag = 180
        }
    }
    
    @IBOutlet weak var btn_ankle_insufficient_plant:UIButton! {
        didSet {
            btn_ankle_insufficient_plant.tag = 190
        }
    }
    
    @IBOutlet weak var btn_ankle_excessive_dorsirflexion:UIButton! {
        didSet {
            btn_ankle_excessive_dorsirflexion.tag = 200
        }
    }
    
    @IBOutlet weak var btn_ankle_insufficient_dorsirflextion:UIButton! {
        didSet {
            btn_ankle_insufficient_dorsirflextion.tag = 210
        }
    }
    
    @IBOutlet weak var btn_inversion_main:UIButton! {
        didSet {
            btn_inversion_main.tag = 220
        }
    }
    
    @IBOutlet weak var btn_inversion_main_Slight:UIButton! {
        didSet {
            btn_inversion_main_Slight.tag = 230
        }
    }
    
    @IBOutlet weak var btn_inversion_main_Moderate:UIButton! {
        didSet {
            btn_inversion_main_Moderate.tag = 240
        }
    }
    
    @IBOutlet weak var btn_inversion_main_Excessive:UIButton! {
        didSet {
            btn_inversion_main_Excessive.tag = 250
        }
    }
     
    // eversion start
    @IBOutlet weak var btn_ankle_eversion_main:UIButton! {
        didSet {
            btn_ankle_eversion_main.tag = 260
        }
    }
    
    @IBOutlet weak var btn_ankle_eversion_main_slight:UIButton! {
        didSet {
            btn_ankle_eversion_main_slight.tag = 270
        }
    }
    
    @IBOutlet weak var btn_ankle_eversion_main_moderate:UIButton! {
        didSet {
            btn_ankle_eversion_main_moderate.tag = 280
        }
    }
    
    @IBOutlet weak var btn_ankle_eversion_main_excessive:UIButton! {
        didSet {
            btn_ankle_eversion_main_excessive.tag = 290
        }
    }
    // eversion end
    
    @IBOutlet weak var btn_ankle_stiff:UIButton! {
        didSet {
            btn_ankle_stiff.tag = 300
        }
    }
    
    @IBOutlet weak var btn_ankle_unstable:UIButton! {
        didSet {
            btn_ankle_unstable.tag = 310
        }
    }
    
    
    @IBOutlet weak var lbl_knee_excessive_flexion:UILabel!
    @IBOutlet weak var lbl_knee_insufficient_flexion:UILabel!
    @IBOutlet weak var lbl_knee_hyperextension:UILabel!
    @IBOutlet weak var lbl_knee_varus_main:UILabel!
    @IBOutlet weak var lbl_knee_varus_slight:UILabel!
    @IBOutlet weak var lbl_knee_varus_moderate:UILabel!
    @IBOutlet weak var lbl_knee_varus_excessive:UILabel!
    @IBOutlet weak var lbl_knee_valgus_main:UILabel!
    @IBOutlet weak var lbl_knee_valgus_slight:UILabel!
    @IBOutlet weak var lbl_knee_valgus_moderate:UILabel!
    @IBOutlet weak var lbl_knee_valgus_excessive:UILabel!
    @IBOutlet weak var lbl_knee_stiff:UILabel!
    @IBOutlet weak var lbl_knee_unstable:UILabel!
    
    // knee deviation
    @IBOutlet weak var btn_knee_excessive_flexion:UIButton! {
        didSet {
            btn_knee_excessive_flexion.tag = 320
        }
    }
    
    @IBOutlet weak var btn_knee_insufficient_flexion:UIButton! {
        didSet {
            btn_knee_insufficient_flexion.tag = 330
        }
    }
    
    @IBOutlet weak var btn_knee_hyperextension:UIButton! {
        didSet {
            btn_knee_hyperextension.tag = 340
        }
    }
    
    @IBOutlet weak var btn_knee_varus_main:UIButton! {
        didSet {
            btn_knee_varus_main.tag = 350
        }
    }
    
    @IBOutlet weak var btn_knee_varus_slight:UIButton! {
        didSet {
            btn_knee_varus_slight.tag = 360
        }
    }
    
    @IBOutlet weak var btn_knee_varus_moderate:UIButton! {
        didSet {
            btn_knee_varus_moderate.tag = 370
        }
    }
    
    @IBOutlet weak var btn_knee_varus_excessive:UIButton! {
        didSet {
            btn_knee_varus_excessive.tag = 380
        }
    }
    
    @IBOutlet weak var btn_knee_valgus_main:UIButton! {
        didSet {
            btn_knee_valgus_main.tag = 390
        }
    }
     
    // eversion start
    @IBOutlet weak var btn_knee_valgus_slight:UIButton! {
        didSet {
            btn_knee_valgus_slight.tag = 400
        }
    }
    
    @IBOutlet weak var btn_knee_valgus_moderate:UIButton! {
        didSet {
            btn_knee_valgus_moderate.tag = 410
        }
    }
    
    @IBOutlet weak var btn_knee_valgus_excessive:UIButton! {
        didSet {
            btn_knee_valgus_excessive.tag = 420
        }
    }
     
    // eversion end
    
    @IBOutlet weak var btn_knee_stiff:UIButton! {
        didSet {
            btn_knee_stiff.tag = 430
        }
    }
    
    @IBOutlet weak var btn_knee_unstable:UIButton! {
        didSet {
            btn_knee_unstable.tag = 440
        }
    }
    
    @IBOutlet weak var lbl_foot_deviation:UILabel! {
        didSet {
            // lbl_foot_deviation.backgroundColor = app_ora
        }
    }
    
    @IBOutlet weak var lbl_ankle_deviation:UILabel! {
        didSet {
            // lbl_ankle_deviation.backgroundColor = header_color
        }
    }
    
    @IBOutlet weak var lbl_knee_deviation:UILabel! {
        didSet {
            // lbl_knee_deviation.backgroundColor = header_color
        }
    }
    
    
    
    
    
    
    
    
    // hip
    @IBOutlet weak var lbl_hip_insufficient_flexion:UILabel!
    @IBOutlet weak var lbl_hip_insufficient_extension:UILabel!
    @IBOutlet weak var lbl_hip_excessive_external_rotation:UILabel!
    @IBOutlet weak var lbl_hip_abduction:UILabel!
    @IBOutlet weak var lbl_hip_abduction_slight:UILabel!
    @IBOutlet weak var lbl_hip_abduction_moderate:UILabel!
    @IBOutlet weak var lbl_hip_abduction_excessive:UILabel!
    @IBOutlet weak var lbl_hip_adduction:UILabel!
    @IBOutlet weak var lbl_hip_adduction_slight:UILabel!
    @IBOutlet weak var lbl_hip_adduction_moderate:UILabel!
    @IBOutlet weak var lbl_hip_adduction_excessive:UILabel!
    @IBOutlet weak var lbl_hip_internal_rotation:UILabel!
    @IBOutlet weak var lbl_hip_internal_rotation_slight:UILabel!
    @IBOutlet weak var lbl_hip_internal_rotation_moderate:UILabel!
    @IBOutlet weak var lbl_hip_internal_rotation_excessive:UILabel!
    @IBOutlet weak var lbl_hip_stiff:UILabel!
    
    // MARK: - HIP -
    @IBOutlet weak var btn_hip_insufficient_flexion:UIButton! {
        didSet {
            btn_hip_insufficient_flexion.tag = 450
        }
    }
    
    @IBOutlet weak var btn_hip_insufficient_extension:UIButton! {
        didSet {
            btn_hip_insufficient_extension.tag = 460
        }
    }
    
    @IBOutlet weak var btn_hip_excessive_external_rotation:UIButton! {
        didSet {
            btn_hip_excessive_external_rotation.tag = 470
        }
    }
    
    // abduction
    @IBOutlet weak var btn_hip_abduction:UIButton! {
        didSet {
            btn_hip_abduction.tag = 480
        }
    }
    @IBOutlet weak var btn_hip_abduction_slight:UIButton! {
        didSet {
            btn_hip_abduction_slight.tag = 490
        }
    }
    @IBOutlet weak var btn_hip_abduction_moderate:UIButton! {
        didSet {
            btn_hip_abduction_moderate.tag = 500
        }
    }
    @IBOutlet weak var btn_hip_abduction_excessive:UIButton! {
        didSet {
            btn_hip_abduction_excessive.tag = 510
        }
    }
    
    
    // abduction
    @IBOutlet weak var btn_hip_adduction:UIButton! {
        didSet {
            btn_hip_adduction.tag = 520
        }
    }
    @IBOutlet weak var btn_hip_adduction_slight:UIButton! {
        didSet {
            btn_hip_adduction_slight.tag = 530
        }
    }
    @IBOutlet weak var btn_hip_adduction_moderate:UIButton! {
        didSet {
            btn_hip_adduction_moderate.tag = 540
        }
    }
    @IBOutlet weak var btn_hip_adduction_excessive:UIButton! {
        didSet {
            btn_hip_adduction_excessive.tag = 550
        }
    }
    
    
    // Internal Rotation
    @IBOutlet weak var btn_hip_internal_rotation:UIButton! {
        didSet {
            btn_hip_internal_rotation.tag = 560
        }
    }
    @IBOutlet weak var btn_hip_internal_rotation_slight:UIButton! {
        didSet {
            btn_hip_internal_rotation_slight.tag = 570
        }
    }
    @IBOutlet weak var btn_hip_internal_rotation_moderate:UIButton! {
        didSet {
            btn_hip_internal_rotation_moderate.tag = 580
        }
    }
    @IBOutlet weak var btn_hip_internal_rotation_excessive:UIButton! {
        didSet {
            btn_hip_internal_rotation_excessive.tag = 590
        }
    }
    
    // Stiff Hip
    @IBOutlet weak var btn_hip_stiff:UIButton! {
        didSet {
            btn_hip_stiff.tag = 600
        }
    }
    
    
    
    
    
    @IBOutlet weak var lbl_pelvis_deviation:UILabel!
    @IBOutlet weak var lbl_trunk_deviation:UILabel!
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBOutlet weak var btn_save_and_continue:UIButton! {
        didSet {
            btn_save_and_continue.layer.cornerRadius = 20
            btn_save_and_continue.clipsToBounds = true
            // btn_save_and_continue.backgroundColor = .systemGreen
            btn_save_and_continue.setTitleColor(.white, for: .normal)
        }
    }
    
    
    
    @IBOutlet weak var btn_foot_deviation_one:UIButton!
    @IBOutlet weak var btn_foot_deviation_two:UIButton!
    @IBOutlet weak var btn_foot_deviation_three:UIButton!
    @IBOutlet weak var btn_foot_deviation_four:UIButton!
    @IBOutlet weak var btn_foot_deviation_five:UIButton!
    
    @IBOutlet weak var btn_ankle_deviation_one:UIButton!
    @IBOutlet weak var btn_ankle_deviation_two:UIButton!
    @IBOutlet weak var btn_ankle_deviation_three:UIButton!
    @IBOutlet weak var btn_ankle_deviation_four:UIButton!
    @IBOutlet weak var btn_ankle_deviation_five:UIButton!
    @IBOutlet weak var btn_ankle_deviation_six:UIButton!
    @IBOutlet weak var btn_ankle_deviation_seven:UIButton!
    @IBOutlet weak var btn_ankle_deviation_eight:UIButton!
    
    
    @IBOutlet weak var btn_knee_deviation_one:UIButton!
    @IBOutlet weak var btn_knee_deviation_two:UIButton!
    @IBOutlet weak var btn_knee_deviation_three:UIButton!
    @IBOutlet weak var btn_knee_deviation_four:UIButton!
    @IBOutlet weak var btn_knee_deviation_five:UIButton!
    @IBOutlet weak var btn_knee_deviation_six:UIButton!
    @IBOutlet weak var btn_knee_deviation_seven:UIButton!
    
    @IBOutlet weak var btn_hip_deviation_one:UIButton!
    @IBOutlet weak var btn_hip_deviation_two:UIButton!
    @IBOutlet weak var btn_hip_deviation_three:UIButton!
    @IBOutlet weak var btn_hip_deviation_four:UIButton!
    @IBOutlet weak var btn_hip_deviation_five:UIButton!
    @IBOutlet weak var btn_hip_deviation_six:UIButton!
    @IBOutlet weak var btn_hip_deviation_seven:UIButton!
    
    @IBOutlet weak var btn_pelvis_one:UIButton!
    @IBOutlet weak var btn_pelvis_two:UIButton!
    @IBOutlet weak var btn_pelvis_three:UIButton!
    @IBOutlet weak var btn_pelvis_four:UIButton!
    @IBOutlet weak var btn_pelvis_five:UIButton!
    @IBOutlet weak var btn_pelvis_six:UIButton!
    @IBOutlet weak var btn_pelvis_seven:UIButton!
    
    @IBOutlet weak var btn_trunk_one:UIButton!
    @IBOutlet weak var btn_trunk_two:UIButton!
    @IBOutlet weak var btn_trunk_three:UIButton!
    @IBOutlet weak var btn_trunk_four:UIButton!
    @IBOutlet weak var btn_trunk_five:UIButton!
}
