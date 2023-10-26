//
//  SwingViewController.swift
//  GAIT
//
//  Created by Shyam on 05/11/20.
//  Copyright © 2020 EVS. All rights reserved.
//

import UIKit

var selectedSwingData = NSMutableDictionary.init()

class SwingViewController: BaseViewController {
    
    @IBOutlet weak var tblView: UITableView!{
        didSet{
            tblView.delegate = self
            tblView.dataSource = self
            tblView.sectionHeaderHeight = 50
            tblView.allowsMultipleSelection = true
        }
    }
    
    
    lazy var swingListData: [SectionData] = {
        let section1 = SectionData(title: "Foot Deviations",
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
        self.setUpNavigationWithBack(titleStr: navigationTitle.swing)
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
            
            selectedSwingData.setObject(footArr.joined(separator:"\n"), forKey: "foot" as NSCopying)
            selectedSwingData.setObject(ankleArr.joined(separator:"\n"), forKey: "ankle" as NSCopying)
            selectedSwingData.setObject(kneeArr.joined(separator:"\n"), forKey: "knee" as NSCopying)
            selectedSwingData.setObject(hipArr.joined(separator:"\n"), forKey: "hip" as NSCopying)
            selectedSwingData.setObject(pelvisArr.joined(separator:"\n"), forKey: "pelvis" as NSCopying)
            selectedSwingData.setObject(trunkArr.joined(separator:"\n"), forKey: "trunk" as NSCopying)
            //print(selectedSwingData)
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

extension SwingViewController: UITableViewDataSource{
    
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

extension SwingViewController: UITableViewDelegate{
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
