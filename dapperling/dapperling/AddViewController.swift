//
//  AddViewController.swift
//  dapperling
//
//  Created by Cadence Chan on 4/5/23.
//

import UIKit

class AddViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setPopupButton()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var PopUpButton: UIButton!
    
    func setPopupButton() {
        let optionClosure = {(action: UIAction) in
            print(action.title)}
        
        PopUpButton.menu = UIMenu(children : [
            UIAction(title: "Shoes", state : .on, handler: optionClosure),
            UIAction(title: "Bottom", handler: optionClosure),
            UIAction(title: "Top", handler: optionClosure),
            UIAction(title: "Accessory", handler: optionClosure)
        ])
        
        PopUpButton.showsMenuAsPrimaryAction = true
        PopUpButton.changesSelectionAsPrimaryAction = true
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