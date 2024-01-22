//
//  ViewControllerProfile.swift
//  oscar.julian_bernat.segura
//
//

import UIKit

class ViewControllerProfile: UIViewController {
    let defaults = OurUserDefaults.init()

    @IBOutlet weak var lblSize: UILabel!
    @IBOutlet weak var stepperBtn: UIStepper!
    @IBOutlet weak var colorChange: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let size = defaults.getIntFromLocal("SizeSetup")
        
        colorChange.selectedSegmentIndex = defaults.getIntFromLocal("ColorSetup") ?? 0
        if var size1 = size {
            if size1 == 0 {
                size1 = 17
            }
            stepperBtn.value = Double(size1)
            lblSize.font = UIFont.systemFont(ofSize: CGFloat(size1))
            lblSize.text = Int(size1).description
        } else {
            stepperBtn.value = 17
        }
    }
    
    @IBAction func stepperChange(_ sender: UIStepper) {
        lblSize.text = Int(sender.value).description
        defaults.saveIntToLocal(Int(sender.value), "SizeSetup")
        lblSize.font = UIFont.systemFont(ofSize: CGFloat(sender.value))        
    }
    @IBAction func controlColor(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        self.defaults.saveIntToLocal(sender.selectedSegmentIndex, "ColorSetup")
    }

    


}

