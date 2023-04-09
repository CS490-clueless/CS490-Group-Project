
//  AddViewController.swift
//  dapperling
//
//  Created by Cadence Chan on 4/5/23.
//

import UIKit
import ParseSwift
import PhotosUI

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
    
    private var pickedImage: `UIImage`?
    
    var typeString: String?


    
    
    @IBAction func addItemPressed(_ sender: Any) {
        var newClothing = Clothing()
        newClothing.store = storeText.text
        newClothing.price = priceText.text
        newClothing.date = dateText.text
        newClothing.type = typeString!
        guard let image = pickedImage,
              // Create and compress image data (jpeg) from UIImage
              let imageData = image.jpegData(compressionQuality: 0.1) else {
            return
        }
        newClothing.imageFile = ParseFile(name: "image.jpg", data: imageData)
        
        if typeString! == "Accessory" {
            ViewController.accessoryArray.append(newClothing)
        }
        if typeString! == "Top" {
            ViewController.topArray.append(newClothing)
        }
        if typeString! == "Bottom" {
            ViewController.bottomArray.append(newClothing)
        }
        if typeString! == "Shoes" {
            ViewController.shoesArray.append(newClothing)
        }
        
        
        
        // Save object in background (async)
        newClothing.save { [weak self] result in
            
            // Switch to the main thread for any UI updates
            DispatchQueue.main.async {
                switch result {
                case .success(let newClothing):
                    print("✅ Post Saved!")
                    
                    // Return to previous view controller
                    self?.navigationController?.popViewController(animated: true)
                    
                case .failure(let error):
                    print("haha xd")
                }
            }
        }
        
        if typeString! == "Accessory" {
            ViewController.accessoryArray.append(newClothing)
        }
        if typeString! == "Top" {
            ViewController.topArray.append(newClothing)
        }
        if typeString! == "Bottom" {
            ViewController.bottomArray.append(newClothing)
        }
        if typeString! == "Shoes" {
            ViewController.shoesArray.append(newClothing)
        }
        
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
    
    @IBOutlet weak var previewImage: UIImageView!
    
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
