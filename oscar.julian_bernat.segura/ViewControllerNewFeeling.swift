//
//  ViewControllerNewFeeling.swift
//  oscar.julian_bernat.segura
//
//

import UIKit

class ViewControllerNewFeeling: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfArtist: UITextField!
    @IBOutlet weak var tfLyrics: UITextField!
    
    var addSongTable : (_ name: String, _ artist: String, _ Lyrics: String, _ view: UIViewController) -> Void = {arg, arg2, arg3, arg4 in}

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func addSong(_ sender: UIButton) {
        if (!tfName.text!.isEmpty && !tfArtist.text!.isEmpty && !tfLyrics.text!.isEmpty ) {
            addSongTable(tfName.text ?? "NoName", tfArtist.text ?? "NoName", tfLyrics.text ?? "NoName", self)
        } else {
            DispatchQueue.main.async {
                self.showAlert("Error on add new song", self)
            }
        }
    }
    
    func showAlert(_ txt:String, _ view : UIViewController ) {
        let dialogMessage = UIAlertController(title: txt, message: "", preferredStyle: UIAlertController.Style.actionSheet)
        let acept = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in })
        dialogMessage.addAction(acept)
        view.present(dialogMessage, animated: true, completion: nil)
    }
}

