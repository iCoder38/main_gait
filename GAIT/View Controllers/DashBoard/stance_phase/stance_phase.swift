//
//  SwingViewController.swift
//  GAIT
//
//  Created by Shyam on 05/11/20.
//  Copyright © 2020 EVS. All rights reserved.
//

import UIKit
/*
var selected_stance_phase = NSMutableDictionary.init()

/*
 {
     ankle = " Contralateral Vaulting";
     foot = " Foot / Toe Drag";
     hip = " Insufficient Flexion";
     knee = " Insufficient Flexion";
     pelvis = "";
     trunk = " Forward Lean\n Backward Lean";
 }
 */
class stance_phase: BaseViewController {
    
    @IBOutlet weak var tblView: UITableView!{
        didSet{
            tblView.delegate = self
            tblView.dataSource = self
            tblView.sectionHeaderHeight = 50
            tblView.allowsMultipleSelection = true
        }
    }
    
    
    lazy var swingListData: [SectionData] = {
        let section1 = SectionData(title: "Foot Deviations 2.0",
                                   data: RowData.init(title: " Foot / Toe Drag"))
        
        let section2 = SectionData(title: "Ankle Deviations",
                                   data: RowData.init(title: " Excessive Plantarflexion"),
                                   RowData.init(title: " Contralateral Vaulting"))
        
        let section3 = SectionData(title: "Knee Deviations",
                                   data: RowData.init(title: " Insufficient Flexion"),
                                   RowData.init(title: " Excessive Flexion (Steppage Gait)"),
                                   RowData.init(title: " Insufficient Extension"),
                                   RowData.init(title: " Forceful Extension"))
        
        let section4 = SectionData(title: "Hip Deviations",
                                   data: RowData.init(title: " Insufficient Flexion"),
                                   RowData.init(title: " Circumduction"),
                                   RowData.init(title: " Thigh Retraction"))
        
        let section5 = SectionData(title: "Pelvis Deviations",
                                   data: RowData.init(title: " Pelvic Hiking"),
                                   RowData.init(title: " Insufficient Forward Rotation"),
                                   RowData.init(title: " Excessive Forward Rotation"))
        
        let section6 = SectionData(title: "Trunk Deviations",
                                   data: RowData.init(title: " Forward Lean"),
                                   RowData.init(title: " Backward Lean"),
                                   RowData.init(title: " Right Lean"),
                                   RowData.init(title: " Left Lean"))
        return [section1, section2, section3, section4, section5, section6]
    }()
    
    var selectedSection : [Int] = [0,1,2,3,4,5]
    
    //MARK: - Life Cycle Func -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpNavigationWithBack(titleStr: navigationTitle.stance_phase)
    }
    
    //MARK: - Helper
    
    func isValid()-> Bool{
        for section in selectedSection{
            switch  section{
            case 0:
                validationString.selectFootOption.showAsToast()
            case 1:
                validationString.selectAnkleOption.showAsToast()
            case 2:
                validationString.selectKneeOption.showAsToast()
            case 3:
                validationString.selectHipOption.showAsToast()
            case 4:
                validationString.selectPelvisOption.showAsToast()
            case 5:
                validationString.selectTrunkOption.showAsToast()
            default:
                return true
            }
            return false
        }
        return true
    }
    
    func saveSalectedData(){
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
    }
    
    //MARK: - IBAtions
    
    @IBAction func tapSaveContinueBtn(_ sender : UIButton){
        //if isValid(){
            self.saveSalectedData()
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "AdditionalViewController") as! AdditionalViewController
            self.navigationController?.pushViewController(pushVC, animated: true)
        //}
    }
}

extension stance_phase: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return swingListData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return swingListData[section].numberOfItems
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return swingListData[section].title
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tblCell = tableView.dequeueReusableCell(withIdentifier: "MultipleSelectionTblCell", for: indexPath) as! MultipleSelectionTblCell
        tblCell.lblTitleName.text = swingListData[indexPath.section].data[indexPath.row].rowTitle
        tblCell.btnSelect.isSelected = swingListData[indexPath.section].data[indexPath.row].isSelected
        
        if tblCell.lblTitleName.text == " Foot / Toe Drag" {
            
            tblCell.btn_info.tag = 1
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Excessive Plantarflexion" {
            
            tblCell.btn_info.tag = 2
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Contralateral Vaulting" {
            
            tblCell.btn_info.tag = 3
            tblCell.btn_info.isHidden = false
            
        }
        
        
        else if tblCell.lblTitleName.text == " Insufficient Flexion" {
            
            tblCell.btn_info.tag = 4
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Excessive Flexion (Steppage Gait)" {
            
            tblCell.btn_info.tag = 5
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Insufficient Extension" {
            
            tblCell.btn_info.tag = 6
            tblCell.btn_info.isHidden = false
            
        }
        
        else if tblCell.lblTitleName.text == " Forceful Extension" {
            
            tblCell.btn_info.tag = 7
            tblCell.btn_info.isHidden = false
            
        }
        
        else if tblCell.lblTitleName.text == " Insufficient Flexion" {
            
            tblCell.btn_info.tag = 8
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Circumduction" {
            
            tblCell.btn_info.tag = 9
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Thigh Retraction" {
            
            tblCell.btn_info.tag = 10
            tblCell.btn_info.isHidden = false
            
        }
        
        
        else if tblCell.lblTitleName.text == " Pelvic Hiking" {
            
            tblCell.btn_info.tag = 11
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Insufficient Forward Rotation" {
            
            tblCell.btn_info.tag = 12
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Excessive Forward Rotation" {
            
            tblCell.btn_info.tag = 13
            tblCell.btn_info.isHidden = false
            
        }
        
        else if tblCell.lblTitleName.text == " Forward Lean" {
            
            tblCell.btn_info.tag = 14
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Backward Lean" {
            
            tblCell.btn_info.tag = 15
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Right Lean" {
            
            tblCell.btn_info.tag = 16
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Left Lean" {
            
            tblCell.btn_info.tag = 17
            tblCell.btn_info.isHidden = false
            
        }
        tblCell.btn_info.addTarget(self, action: #selector(click_one_method), for:  .touchUpInside)
        
        return tblCell
    }
    
    @objc func click_one_method(_ sender:UIButton) {
        print("===> one <===")
        
        if sender.tag == 1 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747374932/04f26bb450"
            pushVC.str_video_header = " Foot / Toe Drag"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        } else if sender.tag == 2 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747434119/a6465c8fc3"
            pushVC.str_video_header = " Excessive Plantarflexion"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        } else if sender.tag == 3 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747434071/dd0ae3e989"
            pushVC.str_video_header = " Contralateral Vaulting"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
        
        /*
         RowData.init(title: " Insufficient Flexion"),
         RowData.init(title: " Steppage Gait"),
         RowData.init(title: " Extension Thrust"))
         */
        else if sender.tag == 4 {
           
           let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
           pushVC.str_video_link = "https://vimeo.com/747448922/464b0f3e53"
           pushVC.str_video_header = " Insufficient Flexion"
           self.navigationController?.pushViewController(pushVC, animated: true)
           
       }
       
        else if sender.tag == 5 {
           
           let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
           pushVC.str_video_link = "https://vimeo.com/747448977/125cfae803"
           pushVC.str_video_header = " Excessive Flexion (Steppage Gait)"
           self.navigationController?.pushViewController(pushVC, animated: true)
           
       }
        else if sender.tag == 6 {
           
           let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
           pushVC.str_video_link = "https://vimeo.com/747449440/ef2725a1f7"
           pushVC.str_video_header = " Insufficient Extension"
           self.navigationController?.pushViewController(pushVC, animated: true)
           
       }
        else if sender.tag == 7 {
           
           let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
           pushVC.str_video_link = "https://vimeo.com/747448880/d2a7d70449"
           pushVC.str_video_header = " Forceful Extension"
           self.navigationController?.pushViewController(pushVC, animated: true)
           
       }
      
        else if sender.tag == 8 {
           
           let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
           pushVC.str_video_link = "https://vimeo.com/747881419/34c158d7f7"
           pushVC.str_video_header = " Insufficient Flexion"
           self.navigationController?.pushViewController(pushVC, animated: true)
           
       }
        else if sender.tag == 9 {
           
           let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
           pushVC.str_video_link = "https://vimeo.com/747881363/e7fbf592be"
           pushVC.str_video_header = " Circumduction"
           self.navigationController?.pushViewController(pushVC, animated: true)
           
       }
        else if sender.tag == 10 {
           
           let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
           pushVC.str_video_link = "https://vimeo.com/747881456/d9b5fec192"
           pushVC.str_video_header = " Thigh Retraction"
           self.navigationController?.pushViewController(pushVC, animated: true)
           
       }
        
        /*
        RowData.init(title: " Pelvic Hiking"),
        RowData.init(title: " Ipsilateral Drop"))
        */
        else if sender.tag == 11 {
           
           let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
           pushVC.str_video_link = "https://vimeo.com/747882873/83cc264959"
           pushVC.str_video_header = " Pelvic Hiking"
           self.navigationController?.pushViewController(pushVC, animated: true)
           
       }
        else if sender.tag == 12 {
           
           let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
           pushVC.str_video_link = "https://vimeo.com/747882839/905f4c46bc"
           pushVC.str_video_header = " Insufficient Forward Rotation"
           self.navigationController?.pushViewController(pushVC, animated: true)
           
       }
        else if sender.tag == 13 {
           
           let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
           pushVC.str_video_link = "https://vimeo.com/747882796/aac3322946"
           pushVC.str_video_header = " Excessive Forward Rotation"
           self.navigationController?.pushViewController(pushVC, animated: true)
           
       }
        /*
         RowData.init(title: " Forward Lean"),
         RowData.init(title: " Backward Lean"),
         RowData.init(title: " Right Lean"),
         RowData.init(title: " Left Lean")
         */
        else if sender.tag == 14 {
           
           let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
           pushVC.str_video_link = "https://vimeo.com/749001847/35ceb6dec8"
           pushVC.str_video_header = " Forward Lean"
           self.navigationController?.pushViewController(pushVC, animated: true)
           
       }
        else if sender.tag == 15 {
           
           let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
           pushVC.str_video_link = "https://vimeo.com/749001829/e345d27e8c"
           pushVC.str_video_header = " Backward Lean"
           self.navigationController?.pushViewController(pushVC, animated: true)
           
       }
        else if sender.tag == 16 {
           
           let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
           pushVC.str_video_link = "https://vimeo.com/749001906/a8c67f0023"
           pushVC.str_video_header = " Right Lean"
           self.navigationController?.pushViewController(pushVC, animated: true)
           
       }
        else if sender.tag == 17 {
           
           let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
           pushVC.str_video_link = "https://vimeo.com/749001871/26bbe65cda"
           pushVC.str_video_header = " Left Lean"
           self.navigationController?.pushViewController(pushVC, animated: true)
           
       }
        
    }
    
     
    
}

extension stance_phase: UITableViewDelegate{
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let headerView = view as? UITableViewHeaderFooterView else { return }
        headerView.tintColor = .appOrangColors()
        headerView.textLabel?.textColor = .white
        headerView.textLabel?.textAlignment = .center
        headerView.textLabel?.font = UIFont(name: "Arial Bold", size: 18)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selected = self.tblView.indexPathsForSelectedRows
        selected = selected?.sorted()
        //print(selected!, "index = ",  indexPath.row , "Section", indexPath.section)
        if selectedSection.contains(where: {$0 == indexPath.section}){
            selectedSection.removeAll(where: {$0 == indexPath.section})
        }
    }
    
    func tableView( _ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        //let selected = self.tblView.indexPathsForSelectedRows
        //print("index = ",  indexPath.row , "Section", indexPath.section)
        if selectedSection.contains(where: {$0 == indexPath.section}) == false{
            selectedSection.append(indexPath.section)
        }
    }
    
}
*/
import UIKit
 
var selected_stance_phase = NSMutableDictionary.init()

class stance_phase: UIViewController {

    var ankle_index = 1
    var pelvis_index = 2
    var trunk_index = 3
    
    @IBOutlet weak var tble_view:UITableView!
    
    var arr_mut_would_like_to:NSMutableArray! = []
    
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
        
    }
    
    @objc func backClickMethod() {
        self.navigationController?.popViewController(animated: true)
    }

    @objc func fareFootClickMethod() {
         let indexPath = IndexPath.init(row: 0, section: 0)
         let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        
        print(cell.btn_foot_farefoot.tag as Any)
        
        if (cell.btn_foot_farefoot.tag == 10) {
            
            cell.btn_foot_farefoot.setImage(UIImage(named: "check_icon"), for: .normal)
            
            cell.btn_foot_farefoot.tag = 11
        } else {
            cell.btn_foot_farefoot.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            cell.btn_foot_farefoot.tag = 10
        }
        
    }
    
    @objc func footFlatClickMethod() {
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        
        print(cell.btn_foot_footFlat.tag as Any)
        if (cell.btn_foot_footFlat.tag == 20) {
            
            cell.btn_foot_footFlat.setImage(UIImage(named: "check_icon"), for: .normal)
            
            cell.btn_foot_footFlat.tag = 21
        } else {
            cell.btn_foot_footFlat.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            cell.btn_foot_footFlat.tag = 20
        }
    }
    
    @objc func footSlapClickMethod() {
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        
        print(cell.btn_foot_footSlap.tag as Any)
        if (cell.btn_foot_footSlap.tag == 30) {
            
            cell.btn_foot_footSlap.setImage(UIImage(named: "check_icon"), for: .normal)
            
            cell.btn_foot_footSlap.tag = 31
        } else {
            cell.btn_foot_footSlap.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            cell.btn_foot_footSlap.tag = 30
        }
    }
    
    @objc func earlyHeelRiseClickMethod() {
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        
        print(cell.btn_foot_earlyHeelRise.tag as Any)
        if (cell.btn_foot_earlyHeelRise.tag == 40) {
            
            cell.btn_foot_earlyHeelRise.setImage(UIImage(named: "check_icon"), for: .normal)
            
            cell.btn_foot_earlyHeelRise.tag = 41
        } else {
            cell.btn_foot_earlyHeelRise.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            cell.btn_foot_earlyHeelRise.tag = 40
        }
    }
    
    @objc func delayedHeelRiseClickMethod() {
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        
        print(cell.btn_foot_delayedHeelRise.tag as Any)
        if (cell.btn_foot_delayedHeelRise.tag == 50) {
            
            cell.btn_foot_delayedHeelRise.setImage(UIImage(named: "check_icon"), for: .normal)
            
            cell.btn_foot_delayedHeelRise.tag = 51
        } else {
            cell.btn_foot_delayedHeelRise.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            cell.btn_foot_delayedHeelRise.tag = 50
        }
    }
    
    // pelvis
    @objc func insufficientForwardClickMethod() {
        let indexPath = IndexPath.init(row: pelvis_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        
        print(cell.btn_pelvis_insufficient_forward.tag as Any)
        if (cell.btn_pelvis_insufficient_forward.tag == 60) {
            
            cell.btn_pelvis_insufficient_forward.setImage(UIImage(named: "check_icon"), for: .normal)
            
            cell.btn_pelvis_insufficient_forward.tag = 61
        } else {
            cell.btn_pelvis_insufficient_forward.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            cell.btn_pelvis_insufficient_forward.tag = 60
        }
    }
    
    @objc func excessive_forward_ClickMethod() {
        let indexPath = IndexPath.init(row: pelvis_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        
        print(cell.btn_pelvis_excessive_forward.tag as Any)
        if (cell.btn_pelvis_excessive_forward.tag == 70) {
            
            cell.btn_pelvis_excessive_forward.setImage(UIImage(named: "check_icon"), for: .normal)
            
            cell.btn_pelvis_excessive_forward.tag = 71
        } else {
            cell.btn_pelvis_excessive_forward.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            cell.btn_pelvis_excessive_forward.tag = 70
        }
    }
    
    @objc func insufficient_backward_ClickMethod() {
        let indexPath = IndexPath.init(row: pelvis_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        
        print(cell.btn_pelvis_insufficient_backward.tag as Any)
        if (cell.btn_pelvis_insufficient_backward.tag == 80) {
            
            cell.btn_pelvis_insufficient_backward.setImage(UIImage(named: "check_icon"), for: .normal)
            
            cell.btn_pelvis_insufficient_backward.tag = 81
        } else {
            cell.btn_pelvis_insufficient_backward.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            cell.btn_pelvis_insufficient_backward.tag = 80
        }
    }
    
    @objc func excessive_backward_ClickMethod() {
        let indexPath = IndexPath.init(row: pelvis_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        
        print(cell.btn_pelvis_excessive_backward.tag as Any)
        if (cell.btn_pelvis_excessive_backward.tag == 90) {
            
            cell.btn_pelvis_excessive_backward.setImage(UIImage(named: "check_icon"), for: .normal)
            
            cell.btn_pelvis_excessive_backward.tag = 91
        } else {
            cell.btn_pelvis_excessive_backward.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            cell.btn_pelvis_excessive_backward.tag = 90
        }
    }
    
    @objc func contralateral_dropClickMethod() {
        let indexPath = IndexPath.init(row: pelvis_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        
        print(cell.btn_pelvis_contralateral_drop.tag as Any)
        if (cell.btn_pelvis_contralateral_drop.tag == 100) {
            
            cell.btn_pelvis_contralateral_drop.setImage(UIImage(named: "check_icon"), for: .normal)
            
            cell.btn_pelvis_contralateral_drop.tag = 101
        } else {
            cell.btn_pelvis_contralateral_drop.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            cell.btn_pelvis_contralateral_drop.tag = 100
        }
    }
    
    @objc func excessive_anteriorClickMethod() {
        let indexPath = IndexPath.init(row: pelvis_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        
        print(cell.btn_pelvis_excessive_anterior.tag as Any)
        if (cell.btn_pelvis_excessive_anterior.tag == 110) {
            
            cell.btn_pelvis_excessive_anterior.setImage(UIImage(named: "check_icon"), for: .normal)
            
            cell.btn_pelvis_excessive_anterior.tag = 111
        } else {
            cell.btn_pelvis_excessive_anterior.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            cell.btn_pelvis_excessive_anterior.tag = 110
        }
    }
    
    @objc func restricted_pelvicClickMethod() {
        let indexPath = IndexPath.init(row: pelvis_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        
        print(cell.btn_pelvis_restricted_pelvic.tag as Any)
        if (cell.btn_pelvis_restricted_pelvic.tag == 120) {
            
            cell.btn_pelvis_restricted_pelvic.setImage(UIImage(named: "check_icon"), for: .normal)
            
            cell.btn_pelvis_restricted_pelvic.tag = 121
        } else {
            cell.btn_pelvis_restricted_pelvic.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            cell.btn_pelvis_restricted_pelvic.tag = 120
        }
    }
    
    /*
     cell.btn_trunk_forward.addTarget(self, action: #selector(trunk_forward_ClickMethod), for: .touchUpInside)
     cell.btn_trunk_backward.addTarget(self, action: #selector(trunk_backward_ClickMethod), for: .touchUpInside)
     cell.btn_trunk_right.addTarget(self, action: #selector(trunk_right_ClickMethod), for: .touchUpInside)
     cell.btn_trunk_left.addTarget(self, action: #selector(trunk_left_ClickMethod), for: .touchUpInside)
     cell.btn_trunk_restricted.addTarget(self, action: #selector(trunk_restricted_ClickMethod), for: .touchUpInside)
     */
    @objc func trunk_forward_ClickMethod() {
        let indexPath = IndexPath.init(row: trunk_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        
        print(cell.btn_trunk_forward.tag as Any)
        if (cell.btn_trunk_forward.tag == 130) {
            
            cell.btn_trunk_forward.setImage(UIImage(named: "check_icon"), for: .normal)
            
            cell.btn_trunk_forward.tag = 131
        } else {
            cell.btn_trunk_forward.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            cell.btn_trunk_forward.tag = 130
        }
    }
    
    @objc func trunk_backward_ClickMethod() {
        let indexPath = IndexPath.init(row: trunk_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        
        print(cell.btn_trunk_backward.tag as Any)
        if (cell.btn_trunk_backward.tag == 140) {
            
            cell.btn_trunk_backward.setImage(UIImage(named: "check_icon"), for: .normal)
            
            cell.btn_trunk_backward.tag = 141
        } else {
            cell.btn_trunk_backward.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            cell.btn_trunk_backward.tag = 140
        }
    }
    
    @objc func trunk_right_ClickMethod() {
        let indexPath = IndexPath.init(row: trunk_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        
        print(cell.btn_trunk_right.tag as Any)
        if (cell.btn_trunk_right.tag == 150) {
            
            cell.btn_trunk_right.setImage(UIImage(named: "check_icon"), for: .normal)
            
            cell.btn_trunk_right.tag = 151
        } else {
            cell.btn_trunk_right.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            cell.btn_trunk_right.tag = 150
        }
    }
    
    @objc func trunk_left_ClickMethod() {
        let indexPath = IndexPath.init(row: trunk_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        
        print(cell.btn_trunk_left.tag as Any)
        if (cell.btn_trunk_left.tag == 160) {
            
            cell.btn_trunk_left.setImage(UIImage(named: "check_icon"), for: .normal)
            
            cell.btn_trunk_left.tag = 161
        } else {
            cell.btn_trunk_left.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            cell.btn_trunk_left.tag = 160
        }
    }
    
    @objc func trunk_restricted_ClickMethod() {
        let indexPath = IndexPath.init(row: trunk_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        
        print(cell.btn_trunk_restricted.tag as Any)
        if (cell.btn_trunk_restricted.tag == 170) {
            
            cell.btn_trunk_restricted.setImage(UIImage(named: "check_icon"), for: .normal)
            
            cell.btn_trunk_restricted.tag = 171
        } else {
            cell.btn_trunk_restricted.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            cell.btn_trunk_restricted.tag = 170
        }
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
    
    @objc func ankle_excessive_plant_clicked_method() {
        let indexPath = IndexPath.init(row: ankle_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        
        print(cell.btn_ankle_excessive_plant.tag as Any)
        if (cell.btn_ankle_excessive_plant.tag == 180) {
            
            cell.btn_ankle_excessive_plant.setImage(UIImage(named: "check_icon"), for: .normal)
            
            cell.btn_ankle_excessive_plant.tag = 181
        } else {
            cell.btn_ankle_excessive_plant.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            cell.btn_ankle_excessive_plant.tag = 180
        }
    }
    
    @objc func ankle_insufficient_plant_clicked_method() {
        let indexPath = IndexPath.init(row: ankle_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        
        print(cell.btn_ankle_insufficient_plant.tag as Any)
        if (cell.btn_ankle_insufficient_plant.tag == 190) {
            
            cell.btn_ankle_insufficient_plant.setImage(UIImage(named: "check_icon"), for: .normal)
            
            cell.btn_ankle_insufficient_plant.tag = 191
        } else {
            cell.btn_ankle_insufficient_plant.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            cell.btn_ankle_insufficient_plant.tag = 190
        }
    }
    
    @objc func ankle_excessive_dorsirflexion_clicked_method() {
        let indexPath = IndexPath.init(row: ankle_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        
        print(cell.btn_ankle_excessive_dorsirflexion.tag as Any)
        if (cell.btn_ankle_excessive_dorsirflexion.tag == 200) {
            
            cell.btn_ankle_excessive_dorsirflexion.setImage(UIImage(named: "check_icon"), for: .normal)
            
            cell.btn_ankle_excessive_dorsirflexion.tag = 201
        } else {
            cell.btn_ankle_excessive_dorsirflexion.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            cell.btn_ankle_excessive_dorsirflexion.tag = 200
        }
    }
    
    @objc func ankle_insufficient_dorsirflextion_clicked_method() {
        let indexPath = IndexPath.init(row: ankle_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        
        print(cell.btn_ankle_insufficient_dorsirflextion.tag as Any)
        if (cell.btn_ankle_insufficient_dorsirflextion.tag == 210) {
            
            cell.btn_ankle_insufficient_dorsirflextion.setImage(UIImage(named: "check_icon"), for: .normal)
            
            cell.btn_ankle_insufficient_dorsirflextion.tag = 211
        } else {
            cell.btn_ankle_insufficient_dorsirflextion.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            cell.btn_ankle_insufficient_dorsirflextion.tag = 210
        }
    }
    
    @objc func ankle_inversion_main_clicked_method() {
        let indexPath = IndexPath.init(row: ankle_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        
        print(cell.btn_inversion_main.tag as Any)
        if (cell.btn_inversion_main.tag == 220) {
            
            cell.btn_inversion_main.setImage(UIImage(named: "check_icon"), for: .normal)
            
            cell.btn_inversion_main.tag = 221
        } else {
            cell.btn_inversion_main.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            // SUB TYPE ALSO DE-SELECT
            cell.btn_inversion_main_Slight.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            cell.btn_inversion_main_Moderate.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            cell.btn_inversion_main_Excessive.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            cell.btn_inversion_main_Slight.tag = 230
            cell.btn_inversion_main_Moderate.tag = 240
            cell.btn_inversion_main_Excessive.tag = 250
            
            cell.btn_inversion_main.tag = 220
        }
    }
    
    @objc func ankle_inversion_main_Slight_clicked_method() {
        let indexPath = IndexPath.init(row: ankle_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        
        if (cell.btn_inversion_main.tag == 221) {
            
            print(cell.btn_inversion_main_Slight.tag as Any)
            if (cell.btn_inversion_main_Slight.tag == 230) {
                
                cell.btn_inversion_main_Slight.setImage(UIImage(named: "check_icon"), for: .normal)
                
                cell.btn_inversion_main_Slight.tag = 231
            } else {
                cell.btn_inversion_main_Slight.setImage(UIImage(named: "uncheck_icon"), for: .normal)
                
                cell.btn_inversion_main_Slight.tag = 230
            }
        } else {
            print("YOU HAVE TO SELECT INVERSION")
        }
        
        
    }
    
    @objc func ankle_inversion_main_Moderate_clicked_method() {
        let indexPath = IndexPath.init(row: ankle_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        
        if (cell.btn_inversion_main.tag == 221) {
        print(cell.btn_inversion_main_Moderate.tag as Any)
        if (cell.btn_inversion_main_Moderate.tag == 240) {
            
            cell.btn_inversion_main_Moderate.setImage(UIImage(named: "check_icon"), for: .normal)
            
            cell.btn_inversion_main_Moderate.tag = 241
        } else {
            cell.btn_inversion_main_Moderate.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            cell.btn_inversion_main_Moderate.tag = 240
        }
        } else {
            print("YOU HAVE TO SELECT INVERSION")
        }
    }
    
    @objc func ankle_inversion_main_Excessive_clicked_method() {
        let indexPath = IndexPath.init(row: ankle_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        
        if (cell.btn_inversion_main.tag == 221) {
            print(cell.btn_inversion_main_Excessive.tag as Any)
            if (cell.btn_inversion_main_Excessive.tag == 250) {
                
                cell.btn_inversion_main_Excessive.setImage(UIImage(named: "check_icon"), for: .normal)
                
                cell.btn_inversion_main_Excessive.tag = 251
            } else {
                cell.btn_inversion_main_Excessive.setImage(UIImage(named: "uncheck_icon"), for: .normal)
                
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
        
        print(cell.btn_ankle_stiff.tag as Any)
        if (cell.btn_ankle_stiff.tag == 300) {
            
            cell.btn_ankle_stiff.setImage(UIImage(named: "check_icon"), for: .normal)
            
            cell.btn_ankle_stiff.tag = 301
        } else {
            cell.btn_ankle_stiff.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            cell.btn_ankle_stiff.tag = 300
        }
    }
     
    @objc func ankle_unstable_clicked_method() {
        let indexPath = IndexPath.init(row: ankle_index, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! stance_phase_table_cell
        
        print(cell.btn_ankle_unstable.tag as Any)
        if (cell.btn_ankle_unstable.tag == 310) {
            
            cell.btn_ankle_unstable.setImage(UIImage(named: "check_icon"), for: .normal)
            
            cell.btn_ankle_unstable.tag = 311
        } else {
            cell.btn_ankle_unstable.setImage(UIImage(named: "uncheck_icon"), for: .normal)
            
            cell.btn_ankle_unstable.tag = 310
        }
    }
    
 
    
    
   
}


extension stance_phase:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
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
            
        } else if (indexPath.row == 2) {
            
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
            
        } else if (indexPath.row == 3) {
            
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
        if (indexPath.row == 0 || indexPath.row == 3 ) {
            return 250
        } else if (indexPath.row == 2) {
            return 364
        } else if (indexPath.row == 1) {
            return 568
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
    
}
