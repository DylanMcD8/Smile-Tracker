//
//  CheckinViewController.swift
//  Smile Tracker
//
//  Created by Dylan McDonald on 6/17/21.
//

import UIKit

class CheckinViewController: UIViewController {
    
    @IBOutlet weak var buttonsContainer: UIView!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    @IBOutlet weak var leftImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonsContainer.layer.cornerCurve = .continuous
        buttonsContainer.layer.cornerRadius = 45
        
        
        
        // Set button fonts
        if let font = UIFont(name: "Sofia Pro Bold", size: 40) {
            let customString = NSMutableAttributedString(string: "No :(", attributes: [NSAttributedString.Key.font: font])
            
            noButton.setAttributedTitle(customString, for: .normal)
        } else {
            print("error, font not found...")
        }
        
        
        if let font = UIFont(name: "Sofia Pro Bold", size: 50) {
            let customString = NSMutableAttributedString(string: "Yes!", attributes: [NSAttributedString.Key.font: font])
            yesButton.setAttributedTitle(customString, for: .normal)
        } else {
            print("error, font not found...")
        }
        
       
        
        
    }
    
    @IBAction func yes(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func no(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
