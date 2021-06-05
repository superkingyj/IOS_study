//
//  MealController.swift
//  Homework12
//
//  Created by 윾진ʕ·ᴥ·ʔ의 요술봉🪄 on 2021/05/22.
//

import UIKit

class MealController: UITableViewController {

    var mealImages : [UIImage]  = []
    var mealDescription : String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for (title, description, imageName) in dataset {
            let meal = Meal()
            meal.title = title
            meal.description = description
            meal.image = UIImage(named: imageName)
            meals.append(meal)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath)
        // Configure the cell..
        cell.textLabel?.text = meals[indexPath.row].title

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //getting the current cell from the index path
        mealDescription = meals[indexPath.row].description
        
        let currentCell = tableView.cellForRow(at: indexPath)
        let controller = self.tabBarController?.viewControllers?[1] as? ViewController
        
        controller?.mealString = currentCell?.textLabel?.text!
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
        
        let destination = segue.destination as? DetailController
        let index = tableView.indexPathForSelectedRow?.row
        if let destination = destination, let index = index {
            destination.image = meals[index].image
            destination.text = meals[index].description
        }
    }
}
