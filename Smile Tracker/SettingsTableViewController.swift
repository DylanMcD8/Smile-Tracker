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
        
//        let backgroundImage = UIImageView(image: UIImage(named: "Background Pattern")?.withTintColor(UIColor(named: "AccentColor")))
//        backgroundImage.contentMode = .scaleAspectFill
        tableView.backgroundView = UIImageView(image: UIImage(named: "Background Pattern")?.withTintColor(UIColor(named: "AccentColor")!))
        tableView.backgroundView?.contentMode = .scaleAspectFill
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        
        print(dateFormatter.string(from: Date()))
        
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
