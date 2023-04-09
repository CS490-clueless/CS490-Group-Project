//
//  detailViewController.swift
//  dapperling
//
//  Created by Cadence Chan on 4/9/23.
//

import UIKit
import Alamofire
import AlamofireImage

class DetailViewController: UIViewController {
    
    @IBOutlet weak var pageImage: UIImageView!
    
    @IBOutlet weak var pagePrice: UILabel!
    
    @IBOutlet weak var pageStore: UILabel!
    
    @IBOutlet weak var pageDate: UILabel!
    
    var info: Clothing?
    var url: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        pagePrice.text = "$$"
//        pageStore.text = "store"
//        pageDate.text = "date"
//        pageImage.image = UIImage(named: "PurdueLogo")!
//
            print((info?.objectId)!)
            print((info?.price)!)
            pagePrice.text = (info?.price)!
            pageStore.text = (info?.store)!
            pageDate.text = (info?.date)!
            //pageImage.image = UIImage(named: "PurdueLogo")!
            AF.request(url!, method: .get).response { response in
            switch response.result {
            case .success(let responseData):
                self.pageImage.image = UIImage(data: responseData!, scale:1)
                
            case .failure(let error):
                print("error--->",error)
            }
            
        }
        

        // Do any additional setup after loading the view.
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
