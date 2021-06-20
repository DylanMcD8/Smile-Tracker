//
//  AboutTableViewController.swift
//  Smile Tracker
//
//  Created by Dylan McDonald on 6/19/21.
//

import UIKit
import SafariServices

class AboutTableViewController: UITableViewController, SFSafariViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.sizeToFit()
        tableView.backgroundView = UIImageView(image: UIImage(named: "Background Pattern")?.withTintColor(UIColor(named: "AccentColor")!))
        tableView.backgroundView?.contentMode = .scaleAspectFill
        tableView.backgroundView?.tintColor = UIColor(named: "AccentColor")
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 5 {
            let urlString = "https://sunapps.org"
            if let url = URL(string: urlString) {
                let vc = SFSafariViewController(url: url)
                vc.preferredControlTintColor = UIColor(named: "AccentColor")
                vc.view.tintColor = UIColor(named: "AccentColor")
                vc.delegate = self
                present(vc, animated: true)
            }
        }
        
        if indexPath.section == 7 {
            
            let urlString = "https://sunapps.org/privacypolicy"
            if let url = URL(string: urlString) {
                let vc = SFSafariViewController(url: url)
                vc.preferredControlTintColor = UIColor(named: "AccentColor")
                vc.view.tintColor = UIColor(named: "AccentColor")
                vc.delegate = self
                present(vc, animated: true)
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
