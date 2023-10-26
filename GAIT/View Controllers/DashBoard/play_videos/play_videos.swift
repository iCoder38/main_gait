//
//  play_videos.swift
//  GAIT
//
//  Created by Apple on 09/06/22.
//  Copyright © 2022 EVS. All rights reserved.
//

import UIKit
import WebKit

class play_videos: UIViewController {
    
    @IBOutlet weak var wv: WKWebView!
    
    var str_video_link:String!
    var str_video_header:String!
    
    var mywkwebview: WKWebView?
    let mywkwebviewConfig = WKWebViewConfiguration()
    
    @IBOutlet weak var btn_back:UIButton! {
        didSet {
            btn_back.tintColor = .black
        }
    }
    
    @IBOutlet weak var lbl_one:UILabel! {
        didSet {
            lbl_one.textColor = .black
        }
    }
    @IBOutlet weak var lbl_two:UILabel! {
        didSet {
            lbl_two.textColor = .black
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.loadYoutube(videoID: String(self.str_video_link))
        
        // print(String(self.str_video_link))
        
        // let youtubeURL = URL(string: self.str_video_link)
        // wv.load( URLRequest(url: youtubeURL!) )
        
        self.lbl_one.text = String(self.str_video_header)
        self.lbl_two.text = String("")
        
        self.btn_back.addTarget(self, action: #selector(btn_back_click_method), for: .touchUpInside)
    }
    
    @objc func btn_back_click_method() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func loadYoutube(videoID:String) {
        guard
            let youtubeURL = URL(string: videoID)
        else { return }
        wv.load( URLRequest(url: youtubeURL) )
    }
    
}
