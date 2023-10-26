//
//  SLSViewController.swift
//  GAIT
//
//  Created by Shyam on 05/11/20.
//  Copyright © 2020 EVS. All rights reserved.
//

import UIKit

var selectedSLSData = NSMutableDictionary.init()

class SLSViewController: BaseViewController {
    
    @IBOutlet weak var tblView: UITableView!{
        didSet{
            tblView.delegate = self
            tblView.dataSource = self
            tblView.sectionHeaderHeight = 50
            tblView.allowsMultipleSelection = true
        }
    }
    
    lazy var slsListData: [SectionData] = {
        let section1 = SectionData(title: "Foot Deviations",
                                   data: RowData.init(title: " Early Heel Rise"),
                                   RowData.init(title: " Delayed Heel Rise"))
        
        let section2 = SectionData(title: "Ankle Deviations",
                                   data: RowData.init(title: " Excessive Plantarflexion"),
                                   RowData.init(title: " Excessive Dorsiflexion"),
                                   RowData.init(title: " Insufficient Dorsiflexion"),
                                   RowData.init(title: " Excessive Inversion"),
                                   RowData.init(title: " Excessive Eversion"))
        
        let section3 = SectionData(title: "Knee Deviations",
                                   data: RowData.init(title: " Excessive Flexion"),
                                   RowData.init(title: " Hyperextension"),
                                   RowData.init(title: " Excessive Varus"),
                                   RowData.init(title: " Excessive Valgus"),
                                   RowData.init(title: " Unstable Knee"))
        
        let section4 = SectionData(title: "Hip Deviations",
                                   data://RowData.init(title: " Excessive Extension"),
                                   RowData.init(title: " Insufficient Extension"),
                                   RowData.init(title: " Excessive Internal Rotation"),
                                   RowData.init(title: " Excessive External Rotation"),
                                   RowData.init(title: " Excessive Abduction"),
                                   RowData.init(title: " Excessive Adduction"))
        
        let section5 = SectionData(title: "Pelvis Deviations",
                                   data: RowData.init(title: " Insufficient Backward Rotation"),
                                   RowData.init(title: " Excessive Backward Rotation"),
                                   RowData.init(title: " Excessive Anterior Tilt"),
                                   RowData.init(title: " Contralateral Drop"))
        
        let section6 = SectionData(title: "Trunk Deviations",
                                   data: RowData.init(title: " Forward Lean"),
                                   RowData.init(title: " Backward Lean"),
                                   RowData.init(title: " Right Lean"),
                                   RowData.init(title: " Left Lean"))
        return [section1, section2, section3, section4, section5, section6]
    }()
    
    var selectedSection : [Int] = [0,1,2,3,4,5]
    
    //MARK: - Life Cycle Func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpNavigationWithBack(titleStr: navigationTitle.sls)
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
                    let selectedStr = slsListData[data.section].data[data.row].rowTitle
                    footArr.append(selectedStr)
                case 1:
                    let selectedStr = slsListData[data.section].data[data.row].rowTitle
                    ankleArr.append(selectedStr)
                case 2:
                    let selectedStr = slsListData[data.section].data[data.row].rowTitle
                    kneeArr.append(selectedStr)
                case 3:
                    let selectedStr = slsListData[data.section].data[data.row].rowTitle
                    hipArr.append(selectedStr)
                case 4:
                    let selectedStr = slsListData[data.section].data[data.row].rowTitle
                    pelvisArr.append(selectedStr)
                case 5:
                    let selectedStr = slsListData[data.section].data[data.row].rowTitle
                    trunkArr.append(selectedStr)
                default:
                    break
                }
            }
            
            selectedSLSData.setObject(footArr.joined(separator:"\n"), forKey: "foot" as NSCopying)
            selectedSLSData.setObject(ankleArr.joined(separator:"\n"), forKey: "ankle" as NSCopying)
            selectedSLSData.setObject(kneeArr.joined(separator:"\n"), forKey: "knee" as NSCopying)
            selectedSLSData.setObject(hipArr.joined(separator:"\n"), forKey: "hip" as NSCopying)
            selectedSLSData.setObject(pelvisArr.joined(separator:"\n"), forKey: "pelvis" as NSCopying)
            selectedSLSData.setObject(trunkArr.joined(separator:"\n"), forKey: "trunk" as NSCopying)
            //print(selectedSLSData)
        }
    }
    
    //MARL: - IBAtions
    
    @IBAction func tapSaveContinueBtn(_ sender : UIButton){
        //if isValid(){
            self.saveSalectedData()
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "TDSViewController") as! TDSViewController
            self.navigationController?.pushViewController(pushVC, animated: true)
        //}
    }
}

extension SLSViewController : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return slsListData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return slsListData[section].numberOfItems
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return slsListData[section].title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tblCell = tableView.dequeueReusableCell(withIdentifier: "MultipleSelectionTblCell", for: indexPath) as! MultipleSelectionTblCell
        tblCell.lblTitleName.text = slsListData[indexPath.section].data[indexPath.row].rowTitle
        tblCell.btnSelect.isSelected = slsListData[indexPath.section].data[indexPath.row].isSelected
        
        
        if tblCell.lblTitleName.text == " Early Heel Rise" {
            
            tblCell.btn_info.tag = 1
            tblCell.btn_info.isHidden = false
            
        } else if tblCell.lblTitleName.text == " Delayed Heel Rise" {
            
            tblCell.btn_info.tag = 2
            tblCell.btn_info.isHidden = false
            
        }
        
        else if tblCell.lblTitleName.text == " Excessive Plantarflexion" {
            
            tblCell.btn_info.tag = 3
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Excessive Dorsiflexion" {
            
            tblCell.btn_info.tag = 4
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Insufficient Dorsiflexion" {
            
            tblCell.btn_info.tag = 5
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Excessive Inversion" {
            
            tblCell.btn_info.tag = 6
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Excessive Eversion" {
            
            tblCell.btn_info.tag = 7
            tblCell.btn_info.isHidden = false
            
        }
        
        
        else if tblCell.lblTitleName.text == " Excessive Flexion" {
            
            tblCell.btn_info.tag = 8
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Hyperextension" {
            
            tblCell.btn_info.tag = 9
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Excessive Varus" {
            
            tblCell.btn_info.tag = 10
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Excessive Valgus" {
            
            tblCell.btn_info.tag = 11
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Unstable Knee" {
            
            tblCell.btn_info.tag = 12
            tblCell.btn_info.isHidden = false
            
        }
        
        else if tblCell.lblTitleName.text == " Insufficient Extension" {
            
            tblCell.btn_info.tag = 13
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Excessive Internal Rotation" {
            
            tblCell.btn_info.tag = 14
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Excessive External Rotation" {
            
            tblCell.btn_info.tag = 15
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Excessive Abduction" {
            
            tblCell.btn_info.tag = 16
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Excessive Adduction" {
            
            tblCell.btn_info.tag = 17
            tblCell.btn_info.isHidden = false
            
        }
        
        
        else if tblCell.lblTitleName.text == " Insufficient Backward Rotation" {
            
            tblCell.btn_info.tag = 18
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Excessive Backward Rotation" {
            
            tblCell.btn_info.tag = 19
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Excessive Anterior Tilt" {
            
            tblCell.btn_info.tag = 20
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Contralateral Drop" {
            
            tblCell.btn_info.tag = 21
            tblCell.btn_info.isHidden = false
            
        }
        
        
        else if tblCell.lblTitleName.text == " Forward Lean" {
            
            tblCell.btn_info.tag = 22
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Backward Lean" {
            
            tblCell.btn_info.tag = 23
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Right Lean" {
            
            tblCell.btn_info.tag = 24
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Left Lean" {
            
            tblCell.btn_info.tag = 25
            tblCell.btn_info.isHidden = false
            
        }
        
        
        
        else {
            tblCell.btn_info.isHidden = true
        }
        
        tblCell.btn_info.addTarget(self, action: #selector(click_one_method), for:  .touchUpInside)
        
        return tblCell
    }
    
    @objc func click_one_method(_ sender:UIButton) {
        print("===> one <===")
        
        if sender.tag == 1 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747374468/ce208b21ed"
            pushVC.str_video_header = " Early Heel Rise"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        } else if sender.tag == 2 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747291247/fda8c07110"
            pushVC.str_video_header = " Delayed Heel Rise"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
        
        else if sender.tag == 3 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747433483/4432b23256"
            pushVC.str_video_header = " Excessive Plantarflexion"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
        else if sender.tag == 4 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747433348/ef5aaa7e7a"
            pushVC.str_video_header = " Excessive Dorsiflexion"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
        else if sender.tag == 5 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747433561/6fab5fd6aa"
            pushVC.str_video_header = " Insufficient Dorsiflexion"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
        else if sender.tag == 6 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747433431/978ad12182"
            pushVC.str_video_header = " Excessive Inversion"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
        else if sender.tag == 7 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747433387/2188001245"
            pushVC.str_video_header = " Excessive Eversion"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
        
        
        else if sender.tag == 8 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747448143/bf2fb3318b"
            pushVC.str_video_header = " Excessive Flexion"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
        else if sender.tag == 9 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747448203/8ea0ea1972"
            pushVC.str_video_header = " Hyperextension"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
        else if sender.tag == 10 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747448430/71e8deccca"
            pushVC.str_video_header = " Excessive Varus"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
        else if sender.tag == 11 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747448295/a93d65681a"
            pushVC.str_video_header = " Excessive Valgus"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
        else if sender.tag == 12 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747448456/20f7e9df84"
            pushVC.str_video_header = " Unstable Knee"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
         
        
        if sender.tag == 13 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747878173/74da633580"
            pushVC.str_video_header = " Insufficient Extension"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
        else if sender.tag == 14 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747876864/c73b75fbe9"
            pushVC.str_video_header = " Excessive Internal Rotation"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
        else if sender.tag == 15 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747876824/623611b85e"
            pushVC.str_video_header = " Excessive External Rotation"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
        else if sender.tag == 16 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747876496/3dd883ecfb"
            pushVC.str_video_header = " Excessive Abduction"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
        else if sender.tag == 17 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747876785/3854d94def"
            pushVC.str_video_header = " Excessive Adduction"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
        
        /*
         RowData.init(title: " Insufficient Backward Rotation"),
         RowData.init(title: " Excessive Backward Rotation"),
         RowData.init(title: " Excessive Anterior Tilt"),
         RowData.init(title: " Contralateral Drop"))
         */
        else if sender.tag == 18 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747882358/43f7b46389"
            pushVC.str_video_header = " Insufficient Backward Rotation"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
        else if sender.tag == 19 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747882298/151cd830f3"
            pushVC.str_video_header = " Excessive Backward Rotation"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
        else if sender.tag == 20 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747882267/4d4af54ca7"
            pushVC.str_video_header = " Excessive Anterior Tilt"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
        else if sender.tag == 21 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747882442/cf0d872188"
            pushVC.str_video_header = " Contralateral Drop"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
        
        /*
         RowData.init(title: " Forward Lean"),
         RowData.init(title: " Backward Lean"),
         RowData.init(title: " Right Lean"),
         RowData.init(title: " Left Lean"))
         */
        else if sender.tag == 22 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747883140/f7696ccb4a"
            pushVC.str_video_header = " Forward Lean"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
        else if sender.tag == 23 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747883049/d465541dc3"
            pushVC.str_video_header = " Backward Lean"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
        else if sender.tag == 24 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747883233/6419e7d5ff"
            pushVC.str_video_header = " Right Lean"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
        else if sender.tag == 25 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747883186/f8652f4a45"
            pushVC.str_video_header = " Left Lean"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
        
        
    }
}

extension SLSViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let headerView = view as? UITableViewHeaderFooterView else { return }
        headerView.tintColor = .appOrangColors()
        headerView.textLabel?.textColor = .white
        headerView.textLabel?.textAlignment = .center
        headerView.textLabel?.font = UIFont(name: "Arial Bold", size: 18)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selected = self.tblView.indexPathsForSelectedRows
        //ldsListData[indexPath.section].data[indexPath.row].isSelected = (selected != nil)
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
