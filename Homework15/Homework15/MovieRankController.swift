//
//  MovieRankController.swift
//  Homework15
//
//  Created by 윾진ʕ·ᴥ·ʔ의 요술봉🪄 on 2021/06/09.
//

import UIKit
import Kanna
import Alamofire

class MovieRankController: UITableViewController {
    
    var movieArray: [String] = []
    var movieUrlArray : [String] = []
    var url = "https://movie.naver.com/movie/sdb/rank/rmovie.nhn"
    
    func getMovies() -> Void{
        let urlString = url
        let encodedUrlString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) // 한글이 포함되어 percnetencoding 함
        guard let encodedUrlStr = encodedUrlString else {
            return
        }

        AF.request(encodedUrlStr).responseString(encoding: .utf8) { response in // 클로저
            switch response.result {
            case .success(let str):
                self.parseHTML(htmlStr: str)
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    func parseHTML(htmlStr string: String) -> Void {
        let document = try? Kanna.HTML(html: string, encoding: .utf8)
        guard let doc = document else {
            return
        }
        for node in doc.xpath("//tr/td[@class='title']/div[@class='tit3']") {
            if let text = node.text {
                movieArray.append(text.trimmingCharacters(in: .whitespacesAndNewlines))
                print(text.trimmingCharacters(in: .whitespacesAndNewlines))
                movieUrlArray.append("https://movie.naver.com\(node.at_css("a")!["href"]!)")
                print("\(node.at_css("a")!["href"]!)")
            }
        }
        
        self.tableView.reloadData()
    }

    override func viewDidLoad() {
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refresh))
//
        super.viewDidLoad()
        self.getMovies()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        cell.textLabel?.text = movieArray[indexPath.row]

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destController = segue.destination as? WebController else { // destination을 StudentController 형태로 변환해서 반환
        return
    }
    let index = tableView.indexPathForSelectedRow?.row // 이미 바인딩 된 컨트롤러를 사용. 몇번째 셀을 터치했는지 가져옴.
    destController.detailUrl = movieUrlArray[index!]
    }

}
