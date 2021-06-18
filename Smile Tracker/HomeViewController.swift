//
//  ViewController.swift
//  Smile Tracker
//
//  Created by Dylan McDonald on 6/17/21.
//

import UIKit
import Foundation

class HomeViewController: UIViewController {

    @IBOutlet weak var buttonsContainer: UIView!
    @IBOutlet weak var checkInButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    
    @IBOutlet weak var daysLeftLabel: UILabel!
    @IBOutlet weak var currentSetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonsContainer.layer.cornerCurve = .continuous
        buttonsContainer.layer.cornerRadius = 45
        
        if UserDefaults.standard.integer(forKey: "sync DaysLeft") == 0 {
            UserDefaults.standard.set(14, forKey: "sync DaysLeft")
        }
        
        if UserDefaults.standard.integer(forKey: "sync CurrentSet") == 0 {
            UserDefaults.standard.set(1, forKey: "sync CurrentSet")
        }
        
        daysLeftLabel.text = String(UserDefaults.standard.integer(forKey: "sync DaysLeft"))
        currentSetLabel.text = String(UserDefaults.standard.integer(forKey: "sync CurrentSet"))
        
        // Set button fonts
        if let font = UIFont(name: "Sofia Pro Bold", size: 35) {
            let customString = NSMutableAttributedString(string: "Check In", attributes: [NSAttributedString.Key.font: font])
            
            checkInButton.setAttributedTitle(customString, for: .normal)
        } else {
            print("error, font not found...")
        }
        
        
        if let font = UIFont(name: "Sofia Pro Bold", size: 35) {
            let customString = NSMutableAttributedString(string: "Settings", attributes: [NSAttributedString.Key.font: font])
            settingsButton.setAttributedTitle(customString, for: .normal)
        } else {
            print("error, font not found...")
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        daysLeftLabel.text = String(UserDefaults.standard.integer(forKey: "sync DaysLeft"))
        currentSetLabel.text = String(UserDefaults.standard.integer(forKey: "sync CurrentSet"))
    }


}

