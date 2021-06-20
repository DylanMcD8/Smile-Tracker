//
//  SettingsTableViewController.swift
//  Smile Tracker
//
//  Created by Dylan McDonald on 6/18/21.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    @IBOutlet weak var morningTimePicker: UIDatePicker!
    @IBOutlet weak var eveningTimePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundView = UIImageView(image: UIImage(named: "Background Pattern")?.withTintColor(UIColor(named: "AccentColor")!))
        tableView.backgroundView?.contentMode = .scaleAspectFill
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        
        morningTimePicker.date = dateFormatter.date(from: UserDefaults.standard.string(forKey: "sync MorningReminderTime") ?? "8:00 AM") ?? Date()
        
        eveningTimePicker.date = dateFormatter.date(from: UserDefaults.standard.string(forKey: "sync EveningReminderTime") ?? "10:00 PM") ?? Date()
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        
        UserDefaults.standard.set(dateFormatter.string(from: morningTimePicker.date), forKey: "sync MorningReminderTime")
        UserDefaults.standard.set(dateFormatter.string(from: eveningTimePicker.date), forKey: "sync EveningReminderTime")
    }
    
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}


class OverrideCurrentSetViewController: UIViewController {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var buttonsContainer: UIView!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonsContainer.layer.cornerCurve = .continuous
        buttonsContainer.layer.cornerRadius = 45
        
        if let font = UIFont(name: "Sofia Pro Bold", size: 80) {
            let customString = NSMutableAttributedString(string: "-", attributes: [NSAttributedString.Key.font: font])
            
            minusButton.setAttributedTitle(customString, for: .normal)
        } else {
            print("error, font not found...")
        }
        
        if let font = UIFont(name: "Sofia Pro Bold", size: 80) {
            let customString = NSMutableAttributedString(string: "+", attributes: [NSAttributedString.Key.font: font])
            
            addButton.setAttributedTitle(customString, for: .normal)
        } else {
            print("error, font not found...")
        }
    }
    
    @IBAction func add(_ sender: Any) {
        let currentNumber = Int(numberLabel.text!)!
        numberLabel.text = String(currentNumber + 1)
        
        if minusButton.isEnabled == false {
            if currentNumber > 0 {
                minusButton.isEnabled = true
            }
        }
    }
    
    @IBAction func subtract(_ sender: Any) {
        let currentNumber = Int(numberLabel.text!)!
        
        if currentNumber > 1 {
            numberLabel.text = String(currentNumber - 1)
        }
        
        if currentNumber <= 2 {
            minusButton.isEnabled = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        numberLabel.text = String(UserDefaults.standard.string(forKey: "sync CurrentSet")!)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let newNumber = Int(numberLabel.text!)
        UserDefaults.standard.set(newNumber, forKey: "sync CurrentSet")
    }
    
}

class OverrideDaysLeftViewController: UIViewController {
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var buttonsContainer: UIView!
    
    @IBOutlet weak var numberLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonsContainer.layer.cornerCurve = .continuous
        buttonsContainer.layer.cornerRadius = 45
        
        if let font = UIFont(name: "Sofia Pro Bold", size: 80) {
            let customString = NSMutableAttributedString(string: "-", attributes: [NSAttributedString.Key.font: font])
            
            minusButton.setAttributedTitle(customString, for: .normal)
        } else {
            print("error, font not found...")
        }
        
        if let font = UIFont(name: "Sofia Pro Bold", size: 80) {
            let customString = NSMutableAttributedString(string: "+", attributes: [NSAttributedString.Key.font: font])
            
            addButton.setAttributedTitle(customString, for: .normal)
        } else {
            print("error, font not found...")
        }
    }
    
    @IBAction func add(_ sender: Any) {
        let currentNumber = Int(numberLabel.text!)!
        
        if currentNumber < 14 {
            numberLabel.text = String(currentNumber + 1)
        }
        
        if currentNumber >= 13 {
            addButton.isEnabled = false
        }
        
        if minusButton.isEnabled == false {
            if currentNumber > 0 {
                minusButton.isEnabled = true
            }
        }
    }
    
    @IBAction func subtract(_ sender: Any) {
        let currentNumber = Int(numberLabel.text!)!
        
        if currentNumber > 1 {
            numberLabel.text = String(currentNumber - 1)
        }
        
        if currentNumber <= 2 {
            minusButton.isEnabled = false
        }
        
        if addButton.isEnabled == false {
            if currentNumber < 15 {
                addButton.isEnabled = true
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        numberLabel.text = String(UserDefaults.standard.string(forKey: "sync DaysLeft")!)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let newNumber = Int(numberLabel.text!)
        UserDefaults.standard.set(newNumber, forKey: "sync DaysLeft")
    }
    
}
