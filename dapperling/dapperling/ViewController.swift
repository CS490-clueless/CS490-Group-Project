//
//  ViewController.swift
//  dapperling
//
//  Created by Chloe Yao on 3/6/23.
//

import UIKit
import ParseSwift

class ViewController: UIViewController {



    
    @IBOutlet weak var Accessory: UIImageView! {
        didSet {
            Accessory.isUserInteractionEnabled = true
            Accessory.image = UIImage(named: "PurdueLogo")
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func onLogOutTapped(_ sender: Any) {
        print("logout pressed")
        showConfirmLogoutAlert()
    }
    
    private func showConfirmLogoutAlert() {
        let alertController = UIAlertController(title: "Log out of \(User.current?.username ?? "current account")?", message: nil, preferredStyle: .alert)
        let logOutAction = UIAlertAction(title: "Log out", style: .destructive) { _ in
            NotificationCenter.default.post(name: Notification.Name("logout"), object: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(logOutAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    
    
    @IBAction func accessoryTapped(_ sender: UITapGestureRecognizer) {
        if let tappedView = sender.view {
            performSegue(withIdentifier: "detailSegue", sender: tappedView)
        }
    }
    
    
}

