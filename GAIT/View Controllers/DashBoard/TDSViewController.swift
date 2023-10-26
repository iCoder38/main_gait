//
//  TDSViewController.swift
//  GAIT
//
//  Created by Shyam on 05/11/20.
//  Copyright © 2020 EVS. All rights reserved.
//

import UIKit

var selectedTDSData = NSMutableDictionary.init()

class TDSViewController: BaseViewController {
    
    @IBOutlet weak var tblView: UITableView!{
        didSet{
            tblView.delegate = self
            tblView.dataSource = self
            tblView.sectionHeaderHeight = 50
            tblView.allowsMultipleSelection = true
        }
    }
    
    
    lazy var tdsListData: [SectionData] = {
        let section1 = SectionData(title: "Foot Deviations",
                                   data: RowData.init(title: ""))
        
        let section2 = SectionData(title: "Ankle Deviations",
                                   data: RowData.init(title: " Insufficient Plantarflexion"))
        
        let section3 = SectionData(title: "Knee Deviations",
                                   data: RowData.init(title: " Insufficient Flexion"))
                                   //RowData.init(title: " Hyperextension")
        
        
        let section4 = SectionData(title: "Hip Deviations",
                                   data: RowData.init(title: " Insuffiicient Flexion"))
        
        let section5 = SectionData(title: "Pelvis Deviations",
                                   data: RowData.init(title: " Excessive Backward Rotation"),
                                   RowData.init(title: " Insufficient Backward Rotation"))
        
        let section6 = SectionData(title: "Trunk Deviations",
                                   data: RowData.init(title: " Forward Lean"),
                                   RowData.init(title: " Backward Lean"),
                                   RowData.init(title: " Right Lean"),
                                   RowData.init(title: " Left Lean"))
        return [section2, section3, section4, section5, section6]
    }()
    
    var selectedSection : [Int] = [0,1,2,3,4]
    
    //MARK: - Life Cycle Func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpNavigationWithBack(titleStr: navigationTitle.tds)
    }
    
    //MARK: - Helper
    
    func isValid()-> Bool{
        for section in selectedSection{
            switch  section{
            case 0:
                validationString.selectAnkleOption.showAsToast()
            case 1:
                validationString.selectKneeOption.showAsToast()
            case 2:
                validationString.selectHipOption.showAsToast()
            case 3:
                validationString.selectPelvisOption.showAsToast()
            case 4:
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
            var (ankleArr, kneeArr, hipArr, pelvisArr, trunkArr) = ([String](),[String](),[String](),[String](),[String]())
            for data in selectedPath{
                switch data.section {
                case 0:
                    let selectedStr = tdsListData[data.section].data[data.row].rowTitle
                    ankleArr.append(selectedStr)
                case 1:
                    let selectedStr = tdsListData[data.section].data[data.row].rowTitle
                    kneeArr.append(selectedStr)
                case 2:
                    let selectedStr = tdsListData[data.section].data[data.row].rowTitle
                    hipArr.append(selectedStr)
                case 3:
                    let selectedStr = tdsListData[data.section].data[data.row].rowTitle
                    pelvisArr.append(selectedStr)
                case 4:
                    let selectedStr = tdsListData[data.section].data[data.row].rowTitle
                    trunkArr.append(selectedStr)
                default:
                    break
                }
            }
            selectedTDSData.setObject(ankleArr.joined(separator:"\n"), forKey: "ankle" as NSCopying)
            selectedTDSData.setObject(kneeArr.joined(separator:"\n"), forKey: "knee" as NSCopying)
            selectedTDSData.setObject(hipArr.joined(separator:"\n"), forKey: "hip" as NSCopying)
            selectedTDSData.setObject(pelvisArr.joined(separator:"\n"), forKey: "pelvis" as NSCopying)
            selectedTDSData.setObject(trunkArr.joined(separator:"\n"), forKey: "trunk" as NSCopying)
            //print(selectedTDSData)
        }
    }
    
    //MARL: - IBAtions
    
    @IBAction func tapSaveContinueBtn(_ sender : UIButton){
        //if isValid(){
            self.saveSalectedData()
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "SwingViewController") as! SwingViewController
            self.navigationController?.pushViewController(pushVC, animated: true)
        //}
    }
}

extension TDSViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tdsListData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return tdsListData[section].numberOfItems
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tdsListData[section].title
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tblCell = tableView.dequeueReusableCell(withIdentifier: "MultipleSelectionTblCell", for: indexPath) as! MultipleSelectionTblCell
        tblCell.lblTitleName.text = tdsListData[indexPath.section].data[indexPath.row].rowTitle
        tblCell.btnSelect.isSelected = tdsListData[indexPath.section].data[indexPath.row].isSelected
        
        if tblCell.lblTitleName.text == " Insufficient Plantarflexion" {
            
            tblCell.btn_info.tag = 1
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Insufficient Flexion" {
            
            tblCell.btn_info.tag = 2
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Insuffiicient Flexion" {
            
            tblCell.btn_info.tag = 3
            tblCell.btn_info.isHidden = false
            
        }
        
        
        else if tblCell.lblTitleName.text == " Excessive Backward Rotation" {
            
            tblCell.btn_info.tag = 4
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Insufficient Backward Rotation" {
            
            tblCell.btn_info.tag = 5
            tblCell.btn_info.isHidden = false
            
        }
        
        else if tblCell.lblTitleName.text == " Forward Lean" {
            
            tblCell.btn_info.tag = 6
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Backward Lean" {
            
            tblCell.btn_info.tag = 7
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Right Lean" {
            
            tblCell.btn_info.tag = 8
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Left Lean" {
            
            tblCell.btn_info.tag = 9
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
            pushVC.str_video_link = "https://vimeo.com/747433853/d8d6f3df25"
            pushVC.str_video_header = " Insufficient Plantarflexion"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        } else
        if sender.tag == 2 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747448736/e731431f26"
            pushVC.str_video_header = " Insufficient Flexion"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        } else
        if sender.tag == 3 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747881094/087131715c"
            pushVC.str_video_header = " Insuffiicient Flexion"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
        
        /*
         RowData.init(title: " Excessive Backward Rotation"),
         RowData.init(title: " Insufficient Backward Rotation"))
         */
        else
        if sender.tag == 4 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747882642/22a22dce00"
            pushVC.str_video_header = " Excessive Backward Rotation"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
        else
        if sender.tag == 5 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747882676/596c8c461d"
            pushVC.str_video_header = " Insufficient Backward Rotation"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
        
        /*
         RowData.init(title: " Forward Lean"),
         RowData.init(title: " Backward Lean"),
         RowData.init(title: " Right Lean"),
         RowData.init(title: " Left Lean"))
         */
        else
        if sender.tag == 6 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747883140/f7696ccb4a"
            pushVC.str_video_header = " Forward Lean"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
        else
        if sender.tag == 7 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747883049/d465541dc3"
            pushVC.str_video_header = " Backward Lean"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
        else
        if sender.tag == 8 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747883233/6419e7d5ff"
            pushVC.str_video_header = " Right Lean"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
        else
        if sender.tag == 9 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747883186/f8652f4a45"
            pushVC.str_video_header = " Left Lean"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
    }
    
}

extension TDSViewController: UITableViewDelegate{
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
