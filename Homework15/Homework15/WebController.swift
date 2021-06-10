//
//  WebController.swift
//  Homework15
//
//  Created by 윾진ʕ·ᴥ·ʔ의 요술봉🪄 on 2021/06/09.
//

import UIKit
import WebKit

class WebController: UIViewController {
    var detailUrl: String?
    @IBOutlet var webView: WKWebView! // 크로이나 사파리 같은 기능을 갖고 있음
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("detailUrl : \(detailUrl!)")

        let urlString = detailUrl! // 서버 주소 입력
        let url = URL(string: urlString)
        let req = URLRequest(url: url!)
        
        webView.load(req)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
