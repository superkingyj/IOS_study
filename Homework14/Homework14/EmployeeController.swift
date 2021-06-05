//
//  EmployeeController.swift
//  Homework14
//
//  Created by 윾진ʕ·ᴥ·ʔ의 요술봉🪄 on 2021/06/05.
//

import UIKit
import Kanna
import Alamofire

class EmployeeController: UITableViewController {
    
    var departmentName : String?
    var employeeArray : [String] = []
    var employeeNumArray : [String] = []
    
    func getEmployee() -> Void{
        guard let department = departmentName else {
            return
        }
        
        let urlString = "http://203.252.219.241:8080/FinalProject/advisorProHome.jsp" + "?dept=" + department
        let encodedUrlString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        
        guard let encodedUrlString_ = encodedUrlString else {
            return
        }
        
        AF.request(encodedUrlString_).responseString(encoding: .utf8){ response in
            switch response.result {
            case .success(let str):
                self.parseHTML(htmlStr: str)
            case .failure(let error):
                print(error)
                return
            }
        }
    }

    func parseHTML(htmlStr string : String) -> Void{
        let document = try? Kanna.HTML(html: string, encoding: .utf8)
        guard let doc = document else {
            return
        }
        for node in doc.xpath("//h5"){
            if let text = node.text{
                employeeArray.append(text)
            }
        }
        for node in doc.xpath("//h6"){
            if let text = node.text{
                employeeNumArray.append(text)
            }
        }
        
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getEmployee()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return employeeArray.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeCell", for: indexPath)
        // Configure the cell...
        cell.textLabel?.text = employeeArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showAlert(indexPath: indexPath)
    }

    func showAlert(indexPath: IndexPath){
        let alert = UIAlertController(title: "\(employeeArray[indexPath.row])",
                        message: "사번 : \(employeeNumArray[indexPath.row])", preferredStyle: UIAlertController.Style.actionSheet)
        let alertAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.default)
        alert.addAction(alertAction)
        
        self.present(alert, animated: true, completion: nil)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
