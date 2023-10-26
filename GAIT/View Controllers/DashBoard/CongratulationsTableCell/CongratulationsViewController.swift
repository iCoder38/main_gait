//
//  CongratulationsViewController.swift
//  GAIT
//
//  Created by Shyam on 05/11/20.
//  Copyright © 2020 EVS. All rights reserved.
//

import UIKit
import WebKit

class CongratulationsViewController: BaseViewController {
    
    @IBOutlet weak var viewWk: UIView!
    @IBOutlet weak var webView: WKWebView!
    //var pdfUrl : NSURL?
    var pdfUrl : URL?
    
    @IBOutlet weak var btnClickHereForMoreInfo:UIButton!
    
    //MARK: - Life Cycle Func -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpNavigationWithBack(titleStr: navigationTitle.congratulation)
        self.viewWk.isHidden = true
        
        self.btnClickHereForMoreInfo.addTarget(self, action: #selector(clickHereForMoreInfoClickMethod), for: .touchUpInside)
    }
    
    @objc func clickHereForMoreInfoClickMethod() {
        guard let url = URL(string: "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3761742/") else { return }
        UIApplication.shared.open(url)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func removeAllData() {
        userInfoData.removeAllObjects()
        selectedIDSData.removeAllObjects()
        selectedSLSData.removeAllObjects()
        selectedTDSData.removeAllObjects()
        selectedSwingData.removeAllObjects()
        selectedAdditionalData.removeAllObjects()
        selectedInterventionData.removeAllObjects()
    }

    //MARL: - IBAtions
    
    @IBAction func tapPdfBtn(_ sender : UIButton){
        //self.loadPDF(f ilename: "file")
        //viewWk.isHidden = false
        self.generateButtonTouchUpInside()
    }
    
    @IBAction func tapShareBtn(_ sender : UIButton){
        viewWk.isHidden = true
        //        if let pdf = Bundle.main.url(forResource: "file", withExtension: "pdf", subdirectory: nil, localization: nil)  {
        //            self.sharePdf(path: pdf)
        guard let pUrl = self.pdfUrl else { return}
        self.sharePdf(path: pUrl as URL)
        //        }
        //self.shareButtonTouched()
    }
    
    @IBAction func tapStartBtn(_ sender : UIButton){
        viewWk.isHidden = true
        self.removeAllData()
        self.backToPatientInfo()
    }
}

//New updated Pdf

extension CongratulationsViewController {
    
    func configureView() {
        // Update the user interface for the detail item.
        if let url = self.pdfUrl {
            if let contentView = self.webView {
                print(url)
                contentView.load(URLRequest.init(url: url as URL))
            }
        }
        self.viewWk.isHidden = false
    }
    
    func generateButtonTouchUpInside() {
        var pages:Array<UIView> = []
        // Load Views with NibName
        let pdfPageView = Bundle.main.loadNibNamed("PDFPageView", owner: self, options: nil)?.last as! PDFPageView
        // Fill Views With Data
        pdfPageView.setupViewContent()
        // Generate PDF from pages Array
        pages.append(contentsOf: [pdfPageView])
        //let tempFilePath = SwiftPDFGenerator.generatePDFWithPages(pages: pages)
        let tempFilePath = pdfPageView.exportAsPdfFromView()
        self.downloadFile(pdfUrl: tempFilePath)
        // present PDF
        //let pdfLoc = NSURL(fileURLWithPath: tempFilePath)
        //self.pdfUrl = pdfLoc
        //self.pdfUrl = URL(string: tempFilePath)
        //configureView()
    }
    
    func downloadFile(pdfUrl: String) {
        //guard let url = URL(string: pdfUrl) else { return }
        let url = URL(fileURLWithPath: pdfUrl)
        self.pdfUrl = url
        let urlSession = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
        let downloadTask = urlSession.downloadTask(with: url)
        downloadTask.resume()
        self.open_pdf()
    }
    
    func open_pdf() {
        /*
         let pdfView = PDFViewController()
         pdfView.pdfURL = self.pdfUrl
         present(pdfView, animated: true, completion: nil)
         */
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "PDFViewController") as! PDFViewController
        pushVC.pdfURL = self.pdfUrl
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
    func sharePdf(path:URL) {
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: path.path) {
            let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: [path], applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController, animated: true, completion: nil)
        } else {
            print("document was not found")
            let alertController = UIAlertController(title: "Error", message: "Document was not found!", preferredStyle: .alert)
            let defaultAction = UIAlertAction.init(title: "ok", style: UIAlertAction.Style.default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }
    }
}

extension CongratulationsViewController:  URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("downloadLocation:", location)
        
        guard let url = downloadTask.originalRequest?.url else {
            return
        }
        let docsPath = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        let destinationPath = docsPath.appendingPathComponent(url.lastPathComponent)
        
        try? FileManager.default.removeItem(at: destinationPath)
        
        do{
            try FileManager.default.copyItem(at: location, to: destinationPath)
            self.pdfUrl = destinationPath
            print("File Downloaded Location- ",  self.pdfUrl ?? "NOT")
        }catch let error {
            print("Copy Error: \(error.localizedDescription)")
        }  
        
    }
}
