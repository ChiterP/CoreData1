//
//  AddNewWorkoutViewController.swift
//  CoreData1
//
//  Created by Алексей Сергейцев on 5/18/21.
//

import UIKit

class AddNewWorkoutViewController: UIViewController {
    
    private var workouts: [Workout] = []

    
    @IBOutlet weak var titleWorkoutTF: UITextField!
    
    @IBOutlet weak var oneRepetTF: UITextField!
    @IBOutlet weak var twoRepeatTF: UITextField!
    @IBOutlet weak var threeRepitTF: UITextField!
    @IBOutlet weak var fourRepitTf: UITextField!
    
    
    @IBOutlet weak var weightOneRepitTF: UITextField!
    @IBOutlet weak var weightTwoRepitTF: UITextField!
    @IBOutlet weak var weightThreeRepitTF: UITextField!
    @IBOutlet weak var weightFourRepitTF: UITextField!
    
    
    // MARK: - IB Action
    @IBAction func saveButtonAction(){
        
        guard let nameWorkour = titleWorkoutTF.text else {return}
        
        if !nameWorkour.isEmpty {
            StorageManager.shared.save(nameWorkour) { _ in
            titleWorkoutTF.text = nil
            }
        } else {
            dismiss(animated: true)
            return
        }
        dismiss(animated: true)
    }
}
