//
//  how_the_app_works.swift
//  GAIT
//
//  Created by Dishant Rajput on 25/10/23.
//  Copyright © 2023 EVS. All rights reserved.
//

import UIKit

class how_the_app_works: UIViewController {
    
    var str_profile_name:String!
    
    @IBOutlet weak var tble_view:UITableView!
    
    var arr_mut_would_like_to:NSMutableArray! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        // self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        if (self.str_profile_name == "how_the_app_works") {
            self.navigationItem.title = "Learning Videos".uppercased()
            
        } else if (self.str_profile_name == "sample_gait_videos") {
            self.navigationItem.title = "Sample Videos".uppercased()
            
        } else if (self.str_profile_name == "types_of_gait") {
            self.navigationItem.title = "Types of Gait".uppercased()
            
        } else if (self.str_profile_name == "comprehensive_gait_assessment") {
            self.navigationItem.title = "Comprehensive Gait Assessment".uppercased()
            
        } else if (self.str_profile_name == "quick_gate_assessment") {
            self.navigationItem.title = "Quick Gait Assessment".uppercased()
            
        } else if (self.str_profile_name == "gait_comparision") {
            self.navigationItem.title = "Gait Comaprision".uppercased()
            
        } else if (self.str_profile_name == "practice_gait_skills") {
            self.navigationItem.title = "Practice Videos".uppercased()
            
        }
        
        self.tble_view.separatorColor = .clear
        
        self.tble_view.delegate = self
        self.tble_view.dataSource = self
        self.tble_view.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Back Button X
        let backButton = UIBarButtonItem.init(image: #imageLiteral(resourceName: "back_icon").withRenderingMode(.alwaysOriginal) , style: .plain, target: self, action: #selector(self.backClickMethod))
        self.navigationItem.leftBarButtonItem = backButton
        backButton.tintColor = .black
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @objc func backClickMethod() {
        self.navigationController?.popViewController(animated: true)
    }

}


extension how_the_app_works:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (self.str_profile_name == "how_the_app_works") {
            return 4
        } else if (self.str_profile_name == "sample_gait_videos") {
            return 25
        } else if (self.str_profile_name == "types_of_gait") {
            return 11
        } else if (self.str_profile_name == "practice_gait_skills") {
            return 24
        } else {
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:how_the_app_works_table_cell = tableView.dequeueReusableCell(withIdentifier: "how_the_app_works_table_cell") as! how_the_app_works_table_cell
        cell.backgroundColor = .white
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
        
        if (self.str_profile_name == "how_the_app_works") {
            
            cell.lbl_index_number.text = "\(indexPath.row + 1)"
            cell.lbl_index_number.backgroundColor = UIColor.init(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1)
            
            if (indexPath.row == 0) {
                cell.lbl_title.text = "App overview Video"
                cell.accessoryType = .disclosureIndicator
            } else if (indexPath.row == 1) {
                cell.lbl_title.text = "Using the Comprehensive Gait Assessment Form"
                cell.accessoryType = .disclosureIndicator
            } else if (indexPath.row == 2) {
                cell.lbl_title.text = "Using the Quick Gait Assessment Form"
                cell.accessoryType = .disclosureIndicator
            } else if (indexPath.row == 3) {
                cell.lbl_title.text = "Performing Gait Comparison"
                cell.accessoryType = .disclosureIndicator
            }
            
        } else  if (self.str_profile_name == "sample_gait_videos") {
            cell.lbl_index_number.backgroundColor = UIColor.init(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1)
            
            if (indexPath.row == 0) {
                cell.lbl_title.text = "Prosthetics"
                cell.backgroundColor = .systemOrange
                cell.lbl_index_number.isHidden = true
                
            } else if (indexPath.row == 1) {
                cell.lbl_title.text = "Unilateral Below-Knee Amputee"
                cell.accessoryType = .disclosureIndicator
                
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "\(indexPath.row)"
                
            } else if (indexPath.row == 2) {
                cell.lbl_title.text = "Unilateral Above-Knee Amputee"
                cell.accessoryType = .disclosureIndicator
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "\(indexPath.row)"
                
            } else if (indexPath.row == 3) {
                cell.lbl_title.text = "Bilateral Below-Knee Amputee"
                cell.accessoryType = .disclosureIndicator
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "\(indexPath.row)"
                
            } else if (indexPath.row == 4) {
                cell.lbl_title.text = "Bilateral Above-Knee Amputee"
                cell.accessoryType = .disclosureIndicator
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "\(indexPath.row)"
                
            } else if (indexPath.row == 5) {
                cell.lbl_title.text = "Bilateral Above & Below Knee Amputee"
                cell.accessoryType = .disclosureIndicator
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "\(indexPath.row)"
                
            } else if (indexPath.row == 6) {
                cell.lbl_title.text = "Orthotics"
                cell.backgroundColor = .systemOrange
                cell.lbl_index_number.isHidden = true
                
            } else if (indexPath.row == 7) {
                cell.lbl_title.text = "Metal Double-Upright Ankle Foot Orthosis"
                cell.accessoryType = .disclosureIndicator
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "1"
                
            } else if (indexPath.row == 8) {
                cell.lbl_title.text = "Polypropylene Ankle Foot Orthosis"
                cell.accessoryType = .disclosureIndicator
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "2"
                
            } else if (indexPath.row == 9) {
                cell.lbl_title.text = "Unilateral Carbon-fiber Ankle Foot Orthosis"
                cell.accessoryType = .disclosureIndicator
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "3"
                
            } else if (indexPath.row == 10) {
                cell.lbl_title.text = "Bilateral Carbon-fiber Ankle Foot Orthoses"
                cell.accessoryType = .disclosureIndicator
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "4"
                
            } else if (indexPath.row == 11) {
                cell.lbl_title.text = "Orthotic Shoes"
                cell.accessoryType = .disclosureIndicator
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "5"
                
            } else if (indexPath.row == 12) {
                cell.lbl_title.text = "Neurological Conditions"
                cell.backgroundColor = .systemOrange
                cell.lbl_index_number.isHidden = true
                
            } else if (indexPath.row == 13) {
                cell.lbl_title.text = "Cerebro-Vascular Accident (CVA or Stroke)"
                cell.accessoryType = .disclosureIndicator
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "1"
                
            } else if (indexPath.row == 14) {
                cell.lbl_title.text = "Spina Bifida"
                cell.accessoryType = .disclosureIndicator
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "2"
                
            } else if (indexPath.row == 15) {
                cell.lbl_title.text = "Cerebral Palsy (CP)"
                cell.accessoryType = .disclosureIndicator
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "3"
                
            } else if (indexPath.row == 16) {
                cell.lbl_title.text = "Sensory Ataxia"
                cell.accessoryType = .disclosureIndicator
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "4"
                
            } else if (indexPath.row == 17) {
                cell.lbl_title.text = "Post-COVID Neuropathy"
                cell.accessoryType = .disclosureIndicator
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "5"
                
            } else if (indexPath.row == 18) {
                cell.lbl_title.text = "Incomplete Spinal Cord Injury (SCI)"
                cell.accessoryType = .disclosureIndicator
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "6"
                
            } else if (indexPath.row == 19) {
                cell.lbl_title.text = "Cerebellar Ataxia"
                cell.accessoryType = .disclosureIndicator
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "7"
                
            } else if (indexPath.row == 20) {
                cell.lbl_title.text = "Traumatic Brain Injury (TBI)"
                cell.accessoryType = .disclosureIndicator
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "8"
                
            } else if (indexPath.row == 21) {
                cell.lbl_title.text = "Orthopedic Conditions"
                cell.backgroundColor = .systemOrange
                cell.lbl_index_number.isHidden = true
                
            } else if (indexPath.row == 22) {
                cell.lbl_title.text = "Trendelenburg Gait"
                cell.accessoryType = .disclosureIndicator
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "1"
                
            } else if (indexPath.row == 23) {
                cell.lbl_title.text = "Rheumatoid Arthritis"
                cell.accessoryType = .disclosureIndicator
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "2"
                
            } else if (indexPath.row == 24) {
                cell.lbl_title.text = "Total Hip Arthroplasty (THA)"
                cell.accessoryType = .disclosureIndicator
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "3"
                
            }
            
        } else  if (self.str_profile_name == "types_of_gait") {
            
            cell.lbl_index_number.text = "\(indexPath.row + 1)"
            
            if (indexPath.row == 0) {
                cell.lbl_title.text = "Antalgic Gait"
                cell.lbl_title.textColor = .black
                cell.accessoryType = .disclosureIndicator
                cell.backgroundColor = UIColor.init(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1)
                
                cell.lbl_index_number.backgroundColor = UIColor.init(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1)
                
            } else if (indexPath.row == 1) {
                cell.lbl_title.text = "Apraxic Gait"
                cell.accessoryType = .disclosureIndicator
                cell.backgroundColor = UIColor.init(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1)
                cell.lbl_index_number.backgroundColor = UIColor.init(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1)
                
            } else if (indexPath.row == 2) {
                cell.lbl_title.text = "Cerebellar Ataxic Gait"
                cell.lbl_title.textColor = .black
                cell.accessoryType = .disclosureIndicator
                cell.backgroundColor = UIColor.init(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1)
                
                cell.lbl_index_number.backgroundColor = UIColor.init(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1)
                
            } else if (indexPath.row == 3) {
                cell.lbl_title.text = "Choreiform Gait"
                cell.accessoryType = .disclosureIndicator
                cell.backgroundColor = UIColor.init(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1)
                cell.lbl_index_number.backgroundColor = UIColor.init(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1)
                
            } else if (indexPath.row == 4) {
                cell.lbl_title.text = "Circumduction Gait"
                cell.lbl_title.textColor = .black
                cell.accessoryType = .disclosureIndicator
                cell.backgroundColor = UIColor.init(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1)
                
                cell.lbl_index_number.backgroundColor = UIColor.init(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1)
                
            } else if (indexPath.row == 5) {
                cell.lbl_title.text = "Festinating Gait"
                cell.accessoryType = .disclosureIndicator
                cell.backgroundColor = UIColor.init(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1)
                cell.lbl_index_number.backgroundColor = UIColor.init(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1)
            } else if (indexPath.row == 6) {
                cell.lbl_title.text = "Scissors Gait"
                cell.lbl_title.textColor = .black
                cell.accessoryType = .disclosureIndicator
                cell.backgroundColor = UIColor.init(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1)
                
                cell.lbl_index_number.backgroundColor = UIColor.init(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1)
                
            } else if (indexPath.row == 7) {
                cell.lbl_title.text = "Senile Apraxic Gait"
                cell.accessoryType = .disclosureIndicator
                cell.backgroundColor = UIColor.init(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1)
                cell.lbl_index_number.backgroundColor = UIColor.init(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1)
                
            } else if (indexPath.row == 8) {
                cell.lbl_title.text = "Steppage Gait"
                cell.lbl_title.textColor = .black
                cell.accessoryType = .disclosureIndicator
                cell.backgroundColor = UIColor.init(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1)
                
                cell.lbl_index_number.backgroundColor = UIColor.init(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1)
                
            } else if (indexPath.row == 9) {
                cell.lbl_title.text = "Tabetic Gait"
                cell.accessoryType = .disclosureIndicator
                cell.backgroundColor = UIColor.init(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1)
                
                cell.lbl_index_number.backgroundColor = UIColor.init(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1)
                
            } else if (indexPath.row == 10) {
                cell.lbl_title.text = "Trendelenburg Gait"
                cell.lbl_title.textColor = .black
                cell.accessoryType = .disclosureIndicator
                cell.backgroundColor = UIColor.init(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1)
                
                cell.lbl_index_number.backgroundColor = UIColor.init(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1)
                
            }
            
        } else  if (self.str_profile_name == "practice_gait_skills") {
            
            if (indexPath.row == 0) {
                cell.lbl_title.text = "Prosthetics"
                cell.backgroundColor = .systemOrange
                cell.lbl_index_number.isHidden = true
                
            } else if (indexPath.row == 1) {
                cell.lbl_title.text = "Unilateral Below Knee Amputee"
                cell.accessoryType = .disclosureIndicator
                
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "\(indexPath.row)"
                
            } else if (indexPath.row == 2) {
                cell.lbl_title.text = "Above-Knee Amputee – 1"
                cell.accessoryType = .disclosureIndicator
                
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "\(indexPath.row)"
                
            } else if (indexPath.row == 3) {
                cell.lbl_title.text = "Above-Knee Amputee – 2"
                cell.accessoryType = .disclosureIndicator
                
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "\(indexPath.row)"
                
            } else if (indexPath.row == 4) {
                cell.lbl_title.text = "Bilateral Above & Below Knee Amputee"
                cell.accessoryType = .disclosureIndicator
                
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "\(indexPath.row)"
                
            } else if (indexPath.row == 5) {
                cell.lbl_title.text = "Hip Disarticulation Amputee"
                cell.accessoryType = .disclosureIndicator
                
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "\(indexPath.row)"
                
            }
            //
            else if (indexPath.row == 6) {
                cell.lbl_title.text = "Orthotics"
                cell.backgroundColor = .systemOrange
                cell.lbl_index_number.isHidden = true
                
            }  else if (indexPath.row == 7) {
                cell.lbl_title.text = "Metal Double-Upright Ankle Foot Orthosis"
                cell.accessoryType = .disclosureIndicator
                
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "1"
                
            } else if (indexPath.row == 8) {
                cell.lbl_title.text = "Unilateral Carbon-fiber Ankle Foot Orthosis"
                cell.accessoryType = .disclosureIndicator
                
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "2"
                
            } else if (indexPath.row == 9) {
                cell.lbl_title.text = "Bilateral Carbon-fiber Ankle Foot Orthoses"
                cell.accessoryType = .disclosureIndicator
                
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "3"
                
            } else if (indexPath.row == 10) {
                cell.lbl_title.text = "Orthotics Practice Video 1"
                cell.accessoryType = .disclosureIndicator
                
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "4"
                
            } else if (indexPath.row == 11) {
                cell.lbl_title.text = "Orthotics Practice Video 2"
                cell.accessoryType = .disclosureIndicator
                
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "5"
                
            }
            // 3
            else if (indexPath.row == 12) {
                cell.lbl_title.text = "Neurological Conditions"
                cell.backgroundColor = .systemOrange
                cell.lbl_index_number.isHidden = true
                
            }  else if (indexPath.row == 13) {
                cell.lbl_title.text = "Cerebro-Vascular Accident (CVA)"
                cell.accessoryType = .disclosureIndicator
                
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "1"
                
            } else if (indexPath.row == 14) {
                cell.lbl_title.text = "Guillian Barre"
                cell.accessoryType = .disclosureIndicator
                
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "2"
                
            } else if (indexPath.row == 15) {
                cell.lbl_title.text = "Cerebral Palsy (CP)"
                cell.accessoryType = .disclosureIndicator
                
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "3"
                
            } else if (indexPath.row == 16) {
                cell.lbl_title.text = "Neuro Practice Video 1 (Foot Slap)"
                cell.accessoryType = .disclosureIndicator
                
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "4"
                
            } else if (indexPath.row == 17) {
                cell.lbl_title.text = "Neuro Practice Video 2 (Shuffling Gait)"
                cell.accessoryType = .disclosureIndicator
                
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "5"
                
            }  // 4
            else if (indexPath.row == 18) {
                cell.lbl_title.text = "Orthopedic Conditions"
                cell.backgroundColor = .systemOrange
                cell.lbl_index_number.isHidden = true
                
            }   else if (indexPath.row == 19) {
                cell.lbl_title.text = "Polio"
                cell.accessoryType = .disclosureIndicator
                
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "1"
                
            } else if (indexPath.row == 20) {
                cell.lbl_title.text = "Severe Osteoarthritis"
                cell.accessoryType = .disclosureIndicator
                
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "2"
                
            } else if (indexPath.row == 21) {
                cell.lbl_title.text = "Ortho Practice Video 1"
                cell.accessoryType = .disclosureIndicator
                
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "3"
                
            } else if (indexPath.row == 22) {
                cell.lbl_title.text = "Ortho Practice Video 2"
                cell.accessoryType = .disclosureIndicator
                
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "4"
                
            } else if (indexPath.row == 23) {
                cell.lbl_title.text = "Ortho Practice Video 3"
                cell.accessoryType = .disclosureIndicator
                
                cell.lbl_index_number.isHidden = false
                cell.lbl_index_number.text = "5"
                
            }
            
            
            
            
            
            
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (self.str_profile_name == "how_the_app_works") {
            
            if (indexPath.row == 0) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = url_app_overview_video
                pushVC.str_video_header = " App overview Video"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 1) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = url_comprehensive_gait_assessment_form
                pushVC.str_video_header = " Using the Comprehensive Gait Assessment Form"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 2) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = url_quick_gait_assessment_form
                pushVC.str_video_header = " Using the Quick Gait Assessment Form"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 3) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = url_performing_gait_comparison
                pushVC.str_video_header = " Performing Gait Comparison"
                self.navigationController?.pushViewController(pushVC, animated: true)
            }
            
        } else if (self.str_profile_name == "sample_gait_videos") {
            
            if (indexPath.row == 1) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/873779837/2b915d9f8c?share=copy"
                pushVC.str_video_header = " Unilateral Below-Knee Amputee"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 2) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/871090637/5b0be9445d?share=copy"
                pushVC.str_video_header = " Unilateral Above-Knee Amputee"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 3) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/873731171/b2c57bb71a?share=copy"
                pushVC.str_video_header = " Bilateral Below-Knee Amputee"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 4) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/871093477/981df027fe?share=copy"
                pushVC.str_video_header = " Bilateral Above-Knee Amputee"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 5) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/871137164/1e47910c7a?share=copy"
                pushVC.str_video_header = " Bilateral Above & Below Knee Amputee"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 7) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/873787169/1ce01c563f?share=copy"
                pushVC.str_video_header = " Metal Double-Upright Ankle Foot Orthosis"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 8) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/873789307/5f0696f881?share=copy"
                pushVC.str_video_header = " Polypropylene Ankle Foot Orthosis"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 9) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/873789976/91acdfa71b?share=copy"
                pushVC.str_video_header = " Unilateral Carbon-fiber Ankle Foot Orthosis"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 10) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/873792956/f6c3d01f4a?share=copy"
                pushVC.str_video_header = " Bilateral Carbon-fiber Ankle Foot Orthoses"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 11) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/873791965/0506a64b37?share=copy"
                pushVC.str_video_header = " Orthotic Shoes"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 13) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/873794342/b362843309?share=copy"
                pushVC.str_video_header = " Cerebro-Vascular Accident (CVA or Stroke)"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 14) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/873796278/6298a82d21?share=copy"
                pushVC.str_video_header = " Spina Bifida"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 15) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/873797926/6af6ae8e04?share=copy"
                pushVC.str_video_header = " Cerebral Palsy (CP)"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 16) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/873796784/6b601e67d8?share=copy"
                pushVC.str_video_header = " Sensory Ataxia"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 17) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/873797885/5838c97c15?share=copy"
                pushVC.str_video_header = " Post-COVID Neuropathy"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 18) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/870337310/e89deb2566?share=copy"
                pushVC.str_video_header = " Incomplete Spinal Cord Injury (SCI)"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 19) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/873801370/1f27aafccc?share=copy"
                pushVC.str_video_header = " Cerebellar Ataxia"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 20) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/873802460/1264d26f40?share=copy"
                pushVC.str_video_header = " Traumatic Brain Injury (TBI)"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 22) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/873825179/19a23b7ac8?share=copy"
                pushVC.str_video_header = " Trendelenburg Gait"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 23) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/870368860/742641d243?share=copy"
                pushVC.str_video_header = " Rheumatoid Arthritis"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 24) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/873945316/44420d7fb7?share=copy"
                pushVC.str_video_header = " Total Hip Arthroplasty (THA)"
                self.navigationController?.pushViewController(pushVC, animated: true)
            }
            
        }  else if (self.str_profile_name == "types_of_gait") {
            
            if (indexPath.row == 0) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "types_of_gait_id") as! types_of_gait
                pushVC.str_select_gait_type = " Antalgic Gait"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 1) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "types_of_gait_id") as! types_of_gait
                pushVC.str_select_gait_type = " Apraxic Gait"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 2) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "types_of_gait_id") as! types_of_gait
                pushVC.str_select_gait_type = " Cerebellar Ataxic Gait"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 3) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "types_of_gait_id") as! types_of_gait
                pushVC.str_select_gait_type = " Choreiform Gait"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 4) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "types_of_gait_id") as! types_of_gait
                pushVC.str_select_gait_type = " Circumduction Gait"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 5) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "types_of_gait_id") as! types_of_gait
                pushVC.str_select_gait_type = " Festinating Gait"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 6) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "types_of_gait_id") as! types_of_gait
                pushVC.str_select_gait_type = " Scissors Gait"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 7) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "types_of_gait_id") as! types_of_gait
                pushVC.str_select_gait_type = " Senile Apraxic Gait"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 8) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "types_of_gait_id") as! types_of_gait
                pushVC.str_select_gait_type = " Steppage Gait"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 9) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "types_of_gait_id") as! types_of_gait
                pushVC.str_select_gait_type = " Tabetic Gait"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 10) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "types_of_gait_id") as! types_of_gait
                pushVC.str_select_gait_type = " Trendelenburg Gait"
                self.navigationController?.pushViewController(pushVC, animated: true)
            }
            
        } else if (self.str_profile_name == "comprehensive_gait_assessment") {
             let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "StartViewController")
             self.navigationController?.pushViewController(pushVC!, animated: true)
            
            
            
        } else  if (self.str_profile_name == "practice_gait_skills") {
            
            if (indexPath.row == 1) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/875093911/5201e9134f?share=copy"
                pushVC.str_video_header = " Unilateral Below Knee Amputee"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 2) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/875094781/108400d901?share=copy"
                pushVC.str_video_header = " Above-Knee Amputee – 1"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 3) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/875101976/f676b22856?share=copy"
                pushVC.str_video_header = " Above-Knee Amputee – 2"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 4) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/875096420/0203134b51?share=copy"
                pushVC.str_video_header = " Bilateral Above & Below Knee Amputee"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 5) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/875096728/d4514cfed0?share=copy"
                pushVC.str_video_header = " Hip Disarticulation Amputee"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 7) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/875098710/876b8a3d09?share=copy"
                pushVC.str_video_header = " Metal Double-Upright Ankle Foot Orthosis"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 8) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/875098987/0465872c6e?share=copy"
                pushVC.str_video_header = " Unilateral Carbon-fiber Ankle Foot Orthosis"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 9) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/875099216/8f25d5a063?share=copy"
                pushVC.str_video_header = " Bilateral Carbon-fiber Ankle Foot Orthoses"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 10) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/875100078/d891ef7713?share=copy"
                pushVC.str_video_header = " Orthotics Practice Video 1"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 11) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/875100479/741fba70aa?share=copy"
                pushVC.str_video_header = " Orthotics Practice Video 2"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 13) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/875102490/e8c6128b3a?share=copy"
                pushVC.str_video_header = " Cerebro-Vascular Accident (CVA)"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 14) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/875104728/fa8a280dd1?share=copy"
                pushVC.str_video_header = " Guillian Barre"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 15) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/875103203/5ef153e1fc?share=copy"
                pushVC.str_video_header = " Cerebral Palsy (CP)"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 16) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/875104216/f8140e746f?share=copy"
                pushVC.str_video_header = " Neuro Practice Video 1 (Foot Slap)"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 17) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/875112733/ac49436a7d?share=copy"
                pushVC.str_video_header = " Neuro Practice Video 2 (Shuffling Gait)"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 19) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/875117961/d67461f3b2?share=copy"
                pushVC.str_video_header = " Polio"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 20) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/875118151/8ccbd33898?share=copy"
                pushVC.str_video_header = " Severe Osteoarthritis"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 21) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/875117307/169ce53fad?share=copy"
                pushVC.str_video_header = " Ortho Practice Video 1"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 22) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/875119189/b6db40d6bc?share=copy"
                pushVC.str_video_header = " Ortho Practice Video 2"
                self.navigationController?.pushViewController(pushVC, animated: true)
            } else if (indexPath.row == 23) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/875118953/351f056c86?share=copy"
                pushVC.str_video_header = " Ortho Practice Video 3"
                self.navigationController?.pushViewController(pushVC, animated: true)
            }
            
            
            
            
            
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}


class how_the_app_works_table_cell: UITableViewCell {

    @IBOutlet weak var lbl_index_number:UILabel! {
        didSet {
            lbl_index_number.textColor = .black
            lbl_index_number.clipsToBounds = true
            lbl_index_number.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var lbl_title:UILabel!
  
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
