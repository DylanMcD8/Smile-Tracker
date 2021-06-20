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
    
    @IBOutlet weak var lineSeparatorView: UIView!
    @IBOutlet weak var mainStackView: UIStackView!
    
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
        
        if isInPortraitMode {
            mainStackView.axis = .vertical
            lineSeparatorView.isHidden = false
        } else {
            mainStackView.axis = .horizontal
            lineSeparatorView.isHidden = true
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
        
        let notificationCenter = UNUserNotificationCenter.current()
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        notificationCenter.requestAuthorization(options: options) {
            (didAllow, error) in
            if !didAllow {
                print("User has declined notifications")
            }
        }
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isPortrait {
            mainStackView.axis = .vertical
            lineSeparatorView.isHidden = false
        } else {
            mainStackView.axis = .horizontal
            lineSeparatorView.isHidden = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        daysLeftLabel.text = String(UserDefaults.standard.integer(forKey: "sync DaysLeft"))
        currentSetLabel.text = String(UserDefaults.standard.integer(forKey: "sync CurrentSet"))
    }

//    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//        if isInPortraitMode {
//            mainStackView.axis = .vertical
//            lineSeparatorView.isHidden = false
//        } else {
//            mainStackView.axis = .horizontal
//            lineSeparatorView.isHidden = true
//        }
//    }
    
}

class AllNavigationControllers: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        if let font = UIFont(name: "Proxima Nova Bold", size: 22) {
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: font], for: .selected)
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: font], for: .highlighted)
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: font], for: .focused)
        } else {
            print("font not found!")
        }
    }
}

public var isInPortraitMode: Bool {
    return UIDevice.current.orientation.isPortrait
}
