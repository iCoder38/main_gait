//
//  StartAssessmentViewController.swift
//  GAIT
//
//  Created by Shyam on 05/11/20.
//  Copyright © 2020 EVS. All rights reserved.
//

import UIKit

class StartAssessmentViewController: BaseViewController {
    
    let arrDataList : [String] = [navigationTitle.ids, navigationTitle.sls, navigationTitle.tds, navigationTitle.swing]
    
    @IBOutlet weak var tblView: UITableView!{
        didSet{
            tblView.delegate = self
            tblView.dataSource = self
            //tblView.isUserInteractionEnabled = false
        }
    }
    
    //MARK: - Life Cycle Func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpNavigationWithBack(titleStr: navigationTitle.gaitIntervals)
    }
    
    
    //MARL: - IBAtions
    
    @IBAction func tapContinueBtn(_ sender : UIButton){
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "IDSViewController") as! IDSViewController
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
}

extension StartAssessmentViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return arrDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tblCell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        tblCell.lblTitleName.text = arrDataList[indexPath.row]
        tblCell.btnIndex.setTitle("\(indexPath.row + 1)", for: .normal)
        return tblCell
    }
}

extension StartAssessmentViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "IDSViewController") as! IDSViewController
            self.navigationController?.pushViewController(pushVC, animated: true)
        case 1:
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "SLSViewController") as! SLSViewController
            self.navigationController?.pushViewController(pushVC, animated: true)
        case 2:
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "TDSViewController") as! TDSViewController
            self.navigationController?.pushViewController(pushVC, animated: true)
        case 3:
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "SwingViewController") as! SwingViewController
            self.navigationController?.pushViewController(pushVC, animated: true)
        default:
            break
        }
    }
}
