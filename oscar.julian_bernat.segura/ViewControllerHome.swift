//
//  ViewController.swift
//  oscar.julian_bernat.segura
//
//

import UIKit

class ViewControllerHome: UIViewController {
    let album:[String] = ["1_kiddkeo","2_kiddkeo","3_kiddkeo","4_kiddkeo","5_kiddkeo","1_kiddkeo"]


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.navigationItem.leftItemsSupplementBackButton = nil
        self.navigationController?.navigationBar.isHidden = true
    }
    

    @IBOutlet weak var myButton: UIButton!
    
    @IBAction func buttonImage(_ sender: Any) {
        let count = Int.random(in: 0..<6)
        myButton.setImage(UIImage(named: album[count]), for: UIControl.State.normal)
    }
}

