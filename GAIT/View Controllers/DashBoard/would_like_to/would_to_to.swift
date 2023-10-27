//
//  would_to_to.swift
//  GAIT
//
//  Created by Dishant Rajput on 25/10/23.
//  Copyright © 2023 EVS. All rights reserved.
//

import UIKit

class would_to_to: UIViewController {

    @IBOutlet weak var tble_view:UITableView!
    
    var arr_mut_would_like_to:NSMutableArray! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UserDefaults.standard.set("", forKey: "key_quick_gait_assessment")

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
        
    }
    
    @objc func backClickMethod() {
        self.navigationController?.popViewController(animated: true)
    }

}


extension would_to_to:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:would_to_to_table_cell = tableView.dequeueReusableCell(withIdentifier: "would_to_to_table_cell") as! would_to_to_table_cell
        cell.backgroundColor = .white
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
        
        
        
        if (indexPath.row == 0) {
            cell.lbl_title.text = "LEARN"
            cell.backgroundColor = .systemOrange
            
            cell.lbl_index_number.isHidden = true
            
        } else if (indexPath.row == 1) {
            cell.lbl_title.text = "How the app works"
            cell.accessoryType = .disclosureIndicator
            
            cell.lbl_index_number.isHidden = false
            
            cell.lbl_index_number.text = "1"
            cell.lbl_index_number.backgroundColor = UIColor.init(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1)
            
        } else if (indexPath.row == 2) {
            cell.lbl_title.text = "Sample Gait Video"
            cell.accessoryType = .disclosureIndicator
            cell.lbl_index_number.isHidden = false
            
            cell.lbl_index_number.text = "2"
            cell.lbl_index_number.backgroundColor = UIColor.init(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1)
            
        } else if (indexPath.row == 3) {
            cell.lbl_title.text = "Types of Gait"
            cell.accessoryType = .disclosureIndicator
            cell.lbl_index_number.isHidden = false
            
            cell.lbl_index_number.text = "3"
            cell.lbl_index_number.backgroundColor = UIColor.init(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1)
            
        } else if (indexPath.row == 4) {
            cell.lbl_title.text = "PERFORM"
            cell.backgroundColor = .systemOrange
            
            cell.lbl_index_number.isHidden = true
            
            cell.lbl_index_number.text = "4"
            cell.lbl_index_number.backgroundColor = UIColor.init(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1)
            
        } else if (indexPath.row == 5) {
            cell.lbl_title.text = "Comprehensive Gait Assessment"
            cell.accessoryType = .disclosureIndicator
            cell.lbl_index_number.isHidden = false
            
            cell.lbl_index_number.text = "4"
            cell.lbl_index_number.backgroundColor = UIColor.init(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1)
            
        } else if (indexPath.row == 6) {
            
            UserDefaults.standard.set("quick_gait_assessment", forKey: "key_quick_gait_assessment")
            
            cell.lbl_title.text = "Quick Gait Assessment"
            cell.accessoryType = .disclosureIndicator
            cell.lbl_index_number.isHidden = false
            
            cell.lbl_index_number.text = "5"
            cell.lbl_index_number.backgroundColor = UIColor.init(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1)
            
        } else if (indexPath.row == 7) {
            cell.lbl_title.text = "Gait Comparison"
            cell.accessoryType = .disclosureIndicator
            cell.lbl_index_number.isHidden = false
            
            cell.lbl_index_number.text = "7"
            cell.lbl_index_number.backgroundColor = UIColor.init(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1)
            
        } else if (indexPath.row == 8) {
            cell.lbl_title.text = "PRACTICE"
            cell.backgroundColor = .systemOrange
            cell.lbl_index_number.isHidden = true
            
        } else {
            cell.lbl_title.text = "Practice Gait Skills"
            cell.accessoryType = .disclosureIndicator
            
            cell.lbl_index_number.text = "7"
            cell.lbl_index_number.backgroundColor = UIColor.init(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1)
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (indexPath.row == 1) {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "how_the_app_works_id") as? how_the_app_works
            pushVC!.str_profile_name = "how_the_app_works"
            self.navigationController?.pushViewController(pushVC!, animated: true)
            
        } else if (indexPath.row == 2) {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "how_the_app_works_id") as? how_the_app_works
            pushVC!.str_profile_name = "sample_gait_videos"
            self.navigationController?.pushViewController(pushVC!, animated: true)
            
        } else if (indexPath.row == 3) {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "how_the_app_works_id") as? how_the_app_works
            pushVC!.str_profile_name = "types_of_gait"
            self.navigationController?.pushViewController(pushVC!, animated: true)
            
        }  else if (indexPath.row == 5) {
            
            /*let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "how_the_app_works_id") as? how_the_app_works
            pushVC!.str_profile_name = "comprehensive_gait_assessment"
            self.navigationController?.pushViewController(pushVC!, animated: true)*/
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "PatientInformationViewController") as! PatientInformationViewController
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }  else if (indexPath.row == 6) {
            
            // let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "quick_gait_assessment_id") as? quick_gait_assessment
            // self.navigationController?.pushViewController(pushVC!, animated: true)
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "quick_gait_assessment_id") as! quick_gait_assessment
            self.navigationController?.pushViewController(pushVC, animated: false)
            
        }  else if (indexPath.row == 7) {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "how_the_app_works_id") as? how_the_app_works
            pushVC!.str_profile_name = "gait_comparision"
            self.navigationController?.pushViewController(pushVC!, animated: true)
            
        }
        else if (indexPath.row == 9) {
           
           let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "how_the_app_works_id") as? how_the_app_works
           pushVC!.str_profile_name = "practice_gait_skills"
           self.navigationController?.pushViewController(pushVC!, animated: true)
           
       }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}


class would_to_to_table_cell: UITableViewCell {

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
