//
//  MoiveController.swift
//  Movie
//
//  Created by 윾진ʕ·ᴥ·ʔ의 요술봉🪄 on 2021/05/22.
//

import UIKit

class MoiveController: UITableViewController {
    
    // 추가
    let movies = ["Chasing Amy", "Mallrats", "Dogma",
                  "Clerks", "Jay & Silent Bob Strike Back", "Red State",
                  "Cop Out", "Jersey Girl"]
    var movieImages: [UIImage] = [] // UIImage객체가 들어갈 배열
    
    override func viewDidLoad() { // viewController 객체가 생성되고 cell들이 다 생성되면 호출됨
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // 추가
        var i = 0
        for _ in movies {
            let image = UIImage(named: "\(i).jpg") // UIImage객체를 생성해서
            movieImages.append(image!) // movieImages 배열에 저장
            i = i + 1
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        // 추가
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // 추가
        return movies.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 추가
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        // tableView야 너 혹시 moviecell로 지정된 형식의 cell 보관한거 있으면 나 줘 아니면 생성할게!
        // tableView는 cell 객체를 넘겨받아서 desplay하는 역할을 함
        // tavleView객체는 Queue를 관리
        // 눈에 안보이는 재사용 가능한 cell이 있는지를 묻는 것

//         Configure the cell...
        cell.textLabel?.text = movies[indexPath.row]
        // cell에 영화 제목을 입히기

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        // 추가
        let destination = segue.destination as? DetailController
        let index = tableView.indexPathForSelectedRow?.row // 사용자가 몇 번째 cell을 터치했는지 받아옴
        if let destination = destination, let index = index {
            destination.image = self.movieImages[index]
        }
    }
    

}
