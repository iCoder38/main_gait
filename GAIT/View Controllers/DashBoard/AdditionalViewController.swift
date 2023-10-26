//
//  AdditionalViewController.swift
//  GAIT
//
//  Created by Shyam on 05/11/20.
//  Copyright © 2020 EVS. All rights reserved.
//

import UIKit

var selectedAdditionalData = NSMutableDictionary.init()

class AdditionalViewController: BaseViewController {
    
    @IBOutlet weak var tblView: UITableView!{
        didSet{
            tblView.delegate = self
            tblView.dataSource = self
            tblView.sectionHeaderHeight = 50
            tblView.allowsMultipleSelection = true
            //tblView.allowsSelection = false
        }
    }
    
    lazy var additionalListData: [SectionData] = {
        let section1 = SectionData(title: "Step Length",
                                   data: RowData.init(title: "RIGHT > LEFT"),
                                   RowData.init(title: "LEFT > RIGHT"),
                                   RowData.init(title: "Symmetric"))
        let section2 = SectionData(title: "Step Width",
                                   data: RowData.init(title: "Wide"),
                                   RowData.init(title: "Narrow"),
                                   RowData.init(title: "Normal"))
        let section3 = SectionData(title: "Stance Time",
                                   data: RowData.init(title: "RIGHT  >  LEFT"),
                                   RowData.init(title: "LEFT  >  RIGHT"),
                                   RowData.init(title: " Symmetric"))
        
        let section4 = SectionData(title: "Toe Angle",
                                   data: RowData.init(title: "TOE In"),
                                   RowData.init(title: "TOE Out"),
                                   RowData.init(title: " Normal"))
        let section5 = SectionData(title: "Arm Swing",
                                   data: RowData.init(title: "RIGHT   >   LEFT"),
                                   RowData.init(title: "LEFT   >   RIGHT"),
                                   RowData.init(title: "  Symmetric"))
        
        return [section1, section2, section3,section4,section5]
    }()
    
    var selectedSection : [Int] = [0,1,2,3]
    
    //MARK: - Life Cycle Func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpNavigationWithBack(titleStr: navigationTitle.additional)
    }
    
    //MARK: - Helper
    
    func isValid()-> Bool{
        for section in selectedSection{
            switch  section{
            case 0:
                validationString.selectSetpLengthOption.showAsToast()
            case 1:
                validationString.selectSetpWidthOption.showAsToast()
            case 2:
                validationString.selectTopAngleOption.showAsToast()
            case 3:
                validationString.selectArmSwingOption.showAsToast()
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
            var (lengthArr, widthArr, timeArr, angleArr, swingArr) = ([String](),[String](),[String](),[String](),[String]())
            for data in selectedPath{
                switch data.section {
                case 0:
                    let selectedStr = additionalListData[data.section].data[data.row].rowTitle
                    lengthArr.append(selectedStr)
                case 1:
                    let selectedStr = additionalListData[data.section].data[data.row].rowTitle
                    widthArr.append(selectedStr)
                case 2:
                    let selectedStr = additionalListData[data.section].data[data.row].rowTitle
                    timeArr.append(selectedStr)
                case 3:
                    let selectedStr = additionalListData[data.section].data[data.row].rowTitle
                    angleArr.append(selectedStr)
                case 4:
                    let selectedStr = additionalListData[data.section].data[data.row].rowTitle
                    swingArr.append(selectedStr)
                default:
                    break
                }
            }
            selectedAdditionalData.setObject(lengthArr.joined(separator:", "), forKey: "lenght" as NSCopying)
            selectedAdditionalData.setObject(widthArr.joined(separator:", "), forKey: "width" as NSCopying)
            selectedAdditionalData.setObject(timeArr.joined(separator:", "), forKey: "stancetime" as NSCopying)
            selectedAdditionalData.setObject(angleArr.joined(separator:", "), forKey: "angle" as NSCopying)
            selectedAdditionalData.setObject(swingArr.joined(separator:", "), forKey: "swing" as NSCopying)
            //print(selectedAdditionalData)
        }
    }
    
    //MARK: - IBAtions
    
    @IBAction func tapContinueBtn(_ sender : UIButton){
        //if isValid(){
        self.saveSalectedData()
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "InterventionViewController") as! InterventionViewController
        self.navigationController?.pushViewController(pushVC, animated: true)
        //}
    }
}

extension AdditionalViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return additionalListData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return additionalListData[section].numberOfItems
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return additionalListData[section].title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tblCell = tableView.dequeueReusableCell(withIdentifier: "MultipleSelectionTblCell", for: indexPath) as! MultipleSelectionTblCell
        tblCell.lblTitleName.text = additionalListData[indexPath.section].data[indexPath.row].rowTitle
        tblCell.btnSelect.isSelected = additionalListData[indexPath.section].data[indexPath.row].isSelected
        
        /*RowData.init(title: "RIGHT > LEFT"),
        RowData.init(title: "LEFT > RIGHT"),
        RowData.init(title: "Symmetric"))*/
        
        if tblCell.lblTitleName.text == "RIGHT > LEFT" {
            
            tblCell.btn_info.tag = 1
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == "LEFT > RIGHT" {
            
            tblCell.btn_info.tag = 2
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == "Symmetric" {
            
            tblCell.btn_info.tag = 3
            tblCell.btn_info.isHidden = false
            
        }
        
        /*
         RowData.init(title: "Wide"),
         RowData.init(title: "Narrow"),
         RowData.init(title: "Normal"))
         */
        else if tblCell.lblTitleName.text == "Wide" {
            
            tblCell.btn_info.tag = 4
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == "Narrow" {
            
            tblCell.btn_info.tag = 5
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == "Normal" {
            
            tblCell.btn_info.tag = 6
            tblCell.btn_info.isHidden = false
            
        }
        
        
        else if tblCell.lblTitleName.text == "RIGHT  >  LEFT" {
            
            tblCell.btn_info.tag = 7
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == "LEFT  >  RIGHT" {
            
            tblCell.btn_info.tag = 8
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Symmetric" {
            
            tblCell.btn_info.tag = 9
            tblCell.btn_info.isHidden = false
            
        }
        
        /*
         RowData.init(title: "TOE In"),
         RowData.init(title: "TOE Out"),
         RowData.init(title: "Normal"))
         */
        else if tblCell.lblTitleName.text == "TOE In" {
            
            tblCell.btn_info.tag = 10
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == "TOE Out" {
            
            tblCell.btn_info.tag = 11
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == " Normal" {
            
            tblCell.btn_info.tag = 12
            tblCell.btn_info.isHidden = false
            
        }
        
        else if tblCell.lblTitleName.text == "RIGHT   >   LEFT" {
            
            tblCell.btn_info.tag = 13
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == "LEFT   >   RIGHT" {
            
            tblCell.btn_info.tag = 14
            tblCell.btn_info.isHidden = false
            
        }
        else if tblCell.lblTitleName.text == "  Symmetric" {
            
            tblCell.btn_info.tag = 15
            tblCell.btn_info.isHidden = false
            
        }
        tblCell.btn_info.addTarget(self, action: #selector(click_one_method), for:  .touchUpInside)
        
        return tblCell
    }
    
    @objc func click_one_method(_ sender:UIButton) {
        print("===> one <===")
        
        if sender.tag == 1 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747903604/fe48874c1f"
            pushVC.str_video_header = "RIGHT > LEFT"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        } else if sender.tag == 2 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747903620/038aba1f08"
            pushVC.str_video_header = "LEFT > RIGHT"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        } else if sender.tag == 3 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747903590/9cfa41c4ac"
            pushVC.str_video_header = "Symmetric"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        } else if sender.tag == 4 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747903723/4e44829b00"
            pushVC.str_video_header = "Wide"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        } else if sender.tag == 5 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747903701/ed909b8f75"
            pushVC.str_video_header = "Narrow"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        } else if sender.tag == 6 {
            
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
            pushVC.str_video_link = "https://vimeo.com/747903723/4e44829b00"
            pushVC.str_video_header = "Normal"
            self.navigationController?.pushViewController(pushVC, animated: true)
            
        }
        /*
         RowData.init(title: "RIGHT > LEFT"),
         RowData.init(title: "LEFT > RIGHT"),
         RowData.init(title: "Symmetric"))
         */
        else if sender.tag == 7 {
           
           let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
           pushVC.str_video_link = "https://vimeo.com/747903383/afb50e82b1"
           pushVC.str_video_header = "RIGHT > LEFT"
           self.navigationController?.pushViewController(pushVC, animated: true)
           
       }
        else if sender.tag == 8 {
           
           let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
           pushVC.str_video_link = "https://vimeo.com/747903402/18a3e6dd0a"
           pushVC.str_video_header = "LEFT > RIGHT"
           self.navigationController?.pushViewController(pushVC, animated: true)
           
       }
        else if sender.tag == 9 {
           
           let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
           pushVC.str_video_link = "https://vimeo.com/747903353/9f5373d156"
           pushVC.str_video_header = " Symmetric"
           self.navigationController?.pushViewController(pushVC, animated: true)
           
       }
        
        /*
         RowData.init(title: "TOE In"),
         RowData.init(title: "TOE Out"),
         RowData.init(title: "Normal"))
         */
        else if sender.tag == 10 {
           
           let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
           pushVC.str_video_link = "https://vimeo.com/747903866/403f341996"
           pushVC.str_video_header = "TOE In"
           self.navigationController?.pushViewController(pushVC, animated: true)
           
       }
        else if sender.tag == 11 {
           
           let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
           pushVC.str_video_link = "https://vimeo.com/747903887/5f3b8e53a6"
           pushVC.str_video_header = "TOE Out"
           self.navigationController?.pushViewController(pushVC, animated: true)
           
       }
        else if sender.tag == 12 {
           
           let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
           pushVC.str_video_link = "https://vimeo.com/747903836/709e44e1ee"
           pushVC.str_video_header = "Normal"
           self.navigationController?.pushViewController(pushVC, animated: true)
           
       }
        /*
         RowData.init(title: "RIGHT   >   LEFT"),
         RowData.init(title: "LEFT   >   RIGHT"),
         RowData.init(title: "  Symmetric")
         */
        else if sender.tag == 13 {
           
           let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
           pushVC.str_video_link = "https://vimeo.com/747903235/01877d2e09"
           pushVC.str_video_header = "RIGHT > LEFT"
           self.navigationController?.pushViewController(pushVC, animated: true)
           
       }
        else if sender.tag == 14 {
           
           let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
           pushVC.str_video_link = "https://vimeo.com/747903257/ffd0494b1c"
           pushVC.str_video_header = "LEFT > RIGHT"
           self.navigationController?.pushViewController(pushVC, animated: true)
           
       }
        else if sender.tag == 15 {
           
           let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
           pushVC.str_video_link = "https://vimeo.com/747903272/574c95008c"
           pushVC.str_video_header = "Symmetric"
           self.navigationController?.pushViewController(pushVC, animated: true)
           
       }
    }
    
}

extension AdditionalViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let headerView = view as? UITableViewHeaderFooterView else { return }
        headerView.backgroundColor = .white
        headerView.tintColor = .white
        headerView.textLabel?.font = UIFont(name: "Arial Bold", size: 18)
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        // Find any selected row in this section
        if let selectedIndexPath = tableView.indexPathsForSelectedRows?.first(where: {
            $0.section == indexPath.section
        }) {
            // Deselect the row
            tableView.deselectRow(at: selectedIndexPath, animated: false)
            // deselectRow doesn't fire the delegate method so need to
            // unset the checkmark here
            tableView.cellForRow(at: selectedIndexPath)?.accessoryType = .none
        }
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        // Prevent deselection of a cell
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
}
