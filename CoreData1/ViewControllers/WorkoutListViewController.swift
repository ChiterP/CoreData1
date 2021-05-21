//
//  WorkoutListViewController.swift
//  CoreData1
//
//  Created by Алексей Сергейцев on 5/15/21.
//

import UIKit

class WorkoutListViewController: UITableViewController {

    
    private var workouts: [Workout] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }

    override func viewWillAppear(_ animated: Bool) {
        getData()
        tableView.reloadData()
    }
    
    private func getData() {
        StorageManager.shared.fetchData { result in
            switch result {
            case .success(let workouts):
                self.workouts = workouts
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
        
    
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let workout = workouts[indexPath.row]
        
        if editingStyle == .delete {
            workouts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            StorageManager.shared.delete(workout)
        }
    }
    

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        workouts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myWorkoutCell", for: indexPath)
        
        let workout = workouts[indexPath.row]
        cell.textLabel?.text = workout.name
        
        return cell
    }
    

    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showWorkout" {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                let showWorkoutVC = segue.destination as! ShowWorkoutTableViewController
                showWorkoutVC.workout = workouts[indexPath.row]
            }
        }
    }
}
