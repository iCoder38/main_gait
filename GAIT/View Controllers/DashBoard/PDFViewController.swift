//
//  PDFViewController.swift
//  GAIT
//
//  Created by Shyam on 27/11/20.
//  Copyright © 2020 EVS. All rights reserved.
//

import UIKit
import PDFKit

class PDFViewController: BaseViewController {

    var pdfView = PDFView()
    var pdfURL : URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //self.setUpNavigationWithBack(titleStr: navigationTitle.pdfDetailsView)
        
        //let fileName = "\(userInfoData["pName"] as? String ?? "")_\(userInfoData["pDOB"] as? String ?? "")"
        
        self.setUpNavigationWithBack(titleStr: "\(userInfoData["pName"] as? String ?? "") Details")
        
        self.view.addSubview(pdfView)
        if let document = PDFDocument(url: pdfURL){
            pdfView.document = document
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
            //self.dismiss(animated: true, completion: nil)
        })
    }
    
    override func viewDidLayoutSubviews() {
        pdfView.frame = self.view.frame
    }
}
