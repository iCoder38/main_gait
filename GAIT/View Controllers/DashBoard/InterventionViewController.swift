//
//  InterventionViewController.swift
//  GAIT
//
//  Created by Shyam on 05/11/20.
//  Copyright © 2020 EVS. All rights reserved.
//

import UIKit

var selectedInterventionData = NSMutableDictionary.init()

class InterventionViewController: BaseViewController {
    
    @IBOutlet weak var txtGoal: UITextField!
    @IBOutlet weak var txtViewGoal: UITextView!{
        didSet{
            txtViewGoal.layer.cornerRadius = 5
            txtViewGoal.layer.borderWidth = 1
            txtViewGoal.layer.borderColor = UIColor.appLightGrayColors().cgColor
        }
    }
    
    @IBOutlet weak var txtViewNotes: UITextView!{
        didSet{
            txtViewNotes.layer.cornerRadius = 5
            txtViewNotes.layer.borderWidth = 1
            txtViewNotes.layer.borderColor = UIColor.appLightGrayColors().cgColor
        }
    }
    
    @IBOutlet weak var tblView: UITableView!{
        didSet{
            tblView.delegate = self
            tblView.dataSource = self
            tblView.sectionHeaderHeight = 10
            tblView.allowsMultipleSelection = true
        }
    }
    
    
    lazy var listData: [SectionData] = {
        let section1 = SectionData(title: "",
                                   data: RowData.init(title: " Balance / Stability"),
                                   RowData.init(title: " Equality / Symmetry"),
                                   RowData.init(title: " Energy Consumption"),
                                   RowData.init(title: " Progression"),
                                   RowData.init(title: " Shock Absorption"))
        return [section1]
    }()
    
    var selectedSection : [Int] = [0]
    
    //MARK: - Life Cycle Func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpNavigationWithBack(titleStr: navigationTitle.intervention)
    }
    
    //MARK: - Helper
    
    func isValid()-> Bool{
        for section in selectedSection{
            switch  section{
            case 0:
                validationString.selectInterventionFocusOption.showAsToast()
            default:
                return true
            }
            return false
        }
        return true
    }
    
    func saveSalectedData(){
        var dataArr = [String]()
        if var selectedPath = self.tblView.indexPathsForSelectedRows{
            selectedPath = selectedPath.sorted()
            for data in selectedPath{
                let selectedStr = listData[data.section].data[data.row].rowTitle
                dataArr.append(selectedStr)
            }
            //print(selectedInterventionData)
        }
        //dataArr.append(self.txtGoal.text ?? "")
        //dataArr.append(self.txtViewGoal.text ?? "")
        selectedInterventionData.setObject(dataArr.joined(separator:"\n"), forKey: "intervention" as NSCopying)
        selectedInterventionData.setObject(" \(self.txtViewGoal.text ?? "")", forKey: "treatmentGoal" as NSCopying)
        selectedInterventionData.setObject(" \(self.txtViewNotes.text ?? "")", forKey: "notes" as NSCopying)
    }
    
    //MARK: - IBAtions
    
    @IBAction func tapContinueBtn(_ sender : UIButton){
        //if isValid(){
            self.saveSalectedData()
        
        
        
            /*let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "CongratulationsViewController") as! CongratulationsViewController
            self.navigationController?.pushViewController(pushVC, animated: true)*/
        
        
        
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "CongratulationsTwoId")
        self.navigationController?.pushViewController(pushVC!, animated: true)
        
        
        
        //}
    }
}

extension InterventionViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return listData[section].numberOfItems
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return listData[section].title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tblCell = tableView.dequeueReusableCell(withIdentifier: "MultipleSelectionTblCell", for: indexPath) as! MultipleSelectionTblCell
        let titleName = listData[indexPath.section].data[indexPath.row].rowTitle
        let firstL = titleName.prefix(1)
        let myMutableString = titleName.withBoldText(text: "\(firstL)")
        tblCell.lblTitleName.attributedText = myMutableString
        //tblCell.lblTitleName.text = titleName
        tblCell.btnSelect.isSelected = listData[indexPath.section].data[indexPath.row].isSelected
        return tblCell
    }
}

extension InterventionViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let headerView = view as? UITableViewHeaderFooterView else { return }
        headerView.tintColor = .clear
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
