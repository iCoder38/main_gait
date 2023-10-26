//
//  IDSViewController.swift
//  GAIT
//
//  Created by Shyam on 05/11/20.
//  Copyright © 2020 EVS. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer
import AudioToolbox
import AVKit

var selectedIDSData = NSMutableDictionary.init()

class IDSViewController: BaseViewController {
    
    // var moviePlayer:MPMoviePlayerController!
    
    @IBOutlet weak var tblView: UITableView! {
        didSet {
            tblView.delegate = self
            tblView.dataSource = self
            tblView.sectionHeaderHeight = 50
            tblView.allowsMultipleSelection = true
        }
    }
    
    lazy var ldsListData: [SectionData] = {
        
        let section1 = SectionData(title: "Foot Deviations",
                                   data: RowData.init(title: " Forefoot Contact"),
                                   RowData.init(title: " Foot-flat Contact"),
                                   RowData.init(title: " Foot Slap")
        )
        
        let section2 = SectionData(title: "Ankle Deviations",
                                   data: RowData.init(title: " Excessive Plantarflexion"),
                                   RowData.init(title: " Insufficient Plantarflexion"),
                                   RowData.init(title: " Excessive Dorsiflexion"),
                                   RowData.init(title: " Excessive Inversion"),
                                   RowData.init(title: " Excessive Eversion")
        )
        
        let section3 = SectionData(title: "Knee Deviations",
                                   data:
                                    RowData.init(title: " Excessive Flexion"),
                                   RowData.init(title: " Insufficient Flexion"),
                                   RowData.init(title: " Hyperextension"),
                                   RowData.init(title: " Excessive Varus"),
                                   RowData.init(title: " Excessive Valgus")
        )
        
        let section4 = SectionData(title: "Hip Deviations",
                                   data:
                                    // RowData.init(title: " Excessive Flexion"),
                                   RowData.init(title: " Insuffiicient Flexion"),
                                   RowData.init(title: " Excessive Internal Rotation"),
                                   RowData.init(title: " Excessive External Rotation"),
                                   RowData.init(title: " Excessive Abduction"),
                                   RowData.init(title: " Excessive Adduction")
        )
        
        let section5 = SectionData(title: "Pelvis Deviations",
                                   data:
                                    RowData.init(title: " Excessive Forward Rotation"),
                                   RowData.init(title: " Insufficient Forward Rotation")
                                   // RowData.init(title: " Contralateral Drop")
        )
        
        let section6 = SectionData(title: "Trunk Deviations",
                                   data: RowData.init(title: " Forward Lean"),
                                   RowData.init(title: " Backward Lean"),
                                   RowData.init(title: " Right Lean"),
                                   RowData.init(title: " Left Lean")
        )
        
        return [section1, section2, section3, section4, section5, section6]
        
    }()
    
    var selectedSection : [Int] = [0,1,2,3,4,5]
    
    //MARK: - Life Cycle Func -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.setUpNavigationWithBack(titleStr: navigationTitle.ids)
        self.tblView.register(CustomSectionTableViewCell.nib, forHeaderFooterViewReuseIdentifier: CustomSectionTableViewCell.identifier)
        
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
     
    func saveSalectedData() {
        if var selectedPath = self.tblView.indexPathsForSelectedRows {
            selectedPath = selectedPath.sorted()
            var (footArr, ankleArr, kneeArr, hipArr, pelvisArr, trunkArr) = ([String](),[String](),[String](),[String](),[String](),[String]())
            for data in selectedPath {
                switch data.section {
                case 0:
                    
                    let selectedStr = ldsListData[data.section].data[data.row].rowTitle
                    footArr.append(selectedStr)
                    
                case 1:
                    let selectedStr = ldsListData[data.section].data[data.row].rowTitle
                    ankleArr.append(selectedStr)
                case 2:
                    let selectedStr = ldsListData[data.section].data[data.row].rowTitle
                    kneeArr.append(selectedStr)
                case 3:
                    let selectedStr = ldsListData[data.section].data[data.row].rowTitle
                    hipArr.append(selectedStr)
                case 4:
                    let selectedStr = ldsListData[data.section].data[data.row].rowTitle
                    pelvisArr.append(selectedStr)
                case 5:
                    let selectedStr = ldsListData[data.section].data[data.row].rowTitle
                    trunkArr.append(selectedStr)
                default:
                    break
                }
            }
            
            selectedIDSData.setObject(footArr.joined(separator:"\n"),   forKey: "foot"   as NSCopying)
            selectedIDSData.setObject(ankleArr.joined(separator:"\n"),  forKey: "ankle"  as NSCopying)
            selectedIDSData.setObject(kneeArr.joined(separator:"\n"),   forKey: "knee"   as NSCopying)
            selectedIDSData.setObject(hipArr.joined(separator:"\n"),    forKey: "hip"    as NSCopying)
            selectedIDSData.setObject(pelvisArr.joined(separator:"\n"), forKey: "pelvis" as NSCopying)
            selectedIDSData.setObject(trunkArr.joined(separator:"\n"),  forKey: "trunk"  as NSCopying)
            //print(selectedIDSData)
            
        }
    }
    
    func getDatabySection(section: Int)  {
        switch section {
        case 0:
            break
        default:
            break
        }
    }
    
    //MARK: - IBAtions -
    @IBAction func tapSaveContinueBtn(_ sender : UIButton) {
        //print(selectedSection.count)
        //if isValid(){
        
        self.saveSalectedData()
        
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "SLSViewController") as! SLSViewController
        self.navigationController?.pushViewController(pushVC, animated: true)
        
        //}
    }
    
}

extension IDSViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ldsListData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return ldsListData[section].numberOfItems
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ldsListData[section].title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tblCell = tableView.dequeueReusableCell(withIdentifier: "MultipleSelectionTblCell", for: indexPath) as! MultipleSelectionTblCell
        
        tblCell.lblTitleName.text = ldsListData[indexPath.section].data[indexPath.row].rowTitle
        //tblCell.btnSelect.isSelected = ldsListData[indexPath.section].data[indexPath.row].isSelected
        
        if tblCell.lblTitleName.text == " Forefoot Contact" {
            
            tblCell.btn_info.tag = 1
            tblCell.btn_info.isHidden = false
            
        } else if tblCell.lblTitleName.text == " Foot-flat Contact" {
            
            tblCell.btn_info.tag = 2
            tblCell.btn_info.isHidden = false
            
            
        } else if tblCell.lblTitleName.text == " Foot Slap" {
            
            tblCell.btn_info.tag = 3
            tblCell.btn_info.isHidden = false
            
        } else if tblCell.lblTitleName.text == " Excessive Plantarflexion" {
            
            tblCell.btn_info.tag = 4
            tblCell.btn_info.isHidden = false
            
        } else if tblCell.lblTitleName.text == " Insufficient Plantarflexion" {
            
            tblCell.btn_info.tag = 5
            tblCell.btn_info.isHidden = false
            
        } else if tblCell.lblTitleName.text == " Excessive Dorsiflexion" {
            
            tblCell.btn_info.tag = 6
            tblCell.btn_info.isHidden = false
            
        } else if tblCell.lblTitleName.text == " Excessive Inversion" {
            
            tblCell.btn_info.tag = 7
            tblCell.btn_info.isHidden = false
            
            
        } else if tblCell.lblTitleName.text == " Excessive Eversion" {
            
            tblCell.btn_info.tag = 8
            tblCell.btn_info.isHidden = false
            
            
        } else if tblCell.lblTitleName.text == " Excessive Flexion" {
            
            tblCell.btn_info.tag = 9
            tblCell.btn_info.isHidden = false
            
        } else if tblCell.lblTitleName.text == " Insufficient Flexion" {
            
            tblCell.btn_info.tag = 10
            tblCell.btn_info.isHidden = false
            
        } else if tblCell.lblTitleName.text == " Hyperextension" {
            
            tblCell.btn_info.tag = 11
            tblCell.btn_info.isHidden = false
            
        } else if tblCell.lblTitleName.text == " Excessive Varus" {
            
            tblCell.btn_info.tag = 12
            tblCell.btn_info.isHidden = false
            
        } else if tblCell.lblTitleName.text == " Excessive Valgus" {
            
            tblCell.btn_info.tag = 13
            tblCell.btn_info.isHidden = false
            /*
             RowData.init(title: " Insuffiicient Flexion"),
             RowData.init(title: " Excessive Internal Rotation"),
             RowData.init(title: " Excessive External Rotation"),
             RowData.init(title: " Excessive Abduction"),
             RowData.init(title: " Excessive Adduction")
             */
        } else if tblCell.lblTitleName.text == " Insuffiicient Flexion" {
            
            tblCell.btn_info.tag = 14
            tblCell.btn_info.isHidden = false
            
        } else if tblCell.lblTitleName.text == " Excessive Internal Rotation" {
            
            tblCell.btn_info.tag = 15
            tblCell.btn_info.isHidden = false
            
        } else if tblCell.lblTitleName.text == " Excessive External Rotation" {
            
            tblCell.btn_info.tag = 16
            tblCell.btn_info.isHidden = false
            
        } else if tblCell.lblTitleName.text == " Excessive Abduction" {
            
            tblCell.btn_info.tag = 17
            tblCell.btn_info.isHidden = false
            
        } else if tblCell.lblTitleName.text == " Excessive Adduction" {
            
            tblCell.btn_info.tag = 18
            tblCell.btn_info.isHidden = false
            
        } else if tblCell.lblTitleName.text == " Excessive Forward Rotation" {
            
            tblCell.btn_info.tag = 19
            tblCell.btn_info.isHidden = false
            
        } else if tblCell.lblTitleName.text == " Insufficient Forward Rotation" {
            
            tblCell.btn_info.tag = 20
            tblCell.btn_info.isHidden = false
            
        }  else if tblCell.lblTitleName.text == " Forward Lean" {
            
            tblCell.btn_info.tag = 21
            tblCell.btn_info.isHidden = false
            
        }  else if tblCell.lblTitleName.text == " Backward Lean" {
            
            tblCell.btn_info.tag = 22
            tblCell.btn_info.isHidden = false
            
        }  else if tblCell.lblTitleName.text == " Right Lean" {
            
            tblCell.btn_info.tag = 23
            tblCell.btn_info.isHidden = false
            
        }  else if tblCell.lblTitleName.text == " Left Lean" {
            
            tblCell.btn_info.tag = 24
            tblCell.btn_info.isHidden = false
            
        } else {
            
            tblCell.btn_info.tag = 1000
            tblCell.btn_info.isHidden = true
            
        }
            
        tblCell.btn_info.addTarget(self, action: #selector(click_one_method), for:  .touchUpInside)
        
        return tblCell
        
    }
    
    @objc func click_one_method(_ sender:UIButton) {
        print("===> one <===")
        
        if sender.tag == 1 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747290058/6b5bc4cb10"
            pushVC.str_video_header = " Forefoot Contact"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        } else if sender.tag == 2 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747270996/eee503e5ff"
            pushVC.str_video_header = " Foot-flat Contact"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        } else if sender.tag == 3 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747270876/a4d2a2774b"
            pushVC.str_video_header = " Foot Slap"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        } else if sender.tag == 4 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747376498/cf4aaa6799"
            pushVC.str_video_header = " Excessive Plantarflexion"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        } else if sender.tag == 5 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747376551/87d6a49598"
            pushVC.str_video_header = " Insufficient Plantarflexion"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        } else if sender.tag == 6 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747376194/721fcd13c4"
            pushVC.str_video_header = " Excessive Dorsiflexion"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        } else if sender.tag == 7 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747376435/150c47e717"
            pushVC.str_video_header = " Excessive Inversion"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
            
        } else if sender.tag == 8 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747376264/45a2618088"
            pushVC.str_video_header = " Excessive Eversion"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
            
        } else if sender.tag == 9 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747438735/c9d9577680"
            pushVC.str_video_header = " Excessive Flexion"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        } else if sender.tag == 10 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747447988/df9133be10"
            pushVC.str_video_header = " Insufficient Flexion"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        } else if sender.tag == 11 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747438778/7828abbcc1"
            pushVC.str_video_header = " Hyperextension"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        } else if sender.tag == 12 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747448023/b18a848c30"
            pushVC.str_video_header = " Excessive Varus"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        } else if sender.tag == 13 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747447791/0e35be95e1"
            pushVC.str_video_header = " Excessive Valgus"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        } else if sender.tag == 14 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747876189/66f11d362d"
            pushVC.str_video_header = " Insuffiicient Flexion"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        } else if sender.tag == 15 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747876224/e121a035e1"
            pushVC.str_video_header = " Excessive Internal Rotation"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        } else if sender.tag == 16 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747876265/910c3d92d9"
            pushVC.str_video_header = " Excessive External Rotation"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        } else if sender.tag == 17 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747876336/9488f570e6"
            pushVC.str_video_header = " Excessive Abduction"
            self.navigationController?.pushViewController(pushVC, animated: true)
            /*
             RowData.init(title: " Excessive Forward Rotation"),
            RowData.init(title: " Insufficient Forward Rotation")
             */
        } else if sender.tag == 18 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747876381/6e0b60ce97"
            pushVC.str_video_header = " Excessive Adduction"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        } else if sender.tag == 19 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747882104/486fef8050"
            pushVC.str_video_header = " Excessive Forward Rotation"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        } else if sender.tag == 20 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747882139/e648cc35b2"
            pushVC.str_video_header = " Insufficient Forward Rotation"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
            /*
             data: RowData.init(title: " Forward Lean"),
             RowData.init(title: " Backward Lean"),
             RowData.init(title: " Right Lean"),
             RowData.init(title: " Left Lean")
             */
            
        } else if sender.tag == 21 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747883140/f7696ccb4a"
            pushVC.str_video_header = " Forward Lean"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        } else if sender.tag == 22 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747883049/d465541dc3"
            pushVC.str_video_header = " Backward Lean"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        } else if sender.tag == 23 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747883233/6419e7d5ff"
            pushVC.str_video_header = " Right Lean"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        } else if sender.tag == 24 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747883186/f8652f4a45"
            pushVC.str_video_header = " Left Lean"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
        
        
        
        
    }
    
    @objc func click_two_method() {
        print("===> two <===")
        
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://youtu.be/MbefTOyypP8"
        pushVC.str_video_header = " Foot-flat Contact"
        self.navigationController?.pushViewController(pushVC, animated: true)
        
    }
    
    @objc func click_three_method() {
        print("===> three <===")
        
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
        pushVC.str_video_link = "https://youtu.be/7zvF4wNn8gk"
        pushVC.str_video_header = " Foot Slap"
        self.navigationController?.pushViewController(pushVC, animated: true)
        
    }
    
}

extension IDSViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let headerView = view as? UITableViewHeaderFooterView else { return }
        headerView.tintColor = .appOrangColors()
        headerView.textLabel?.textColor = .white
        headerView.textLabel?.textAlignment = .center
        headerView.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
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
