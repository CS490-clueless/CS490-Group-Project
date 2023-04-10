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
        print(accessoryIndex)
        print(accessoryArray.count)
        if (accessoryIndex < (accessoryArray.count)) {
            print("incremented!")
            accessoryIndex += 1
        } else {
            accessoryIndex = 1
        }
        
        //update uiimageview
        if accessoryIndex != 0 {
            AF.request(accessoryURL[(accessoryIndex) - 1], method: .get).response { response in
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
        if accessoryIndex > 1 {
            accessoryIndex -= 1
        } else {
            accessoryIndex = accessoryArray.count
        }
        
        //update uiimageview
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
        if (topIndex < topArray.count) {
            topIndex += 1
        } else {
            topIndex = 1
        }
        
        //update uiimageview
        if topArray.count != 0 {
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
        if topIndex > 1 {
            topIndex -= 1
        } else {
            topIndex = topArray.count
        }
        
        //update uiimageview
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
        if bottomIndex < bottomArray.count {
            bottomIndex += 1
        } else {
            bottomIndex = 1
        }
        
        //update uiimageview
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
        if bottomIndex > 1 {
            bottomIndex -= 1
        } else {
            bottomIndex = bottomArray.count
        }
        
        //update uiimageview
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
        if shoesIndex < shoesArray.count{
           shoesIndex += 1
        } else {
            shoesIndex = 1
        }
        
        //update uiimageview
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
        if shoesIndex > 1 {
           shoesIndex -= 1
        } else {
            shoesIndex = shoesArray.count
        }
        
        //update uiimageview
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
    
    
    @IBAction func saveOutfitTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Outfit Saved!", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        accessoryIndex = 0
//        topIndex = 0
//        bottomIndex = 0
//        shoesIndex = 0
        print("viewloading")
       // print(accessoryArray.count)
        
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
        //send info over to detailviewcontroller

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
        print((User.current?.objectId)!)
        //empty then reinitialize all arrays using query
        accessoryArray.removeAll()
        topArray.removeAll()
        bottomArray.removeAll()
        shoesArray.removeAll()
        accessoryURL.removeAll()
        topURL.removeAll()
        bottomURL.removeAll()
        shoesURL.removeAll()
        print("removed")

        let query = Clothing.query().includeAll().where("user" == (User.current?.objectId)!)
        
        query.find { [self] result in
            switch result {
            case .success(let clothingURL):
                //initialize all the arraylists
                print(clothingURL.count)
                clothing = clothingURL
                for cloth in clothing{
                    if cloth.type! == "Accessory" {
                        //accessoryIndex += 1
                        print(accessoryIndex)
                        if let imageFile = cloth.imageFile,
                           let imageURL = imageFile.url {
                            accessoryURL.append(imageURL)
                        }
                        accessoryArray.append(cloth)
                    }
                    if cloth.type! == "Top" {
                        //topIndex += 1
                        if let imageFile = cloth.imageFile,
                           let imageURL = imageFile.url {
                            topURL.append(imageURL)
                        }
                        topArray.append(cloth)
                    }
                    if cloth.type! == "Bottom" {
                        //bottomIndex += 1
                        if let imageFile = cloth.imageFile,
                           let imageURL = imageFile.url {
                            bottomURL.append(imageURL)
                        }
                        bottomArray.append(cloth)
                    }
                    if cloth.type! == "Shoes" {
                        //shoesIndex += 1
                        if let imageFile = cloth.imageFile,
                           let imageURL = imageFile.url {
                            shoesURL.append(imageURL)
                        }
                        shoesArray.append(cloth)
                    }
                    
                }
                //set original clothings when app is first opened
                print(clothing.count)
                if (accessoryURL.count != 0) {
                    if (accessoryIndex == 0) {
                        accessoryIndex = 1
                        //just opened app, there is stuff in the arraylist, so index 1 to make
                        //sure the first item in arraylist is initally displayed
                        AF.request(accessoryURL[0], method: .get).response { response in
                            switch response.result {
                            case .success(let responseData):
                                self.Accessory.image = UIImage(data: responseData!, scale:1)
                                
                            case .failure(let error):
                                print("error--->",error)
                            }
                        }
                    } else {
                        //came back to main screen from one of the other views, so index
                        //does not need to initialzied
                        AF.request(accessoryURL[accessoryIndex - 1], method: .get).response { response in
                            switch response.result {
                            case .success(let responseData):
                                self.Accessory.image = UIImage(data: responseData!, scale:1)
                                
                            case .failure(let error):
                                print("error--->",error)
                            }
                        }
                    }
                } else {
                    Accessory.image = UIImage(named: "cap")
                }
                if (topURL.count != 0) {
                    if (topIndex == 0) {
                        //just opened app, there is stuff in the arraylist, so index 1 to make
                        //sure the first item in arraylist is initally displayed
                        topIndex = 1
                        AF.request(topURL[0], method: .get).response { response in
                            switch response.result {
                            case .success(let responseData):
                                self.Top.image = UIImage(data: responseData!, scale:1)
                                
                            case .failure(let error):
                                print("error--->",error)
                            }
                        }
                    } else {
                        //came back to main screen from one of the other views, so index
                        //does not need to initialzied
                        AF.request(topURL[topIndex - 1], method: .get).response { response in
                            switch response.result {
                            case .success(let responseData):
                                self.Top.image = UIImage(data: responseData!, scale:1)
                                
                            case .failure(let error):
                                print("error--->",error)
                            }
                        }
                    }
                } else {
                    Top.image = UIImage(named: "shirt")
                }
                if (bottomURL.count != 0) {
                    if (bottomIndex == 0) {
                        bottomIndex = 1
                        //just opened app, there is stuff in the arraylist, so index 1 to make
                        //sure the first item in arraylist is initally displayed
                        AF.request(bottomURL[0], method: .get).response { response in
                            switch response.result {
                            case .success(let responseData):
                                self.Bottom.image = UIImage(data: responseData!, scale:1)
                                
                            case .failure(let error):
                                print("error--->",error)
                            }
                        }
                    } else {
                        //came back to main screen from one of the other views, so index
                        //does not need to initialzied
                        AF.request(bottomURL[bottomIndex - 1], method: .get).response { response in
                            switch response.result {
                            case .success(let responseData):
                                self.Bottom.image = UIImage(data: responseData!, scale:1)
                                
                            case .failure(let error):
                                print("error--->",error)
                            }
                        }
                    }
                } else {
                    Bottom.image = UIImage(named: "pants")
                }
                
                if (shoesURL.count != 0) {
                    if (shoesIndex == 0) {
                        shoesIndex = 1
                        //just opened app, there is stuff in the arraylist, so index 1 to make
                        //sure the first item in arraylist is initally displayed
                        AF.request(shoesURL[0], method: .get).response { response in
                            switch response.result {
                            case .success(let responseData):
                                self.Shoes.image = UIImage(data: responseData!, scale:1)
                                
                            case .failure(let error):
                                print("error--->",error)
                            }
                        }
                    } else {
                        //came back to main screen from one of the other views, so index
                        //does not need to initialzied
                        AF.request(shoesURL[bottomIndex - 1], method: .get).response { response in
                            switch response.result {
                            case .success(let responseData):
                                self.Shoes.image = UIImage(data: responseData!, scale:1)
                                
                            case .failure(let error):
                                print("error--->",error)
                            }
                        }
                    }
                } else {
                    Shoes.image = UIImage(named: "shoes")
                }
                print("yeehaw")
            case .failure(let error):
                print("i hate this project")
            }
        }
       // print("hi")
        
        //print(clothing.count)
        
        
        
        completion?()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if var currentUser = User.current {

            // Update the `lastPostedDate` property on the user with the current date.
           // currentUser.lastPostedDate = Date()

            // Save updates to the user (async)
            currentUser.save { [weak self] result in
                switch result {
                case .success(let user):
                    print("✅ User Saved! \(user)")

                    // Switch to the main thread for any UI updates
                    DispatchQueue.main.async {
                        // Return to previous view controller
                        self?.navigationController?.popViewController(animated: true)
                    }

                case .failure(let error):
                    print("failed")
                }
            }
        }

        queryPosts()
    }
    
}

