//
//  ViewController.swift
//  dapperling
//
//  Created by Chloe Yao on 3/6/23.
//

import UIKit
import ParseSwift
import Alamofire
import AlamofireImage
import Firebase

class ViewController: UIViewController {
    
    static var accessoryArray = [Clothing]()
    static var topArray = [Clothing]()
    static var bottomArray = [Clothing]()
    static var shoesArray = [Clothing]()
    
    static var accessoryIndex: Int = 0
    static var topIndex: Int = 0
    static var bottomIndex: Int = 0
    static var shoesIndex: Int = 0
    
    static var accessoryURL = [URL]()
    static var topURL = [URL]()
    static var bottomURL = [URL]()
    static var shoesURL = [URL]()
    
    private var imageDataRequest: DataRequest?
    
    @IBOutlet weak var Accessory: UIImageView! {
        didSet {
            Accessory.isUserInteractionEnabled = true
            //            Accessory.image = UIImage(named: "PurdueLogo")
        }
    }
    
    
    
    @IBOutlet weak var Top: UIImageView! {
        didSet {
            Top.isUserInteractionEnabled = true
            if ViewController.topIndex != 0 {
                if let imageURL = ViewController.topArray[ViewController.topIndex].imageFile{
                    imageDataRequest = AF.request(imageURL).responseImage { [weak self] response in
                        switch response.result {
                        case .success(let image):
                            // Set image view image with fetched image
                            self?.Top.image = image
                        case .failure(let error):
                            print("❌ Error fetching image: \(error.localizedDescription)")
                            break
                        }
                    }
                }
            } else {
                Top.image = UIImage(named: "PurdueLogo")
            }
        }
    }
    
    
    @IBOutlet weak var Bottom: UIImageView! {
        didSet {
            Bottom.isUserInteractionEnabled = true
            if ViewController.bottomIndex != 0 {
                if let imageURL = ViewController.bottomArray[ViewController.bottomIndex].imageFile{
                    imageDataRequest = AF.request(imageURL).responseImage { [weak self] response in
                        switch response.result {
                        case .success(let image):
                            // Set image view image with fetched image
                            self?.Bottom.image = image
                        case .failure(let error):
                            print("❌ Error fetching image: \(error.localizedDescription)")
                            break
                        }
                    }
                }
            } else {
                Bottom.image = UIImage(named: "PurdueLogo")
            }
        }
    }
    
    
    @IBOutlet weak var Shoes: UIImageView! {
        didSet {
            Shoes.isUserInteractionEnabled = true
            if ViewController.shoesIndex != 0 {
                if let imageURL = ViewController.shoesArray[ViewController.shoesIndex].imageFile{
                    imageDataRequest = AF.request(imageURL).responseImage { [weak self] response in
                        switch response.result {
                        case .success(let image):
                            // Set image view image with fetched image
                            self?.Shoes.image = image
                        case .failure(let error):
                            print("❌ Error fetching image: \(error.localizedDescription)")
                            break
                        }
                    }
                }
            } else {
                Shoes.image = UIImage(named: "PurdueLogo")
            }
        }
    }
    
    
    @IBAction func accessoryRight(_ sender: Any) {
        if ViewController.accessoryIndex < ViewController.accessoryArray.count {
            ViewController.accessoryIndex += 1
        } else {
            ViewController.accessoryIndex = 0
        }
        
        print(ViewController.accessoryIndex)
        print(String(ViewController.accessoryIndex))
        
        if ViewController.accessoryIndex != 0 {
            print(ViewController.accessoryArray[ViewController.accessoryIndex - 1].price)
            print(ViewController.accessoryArray[ViewController.accessoryIndex - 1].imageFile)
            if let imageURL =  ViewController.accessoryArray[ViewController.accessoryIndex - 1].imageFile, let url = URL(string: imageURL) {
                Accessory.af.setImage(withURL: url)
                
                
            }
        }
    }

            
//            let imageURL = URL(string: "https://parsefiles.back4app.com/VrmslyE8hYXfRM3HuiRK8YO97qPIqx2BzqzFqJ0m/d694fb0803afeb5ec38aaef52c5c8af0_image.jpg")! {
//                imageDataRequest = AF.request(imageURL).responseImage { [weak self] response in
//                    switch response.result {
//                    case .success(let image):
//                        // Set image view image with fetched image
//                        self?.Accessory.image = image
//                    case .failure(let error):
//                        print("❌ Error fetching image: \(error.localizedDescription)")
//                        break
//                    }
//                }
//            }

    
    
    @IBAction func accessoryLeft(_ sender: Any) {
        if ViewController.accessoryIndex > 0 {
            ViewController.accessoryIndex -= 1
        } else {
            ViewController.accessoryIndex = ViewController.accessoryArray.count - 1
        }
        
        if ViewController.accessoryIndex != 0 {
            if let imageURL =  ViewController.accessoryArray[ViewController.accessoryIndex - 1].imageFile{
                print(imageURL)
                AF.request(imageURL as URLConvertible, method: .get).response{ response in
                    
                    switch response.result {
                    case .success(let responseData):
                        self.Accessory.image = UIImage(data: responseData!, scale:1)
                        
                    case .failure(let error):
                        print("error--->",error)
                    }
                }
            }
        }
    }
    
    @IBAction func topRight(_ sender: Any) {
        if ViewController.topIndex < ViewController.topArray.count {
            ViewController.topIndex += 1
        } else {
            ViewController.topIndex = 0
        }
        
        if ViewController.topIndex != 0 {
            if let imageURL =  ViewController.topArray[ViewController.topIndex - 1].imageFile{
                print(imageURL)
                AF.request(imageURL as! URLConvertible, method: .get).response{ response in
                    
                    switch response.result {
                    case .success(let responseData):
                        self.Top.image = UIImage(data: responseData!, scale:1)
                        
                    case .failure(let error):
                        print("error--->",error)
                    }
                }
            }
        }
    }
    
    @IBAction func topLeft(_ sender: Any) {
        if ViewController.topIndex > 0 {
            ViewController.topIndex -= 1
        } else {
            ViewController.topIndex = ViewController.topArray.count - 1
        }
        
        if ViewController.topIndex != 0 {
            if let imageURL =  ViewController.topArray[ViewController.topIndex - 1].imageFile{
                print(imageURL)
                AF.request(imageURL, method: .get).response{ response in
                    
                    switch response.result {
                    case .success(let responseData):
                        self.Top.image = UIImage(data: responseData!, scale:1)
                        
                    case .failure(let error):
                        print("error--->",error)
                    }
                }
            }
        }
    }
    
    
    @IBAction func bottomRight(_ sender: Any) {
        if ViewController.bottomIndex < ViewController.bottomArray.count {
            ViewController.bottomIndex += 1
        } else {
            ViewController.bottomIndex = 0
        }
        
        if ViewController.topIndex != 0 {
            if let imageURL =  ViewController.bottomArray[ViewController.bottomIndex - 1].imageFile{
                print(imageURL)
                AF.request(imageURL, method: .get).response{ response in
                    
                    switch response.result {
                    case .success(let responseData):
                        self.Bottom.image = UIImage(data: responseData!, scale:1)
                        
                    case .failure(let error):
                        print("error--->",error)
                    }
                }
            }
        }
    }
    
    @IBAction func bottomLeft(_ sender: Any) {
        if ViewController.bottomIndex > 0 {
            ViewController.bottomIndex -= 1
        } else {
            ViewController.bottomIndex = ViewController.bottomArray.count - 1
        }
        
        if ViewController.topIndex != 0 {
            if let imageURL =  ViewController.bottomArray[ViewController.bottomIndex - 1].imageFile{
                print(imageURL)
                AF.request(imageURL, method: .get).response{ response in
                    
                    switch response.result {
                    case .success(let responseData):
                        self.Bottom.image = UIImage(data: responseData!, scale:1)
                        
                    case .failure(let error):
                        print("error--->",error)
                    }
                }
            }
        }

    }
    
    
    @IBAction func shoesRight(_ sender: Any) {
        if ViewController.shoesIndex < ViewController.shoesArray.count {
            ViewController.shoesIndex += 1
        } else {
            ViewController.shoesIndex = 0
        }
        
        if ViewController.shoesIndex != 0 {
            if let imageURL =  ViewController.shoesArray[ViewController.shoesIndex - 1].imageFile{
                print(imageURL)
                AF.request(imageURL, method: .get).response{ response in
                    
                    switch response.result {
                    case .success(let responseData):
                        self.Shoes.image = UIImage(data: responseData!, scale:1)
                        
                    case .failure(let error):
                        print("error--->",error)
                    }
                }
            }
        }
    }
    
    @IBAction func shoesLeft(_ sender: Any) {
        if ViewController.shoesIndex > 0 {
            ViewController.shoesIndex -= 1
        } else {
            ViewController.shoesIndex = ViewController.shoesArray.count - 1
        }
        
        if ViewController.shoesIndex != 0 {
            if let imageURL =  ViewController.shoesArray[ViewController.shoesIndex - 1].imageFile{
                print(imageURL)
                AF.request(imageURL, method: .get).response{ response in
                    
                    switch response.result {
                    case .success(let responseData):
                        self.Shoes.image = UIImage(data: responseData!, scale:1)
                        
                    case .failure(let error):
                        print("error--->",error)
                    }
                }
            }
        }
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func onLogOutTapped(_ sender: Any) {
        do {
            try Firebase.Auth.auth().signOut()
        }
        catch {
            print("No user signed in!")
        }
        
        let main = UIStoryboard(name:"Main", bundle:nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "loginViewController")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else {return}
        
        delegate.window?.rootViewController = loginViewController
//        print("logout pressed")
//        showConfirmLogoutAlert()
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
    
    @IBAction func topTapped(_ sender: UITapGestureRecognizer) {
        if let tappedView = sender.view {
            performSegue(withIdentifier: "detailSegue", sender: tappedView)
        }
    }
    
    
    @IBAction func bottomTapped(_ sender: UITapGestureRecognizer) {
        if let tappedView = sender.view {
            performSegue(withIdentifier: "detailSegue", sender: tappedView)
        }
    }
    
    
    @IBAction func shoesTapped(_ sender: UITapGestureRecognizer) {
        if let tappedView = sender.view {
            performSegue(withIdentifier: "detailSegue", sender: tappedView)
        }
    }
}
    


