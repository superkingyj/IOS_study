
import UIKit
import WebKit

class WebController: UIViewController {
    @IBOutlet var webView: WKWebView! // 크로이나 사파리 같은 기능을 갖고 있음
    
    override func viewDidLoad() { // 뷰 컨트롤러가 생성이 되면 초기에 호출되는 메소드
        super.viewDidLoad()

        let urlString = "http://203.252.219.241:8080/FinalProject/" // 서버 주소 입력
        let url = URL(string: urlString) // URL객체 생성
        let req = URLRequest(url: url!) // URL request 객체 생성
        
        webView.load(req) // 서버와 통신해서 html데이터를 끌어와서 웹 뷰에 표시. 그 이후부터는 웹뷰가 모든 동작 실행.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
