//
//  ViewController.swift
//  Smile Tracker
//
//  Created by Dylan McDonald on 6/17/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var buttonsContainer: UIView!
    @IBOutlet weak var checkInButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonsContainer.layer.cornerCurve = .continuous
        buttonsContainer.layer.cornerRadius = 45
        
       
        
        
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


}

