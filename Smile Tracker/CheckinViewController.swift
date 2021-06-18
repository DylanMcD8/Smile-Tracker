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
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var fullImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonsContainer.layer.cornerCurve = .continuous
        buttonsContainer.layer.cornerRadius = 45
        
        if traitCollection.horizontalSizeClass == .compact {
            leftImage.isHidden = false
            rightImage.isHidden = false
            fullImage.isHidden = true
        } else {
            leftImage.isHidden = true
            rightImage.isHidden = true
            fullImage.isHidden = false
        }
        
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
        let currentNumber =  UserDefaults.standard.integer(forKey: "sync DaysLeft")
        
        if currentNumber == 1 {
            UserDefaults.standard.set(14, forKey: "sync DaysLeft")
            let currentSet = UserDefaults.standard.integer(forKey: "sync CurrentSet")
            UserDefaults.standard.set(currentSet + 1, forKey: "sync CurrentSet")
        } else {
            UserDefaults.standard.set(currentNumber - 1, forKey: "sync DaysLeft")
        }
       
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func no(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if traitCollection.horizontalSizeClass == .compact {
            leftImage.isHidden = false
            rightImage.isHidden = false
            fullImage.isHidden = true
        } else {
            leftImage.isHidden = true
            rightImage.isHidden = true
            fullImage.isHidden = false
        }
    }
    
    
}
