//
//  ShowWorkoutTableViewController.swift
//  CoreData1
//
//  Created by Алексей Сергейцев on 5/18/21.
//

import UIKit

class ShowWorkoutTableViewController: UITableViewController {
    
    var delegate: ShowWorkoutTableViewController!
    
    var workout: Workout!
//    var workout: [Workout] = []
    var name = ""

    @IBOutlet weak var ShowNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        unPackData()
        print (workout!)
    }
    
    func unPackData() {
 
        ShowNameLabel.text = workout.name

    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
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
