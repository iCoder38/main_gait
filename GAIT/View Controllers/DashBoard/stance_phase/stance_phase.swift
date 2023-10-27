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
    var pelvis_index = 3
    var trunk_index = 4
    
    @IBOutlet weak var tble_view:UITableView!
    
    var arr_mut_would_like_to:NSMutableArray! = []
    
    var (footArr, ankleArr, pelvisArr ,kneeArr, hipArr, trunkArr) = ([String](),[String](),[String](),[String](),[String](),[String]())
    
    var arr_foot:NSMutableArray! = []
    var arr_ankle:NSMutableArray! = []
    var arr_knee:NSMutableArray! = []
    var arr_pelvis:NSMutableArray! = []
    var arr_trunk:NSMutableArray! = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        // self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationItem.title = "G.A.I.T App".uppercased()
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
        
         
        
        
    }
    
    @objc func backClickMethod() {
        self.navigationController?.popViewController(animated: true)
    }

    @objc func show_data() {
        print(self.arr_foot as Any)
        print(self.arr_pelvis as Any)
        print(self.arr_trunk as Any)
        
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
        
        
        
        
        // MANAGE ALL
        selected_stance_phase.setObject(footArr.joined(separator:"\n"), forKey: "foot" as NSCopying)
        selected_stance_phase.setObject(ankleArr.joined(separator:"\n"), forKey: "ankle" as NSCopying)
        selected_stance_phase.setObject(kneeArr.joined(separator:"\n"), forKey: "knee" as NSCopying)
        // selected_stance_phase.setObject(hipArr.joined(separator:"\n"), forKey: "hip" as NSCopying)
        selected_stance_phase.setObject(pelvisArr.joined(separator:"\n"), forKey: "pelvis" as NSCopying)
        selected_stance_phase.setObject(trunkArr.joined(separator:"\n"), forKey: "trunk" as NSCopying)
        
        print(selected_stance_phase as Any)
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
            cell.btn_inversion_main_Slight.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            cell.btn_inversion_main_Moderate.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            cell.btn_inversion_main_Excessive.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
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
                
                cell.btn_inversion_main_Slight.setImage(UIImage(named: "check_icon"), for: .normal)
                
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
                cell.btn_inversion_main_Moderate.setImage(UIImage(named: "uncheck_icon"), for: .normal)
                cell.btn_inversion_main_Excessive.setImage(UIImage(named: "uncheck_icon"), for: .normal)
                
                cell.btn_inversion_main_Slight.tag = 231
            } else {
                cell.btn_inversion_main_Slight.setImage(UIImage(named: "uncheck_icon"), for: .normal)
                
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
            
            cell.btn_inversion_main_Moderate.setImage(UIImage(named: "check_icon"), for: .normal)
            
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
            cell.btn_inversion_main_Slight.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            cell.btn_inversion_main_Excessive.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            cell.btn_inversion_main_Moderate.tag = 241
        } else {
            cell.btn_inversion_main_Moderate.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
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
                
                cell.btn_inversion_main_Excessive.setImage(UIImage(named: "check_icon"), for: .normal)
                
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
                cell.btn_inversion_main_Slight.setImage(UIImage(named: "uncheck_icon"), for: .normal)
                cell.btn_inversion_main_Moderate.setImage(UIImage(named: "uncheck_icon"), for: .normal)
                
                cell.btn_inversion_main_Excessive.tag = 251
            } else {
                cell.btn_inversion_main_Excessive.setImage(UIImage(named: "uncheck_icon"), for: .normal)
                
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
            cell.btn_ankle_eversion_main_slight.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            cell.btn_ankle_eversion_main_moderate.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            cell.btn_ankle_eversion_main_excessive.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            cell.btn_ankle_eversion_main_slight.tag = 270
            cell.btn_ankle_eversion_main_moderate.tag = 280
            cell.btn_ankle_eversion_main_excessive.tag = 290
            
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
                
                cell.btn_ankle_eversion_main_slight.setImage(UIImage(named: "check_icon"), for: .normal)
                
                cell.btn_ankle_eversion_main_slight.tag = 271
            } else {
                cell.btn_ankle_eversion_main_slight.setImage(UIImage(named: "uncheck_icon"), for: .normal)
                
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
                
                cell.btn_ankle_eversion_main_moderate.setImage(UIImage(named: "check_icon"), for: .normal)
                
                cell.btn_ankle_eversion_main_moderate.tag = 281
            } else {
                cell.btn_ankle_eversion_main_moderate.setImage(UIImage(named: "uncheck_icon"), for: .normal)
                
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
                
                cell.btn_ankle_eversion_main_excessive.setImage(UIImage(named: "check_icon"), for: .normal)
                
                cell.btn_ankle_eversion_main_excessive.tag = 291
            } else {
                cell.btn_ankle_eversion_main_excessive.setImage(UIImage(named: "uncheck_icon"), for: .normal)
                
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
            cell.btn_knee_varus_slight.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            cell.btn_knee_varus_moderate.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            cell.btn_knee_varus_excessive.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            cell.btn_knee_varus_slight.tag = 360
            cell.btn_knee_varus_moderate.tag = 370
            cell.btn_knee_varus_excessive.tag = 380
            
            cell.btn_knee_varus_main.tag = 350
        }
    }
    @objc func knee_varus_slight_clicked_method() {
        let indexPath = IndexPath.init(row: knee_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        
        if (cell.btn_knee_varus_main.tag == 351) {
            
            print(cell.btn_knee_varus_slight.tag as Any)
            if (cell.btn_knee_varus_slight.tag == 360) {
                
                cell.btn_knee_varus_slight.setImage(UIImage(named: "check_icon"), for: .normal)
                
                cell.btn_knee_varus_slight.tag = 361
            } else {
                cell.btn_knee_varus_slight.setImage(UIImage(named: "uncheck_icon"), for: .normal)
                
                cell.btn_knee_varus_slight.tag = 360
            }
            
        } else {
            
        }
    }
    
    @objc func knee_varus_moderate_clicked_method() {
        let indexPath = IndexPath.init(row: knee_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        if (cell.btn_knee_varus_main.tag == 351) {
        print(cell.btn_knee_varus_moderate.tag as Any)
        if (cell.btn_knee_varus_moderate.tag == 370) {
            
            cell.btn_knee_varus_moderate.setImage(UIImage(named: "check_icon"), for: .normal)
            
            cell.btn_knee_varus_moderate.tag = 371
        } else {
            cell.btn_knee_varus_moderate.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            cell.btn_knee_varus_moderate.tag = 370
        }
        } else {
            
        }
    }
    @objc func knee_varus_excessive_clicked_method() {
        let indexPath = IndexPath.init(row: knee_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        
        if (cell.btn_knee_varus_main.tag == 351) {
            
            print(cell.btn_knee_varus_excessive.tag as Any)
            if (cell.btn_knee_varus_excessive.tag == 380) {
                
                cell.btn_knee_varus_excessive.setImage(UIImage(named: "check_icon"), for: .normal)
                
                cell.btn_knee_varus_excessive.tag = 381
            } else {
                cell.btn_knee_varus_excessive.setImage(UIImage(named: "uncheck_icon"), for: .normal)
                
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
        
        print(cell.btn_knee_valgus_main.tag as Any)
        if (cell.btn_knee_valgus_main.tag == 390) {
            
            cell.btn_knee_valgus_main.setImage(UIImage(named: "check_icon"), for: .normal)
            
            cell.btn_knee_valgus_main.tag = 391
        } else {
            cell.btn_knee_valgus_main.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            cell.btn_knee_valgus_main.tag = 390
        }
    }
    @objc func knee_valgus_slight_clicked_method() {
        let indexPath = IndexPath.init(row: knee_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        
        if (cell.btn_knee_varus_main.tag == 351) {
            
        print(cell.btn_knee_valgus_slight.tag as Any)
        if (cell.btn_knee_valgus_slight.tag == 400) {
            
            cell.btn_knee_valgus_slight.setImage(UIImage(named: "check_icon"), for: .normal)
            
            cell.btn_knee_valgus_slight.tag = 401
        } else {
            cell.btn_knee_valgus_slight.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            cell.btn_knee_valgus_slight.tag = 400
        }
        } else {
            
        }
    }
    @objc func knee_valgus_moderate_clicked_method() {
        let indexPath = IndexPath.init(row: knee_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        
        if (cell.btn_knee_varus_main.tag == 351) {
            
        print(cell.btn_knee_valgus_moderate.tag as Any)
        if (cell.btn_knee_valgus_moderate.tag == 410) {
            
            cell.btn_knee_valgus_moderate.setImage(UIImage(named: "check_icon"), for: .normal)
            
            cell.btn_knee_valgus_moderate.tag = 411
        } else {
            cell.btn_knee_valgus_moderate.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            cell.btn_knee_valgus_moderate.tag = 410
        }
        } else {
            
        }
    }
    @objc func knee_valgus_excessive_clicked_method() {
        let indexPath = IndexPath.init(row: knee_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        
        if (cell.btn_knee_varus_main.tag == 351) {
            
            print(cell.btn_knee_valgus_excessive.tag as Any)
            if (cell.btn_knee_valgus_excessive.tag == 420) {
                
                cell.btn_knee_valgus_excessive.setImage(UIImage(named: "check_icon"), for: .normal)
                
                cell.btn_knee_valgus_excessive.tag = 421
            } else {
                cell.btn_knee_valgus_excessive.setImage(UIImage(named: "uncheck_icon"), for: .normal)
                
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
}


extension stance_phase:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0) {
            
            let cell:stance_phase_table_cell = tableView.dequeueReusableCell(withIdentifier: "one_table_cell") as! stance_phase_table_cell
            cell.backgroundColor = .white
            
            let backgroundView = UIView()
            backgroundView.backgroundColor = .clear
            cell.selectedBackgroundView = backgroundView
            
            cell.btn_foot_farefoot.addTarget(self, action: #selector(fareFootClickMethod), for: .touchUpInside)
            cell.btn_foot_footFlat.addTarget(self, action: #selector(footFlatClickMethod), for: .touchUpInside)
            cell.btn_foot_footSlap.addTarget(self, action: #selector(footSlapClickMethod), for: .touchUpInside)
            cell.btn_foot_earlyHeelRise.addTarget(self, action: #selector(earlyHeelRiseClickMethod), for: .touchUpInside)
            cell.btn_foot_delayedHeelRise.addTarget(self, action: #selector(delayedHeelRiseClickMethod), for: .touchUpInside)
            
            return cell
            
        } else if (indexPath.row == 3) {
            
            let cell:stance_phase_table_cell = tableView.dequeueReusableCell(withIdentifier: "five_table_cell") as! stance_phase_table_cell
            cell.backgroundColor = .white
            
            let backgroundView = UIView()
            backgroundView.backgroundColor = .clear
            cell.selectedBackgroundView = backgroundView
          
            cell.btn_pelvis_insufficient_forward.addTarget(self, action: #selector(insufficientForwardClickMethod), for: .touchUpInside)
            cell.btn_pelvis_excessive_forward.addTarget(self, action: #selector(excessive_forward_ClickMethod), for: .touchUpInside)
            cell.btn_pelvis_insufficient_backward.addTarget(self, action: #selector(insufficient_backward_ClickMethod), for: .touchUpInside)
            cell.btn_pelvis_excessive_backward.addTarget(self, action: #selector(excessive_backward_ClickMethod), for: .touchUpInside)
            cell.btn_pelvis_contralateral_drop.addTarget(self, action: #selector(contralateral_dropClickMethod), for: .touchUpInside)
            cell.btn_pelvis_excessive_anterior.addTarget(self, action: #selector(excessive_anteriorClickMethod), for: .touchUpInside)
            cell.btn_pelvis_restricted_pelvic.addTarget(self, action: #selector(restricted_pelvicClickMethod), for: .touchUpInside)
            
            return cell
            
        } else if (indexPath.row == 4) {
            
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
            cell.btn_trunk_forward.addTarget(self, action: #selector(trunk_forward_ClickMethod), for: .touchUpInside)
            cell.btn_trunk_backward.addTarget(self, action: #selector(trunk_backward_ClickMethod), for: .touchUpInside)
            cell.btn_trunk_right.addTarget(self, action: #selector(trunk_right_ClickMethod), for: .touchUpInside)
            cell.btn_trunk_left.addTarget(self, action: #selector(trunk_left_ClickMethod), for: .touchUpInside)
            cell.btn_trunk_restricted.addTarget(self, action: #selector(trunk_restricted_ClickMethod), for: .touchUpInside)
            
            cell.btn_save_and_continue.addTarget(self, action: #selector(save_and_continue_click_method), for: .touchUpInside)
            
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
            
            
            
            
            
            return cell
            
        } else if (indexPath.row == 2) {
            
            let cell:stance_phase_table_cell = tableView.dequeueReusableCell(withIdentifier: "three_table_cell") as! stance_phase_table_cell
            cell.backgroundColor = .white
            
            let backgroundView = UIView()
            backgroundView.backgroundColor = .clear
            cell.selectedBackgroundView = backgroundView
          
            
            cell.btn_knee_excessive_flexion.addTarget(self, action: #selector(knee_excessive_flexion_clicked_method), for: .touchUpInside)
            cell.btn_knee_insufficient_flexion.addTarget(self, action: #selector(knee_insufficient_flexion_clicked_method), for: .touchUpInside)
            cell.btn_knee_hyperextension.addTarget(self, action: #selector(knee_hyperextension_clicked_method), for: .touchUpInside)
            
            cell.btn_knee_varus_main.addTarget(self, action: #selector(knee_varus_main_clicked_method), for: .touchUpInside)
            cell.btn_knee_varus_slight.addTarget(self, action: #selector(knee_varus_slight_clicked_method), for: .touchUpInside)
            cell.btn_knee_varus_moderate.addTarget(self, action: #selector(knee_varus_moderate_clicked_method), for: .touchUpInside)
            cell.btn_knee_varus_excessive.addTarget(self, action: #selector(knee_varus_excessive_clicked_method), for: .touchUpInside)
            
            cell.btn_knee_valgus_main.addTarget(self, action: #selector(knee_valgus_main_clicked_method), for: .touchUpInside)
            cell.btn_knee_valgus_slight.addTarget(self, action: #selector(knee_valgus_slight_clicked_method), for: .touchUpInside)
            cell.btn_knee_valgus_moderate.addTarget(self, action: #selector(knee_valgus_moderate_clicked_method), for: .touchUpInside)
            cell.btn_knee_valgus_excessive.addTarget(self, action: #selector(knee_valgus_excessive_clicked_method), for: .touchUpInside)
            
            cell.btn_knee_stiff.addTarget(self, action: #selector(knee_stiff_clicked_method), for: .touchUpInside)
            cell.btn_knee_unstable.addTarget(self, action: #selector(knee_unstable_clicked_method), for: .touchUpInside)
            
            
            
            
            
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
        } else if (indexPath.row == 3) {
            return 364
        } else if (indexPath.row == 1) {
            return 568
        } else if (indexPath.row == 2) {
            return 524
        } else if (indexPath.row == 4) {
            return 294
        } else {
            return 0
        }
        
    }
    
}


class stance_phase_table_cell: UITableViewCell {

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
    
    @IBOutlet weak var btn_save_and_continue:UIButton!
    
}