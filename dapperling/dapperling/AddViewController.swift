
//  AddViewController.swift
//  dapperling
//
//  Created by Cadence Chan on 4/5/23.
//

import UIKit
import ParseSwift
import PhotosUI
import Firebase
import FirebaseStorage

class AddViewController: UIViewController{

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setPopupButton()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var PopUpButton: UIButton!
    
    @IBOutlet weak var priceText: UITextField!
    
    @IBOutlet weak var storeText: UITextField!
    
    @IBOutlet weak var dateText: UITextField!
    
    @IBOutlet weak var articleButton: UIButton!
    
    @IBOutlet weak var previewImage: UIImageView!
    
    private var pickedImage: `UIImage`?
    
    var typeString: String?


    
    
    @IBAction func addItemPressed(_ sender: Any) {
        var newClothing = Clothing()
        
        guard let imageData = previewImage.image?.pngData() else {
            print("no image data")
            return
        }
        
        let storageRef = FirebaseStorage.Storage.storage().reference()
        guard let userUID = Firebase.Auth.auth().currentUser?.uid else {
            print("can't get current user")
            return
        }
        
        let fileRef = storageRef.child("\(userUID)/\(Date().timeIntervalSince1970.formatted()).png")
        
        let uploadTask = fileRef.putData(imageData, metadata: nil){metadata, error in
            guard metadata != nil else {return}
            if let e = error {
                print(e.localizedDescription)
                return
            }
            
            var image: String?
            
            fileRef.downloadURL {url, error in
                if let e = error{
                    print(e.localizedDescription)
                    return
                }
                
                guard let u = url else{
                    print("unable to get photo url")
                    return
                }
                
                var post:[String:Any] = [String:Any]()
                post["price"] = self.priceText.text
                post["store"] = self.storeText.text
                post["date"] = self.dateText.text
                post["type"] = self.typeString!
                post["image"] = u.absoluteString
                
                
                guard let username = Firebase.Auth.auth().currentUser?.email else {
                    print("Cannot set author of post")
                    return
                }
                
                newClothing.store = self.storeText.text
                newClothing.price = self.priceText.text
                newClothing.date = self.dateText.text
                newClothing.type = self.typeString!
                fileRef.downloadURL{anotherURL, error in
                    guard let a = anotherURL else {
                        print("bad")
                        return
                    }
                    
                    newClothing.imageFile = a.absoluteString
                }
                
                let postID = "\(userUID)-post\(Date().timeIntervalSince1970.formatted())"
                
                let db = Firestore.firestore()
                db.collection("Clothing").document(postID).setData(post) {error in
                    if let e = error {
                        print(e.localizedDescription)
                        return
                    }
                    
                    print("Post sucessfully written!")
                    self.navigationController?.popViewController(animated: true)
                }
            }
            
//            if self.typeString! == "Accessory" {
//                ViewController.accessoryURL.append(URL(string: image!)!)
//            }
//            if self.typeString! == "Top" {
//                ViewController.topURL.append(URL(string: image!)!)
//            }
//            if self.typeString! == "Bottom" {
//                ViewController.bottomURL.append(URL(string: image!)!)
//            }
//            if self.typeString! == "Shoes" {
//                ViewController.shoesURL.append(URL(string: image!)!)
//            }
        
            
        
            
            if self.typeString! == "Accessory" {
                ViewController.accessoryArray.append(newClothing)
            }
            if self.typeString! == "Top" {
                ViewController.topArray.append(newClothing)
            }
            if self.typeString! == "Bottom" {
                ViewController.bottomArray.append(newClothing)
            }
            if self.typeString! == "Shoes" {
                ViewController.shoesArray.append(newClothing)
            }
        }
        
        
        
        
        
//        var newClothing = Clothing()
//        newClothing.store = storeText.text
//        newClothing.price = priceText.text
//        newClothing.date = dateText.text
//        newClothing.type = typeString!
//        guard let image = pickedImage,
//              // Create and compress image data (jpeg) from UIImage
//              let imageData = image.jpegData(compressionQuality: 0.1) else {
//            return
//        }
//        newClothing.imageFile = ParseFile(name: "image.jpg", data: imageData)
//
//        if typeString! == "Accessory" {
//            ViewController.accessoryArray.append(newClothing)
//        }
//        if typeString! == "Top" {
//            ViewController.topArray.append(newClothing)
//        }
//        if typeString! == "Bottom" {
//            ViewController.bottomArray.append(newClothing)
//        }
//        if typeString! == "Shoes" {
//            ViewController.shoesArray.append(newClothing)
//        }
//
//
//
//        // Save object in background (async)
//        newClothing.save { [weak self] result in
//
//            // Switch to the main thread for any UI updates
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let newClothing):
//                    print("✅ Post Saved!")
//
//                    // Return to previous view controller
//                    self?.navigationController?.popViewController(animated: true)
//
//                case .failure(let error):
//                    print("haha xd")
//                }
//            }
//        }
//
//        if typeString! == "Accessory" {
//            ViewController.accessoryArray.append(newClothing)
//        }
//        if typeString! == "Top" {
//            ViewController.topArray.append(newClothing)
//        }
//        if typeString! == "Bottom" {
//            ViewController.bottomArray.append(newClothing)
//        }
//        if typeString! == "Shoes" {
//            ViewController.shoesArray.append(newClothing)
//        }
        
    }
    
    
    func setPopupButton() {
        let optionClosure = {(action: UIAction) in
            print(action.title)
            self.typeString = action.title
        }
    
        PopUpButton.menu = UIMenu(children : [
            UIAction(title: "Shoes", state : .on, handler: optionClosure),
            UIAction(title: "Bottom", handler: optionClosure),
            UIAction(title: "Top", handler: optionClosure),
            UIAction(title: "Accessory", handler: optionClosure)
        ])
        PopUpButton.showsMenuAsPrimaryAction = true
        PopUpButton.changesSelectionAsPrimaryAction = true
    }
    
    
    @IBAction func chooseImage(_ sender: Any) {
        
        // TODO: Pt 1 - Present Image picker
        // Create a configuration object
        var config = PHPickerConfiguration()

        // Set the filter to only show images as options (i.e. no videos, etc.).
        config.filter = .images

        // Request the original file format. Fastest method as it avoids transcoding.
        config.preferredAssetRepresentationMode = .current

        // Only allow 1 image to be selected at a time.
        config.selectionLimit = 1

        // Instantiate a picker, passing in the configuration.
        let picker = PHPickerViewController(configuration: config)

        // Set the picker delegate so we can receive whatever image the user picks.
        picker.delegate = self

        // Present the picker
        present(picker, animated: true)
        
//        let imagePickerVC = UIImagePickerController()
//                imagePickerVC.sourceType = .photoLibrary
//                imagePickerVC.delegate = self // new
//                present(imagePickerVC, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)

        if let image = info[.originalImage] as? UIImage {
            previewImage.image = image
        }
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AddViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        // Dismiss the picker
        picker.dismiss(animated: true)

        // Make sure we have a non-nil item provider
        guard let provider = results.first?.itemProvider,
           // Make sure the provider can load a UIImage
           provider.canLoadObject(ofClass: UIImage.self) else { return }

        // Load a UIImage from the provider
        provider.loadObject(ofClass: UIImage.self) { [weak self] object, error in

           // Make sure we can cast the returned object to a UIImage
           guard let image = object as? UIImage else {

              // ❌ Unable to cast to UIImage
              print("u failed haha xd")
              return
           }

           // Check for and handle any errors
           if let error = error {
               print("u failed haha xd")
               return
           } else {

              // UI updates (like setting image on image view) should be done on main thread
              DispatchQueue.main.async {

                 // Set image on preview image view
                 self?.previewImage.image = image

                 // Set image to use when saving post
                 self?.pickedImage = image
              }
           }
        }
    }
    

}
