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

class ViewController: UIViewController {
    var clothing = [Clothing]()
    
    var accessoryArray = [Clothing]()
    var topArray = [Clothing]()
    var bottomArray = [Clothing]()
    var shoesArray = [Clothing]()
    
    var accessoryIndex: Int = 0
    var topIndex: Int = 0
    var bottomIndex: Int = 0
    var shoesIndex: Int = 0
    
    var accessoryURL = [URL]()
    var topURL = [URL]()
    var bottomURL = [URL]()
    var shoesURL = [URL]()
    
    var buttonPressed = 0
    
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
        }
    }
    
    
    @IBOutlet weak var Bottom: UIImageView! {
        didSet {
            Bottom.isUserInteractionEnabled = true
        }
    }
    
    
    @IBOutlet weak var Shoes: UIImageView! {
        didSet {
            Shoes.isUserInteractionEnabled = true
        }
    }
    
    
    @IBAction func accessoryRight(_ sender: Any) {
        if (accessoryIndex < accessoryArray.count - 1) {
            accessoryIndex += 1
        } else {
            accessoryIndex = 0
        }
        
        if accessoryIndex != 0 {
            AF.request(accessoryURL[accessoryIndex - 1], method: .get).response { response in
                switch response.result {
                case .success(let responseData):
                        self.Accessory.image = UIImage(data: responseData!, scale:1)
                        
                case .failure(let error):
                    print("error--->",error)
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
        }
    }
    
    
    @IBAction func accessoryLeft(_ sender: Any) {
        if accessoryIndex > 0 {
            accessoryIndex -= 1
        } else {
            accessoryIndex = accessoryArray.count - 1
        }
        
        if accessoryIndex != 0 {
            AF.request(accessoryURL[accessoryIndex - 1], method: .get).response { response in
                switch response.result {
                case .success(let responseData):
                        self.Accessory.image = UIImage(data: responseData!, scale:1)
                        
                case .failure(let error):
                    print("error--->",error)
                }
                
            }
        }
    }
    
    @IBAction func topRight(_ sender: Any) {
        if (topIndex < topArray.count - 1) {
            topIndex += 1
        } else {
            topIndex = 0
        }
        
        if topIndex != 0 {
            AF.request(topURL[topIndex - 1], method: .get).response { response in
                switch response.result {
                case .success(let responseData):
                    self.Top.image = UIImage(data: responseData!, scale:1)
                    
                case .failure(let error):
                    print("error--->",error)
                }
                
            }
        }
    }
    
    @IBAction func topLeft(_ sender: Any) {
        if topIndex > 0 {
            topIndex -= 1
        } else {
            topIndex = topArray.count - 1
        }
        
        if topIndex != 0 {
            AF.request(topURL[topIndex - 1], method: .get).response { response in
                switch response.result {
                case .success(let responseData):
                    self.Top.image = UIImage(data: responseData!, scale:1)
                    
                case .failure(let error):
                    print("error--->",error)
                }
                
            }
        }
    }
    
    
    @IBAction func bottomRight(_ sender: Any) {
        if bottomIndex < bottomArray.count - 1 {
            bottomIndex += 1
        } else {
            bottomIndex = 0
        }
        
        if bottomIndex != 0 {
            AF.request(bottomURL[bottomIndex - 1], method: .get).response { response in
                switch response.result {
                case .success(let responseData):
                    self.Bottom.image = UIImage(data: responseData!, scale:1)
                    
                case .failure(let error):
                    print("error--->",error)
                }
                
            }
        }
    }
    
    @IBAction func bottomLeft(_ sender: Any) {
        if bottomIndex > 0 {
            bottomIndex -= 1
        } else {
            bottomIndex = bottomArray.count - 1
        }
        
        if bottomIndex != 0 {
            AF.request(bottomURL[bottomIndex - 1], method: .get).response { response in
                switch response.result {
                case .success(let responseData):
                    self.Bottom.image = UIImage(data: responseData!, scale:1)
                    
                case .failure(let error):
                    print("error--->",error)
                }
                
            }
        }

    }
    
    
    @IBAction func shoesRight(_ sender: Any) {
        if shoesIndex < shoesArray.count - 1{
           shoesIndex += 1
        } else {
            shoesIndex = 0
        }
        
        if shoesIndex != 0 {
            AF.request(shoesURL[shoesIndex - 1], method: .get).response { response in
                switch response.result {
                case .success(let responseData):
                    self.Shoes.image = UIImage(data: responseData!, scale:1)
                    
                case .failure(let error):
                    print("error--->",error)
                }
                
            }
        }
    }
    
    @IBAction func shoesLeft(_ sender: Any) {
        if shoesIndex > 0 {
           shoesIndex -= 1
        } else {
            shoesIndex = shoesArray.count - 1
        }
        
        if shoesIndex != 0 {
            AF.request(shoesURL[shoesIndex - 1], method: .get).response { response in
                switch response.result {
                case .success(let responseData):
                    self.Shoes.image = UIImage(data: responseData!, scale:1)
                    
                case .failure(let error):
                    print("error--->",error)
                }
                
            }
        }
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //queryPosts()
        print(accessoryArray.count)
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
        buttonPressed = 1
        if let tappedView = sender.view {
            performSegue(withIdentifier: "detailSegue", sender: tappedView)
        }
    }
    
    @IBAction func topTapped(_ sender: UITapGestureRecognizer) {
        buttonPressed = 2
        if let tappedView = sender.view {
            performSegue(withIdentifier: "detailSegue", sender: tappedView)
        }
    }
    
    
    @IBAction func bottomTapped(_ sender: UITapGestureRecognizer) {
        buttonPressed = 3
        if let tappedView = sender.view {
            performSegue(withIdentifier: "detailSegue", sender: tappedView)
        }
    }
    
    
    @IBAction func shoesTapped(_ sender: UITapGestureRecognizer) {
        buttonPressed = 4
        if let tappedView = sender.view {
            performSegue(withIdentifier: "detailSegue", sender: tappedView)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "detailSegue",
            //let tappedView = sender as? UIView,
            let detailViewController = segue.destination as? DetailViewController {

            if buttonPressed == 1 {
                detailViewController.info = accessoryArray[accessoryIndex - 1]
                detailViewController.url = accessoryURL[accessoryIndex - 1]
            } else if buttonPressed == 2 {
                detailViewController.info = topArray[topIndex - 1]
                detailViewController.url = topURL[topIndex - 1]
                print("yoohee")
            } else if buttonPressed == 3 {
                detailViewController.info = bottomArray[bottomIndex - 1]
                detailViewController.url = bottomURL[bottomIndex - 1]
            } else if  buttonPressed == 4 {
                detailViewController.info = shoesArray[shoesIndex - 1]
                detailViewController.url = shoesURL[shoesIndex - 1]
            } else {
                print("no button was tapped, please check your selection.")
            }
        }
    }
    
    
    private func queryPosts(completion: (() -> Void)? = nil) {

        let query = Clothing.query()
        
        query.find { [self] result in
            switch result {
            case .success(let clothingURL):
                clothing = clothingURL
                for cloth in clothing{
                    if cloth.type! == "Accessory" {
                        accessoryIndex += 1
                        print(accessoryIndex)
                        if let imageFile = cloth.imageFile,
                           let imageURL = imageFile.url {
                            accessoryURL.append(imageURL)
                        }
                        accessoryArray.append(cloth)
                    }
                    if cloth.type! == "Top" {
                        topIndex += 1
                        if let imageFile = cloth.imageFile,
                           let imageURL = imageFile.url {
                            topURL.append(imageURL)
                        }
                        topArray.append(cloth)
                    }
                    if cloth.type! == "Bottom" {
                        bottomIndex += 1
                        if let imageFile = cloth.imageFile,
                           let imageURL = imageFile.url {
                            bottomURL.append(imageURL)
                        }
                        bottomArray.append(cloth)
                    }
                    if cloth.type! == "Shoes" {
                        shoesIndex += 1
                        if let imageFile = cloth.imageFile,
                           let imageURL = imageFile.url {
                            shoesURL.append(imageURL)
                        }
                        shoesArray.append(cloth)
                    }
                    
                }
                print(clothing.count)
                print("yeehaw")
            case .failure(let error):
                print("i hate this project")
            }
        }
        print("hi")
        
        print(clothing.count)
        
        
        
        completion?()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        queryPosts()
    }
    
}

