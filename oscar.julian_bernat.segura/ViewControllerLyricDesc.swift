//
//  ViewControllerLyricDesc.swift
//  oscar.julian_bernat.segura
//
//

import UIKit

class ViewControllerLyricDesc: UIViewController {

    @IBOutlet weak var titlesong: UILabel!
    @IBOutlet weak var songlyric: UILabel!
    @IBOutlet weak var artist: UILabel!
    var song: Song?
    let defaults = OurUserDefaults.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titlesong.text = (song?.name)!
        artist.text = (song?.artist)!
        songlyric.text = (song?.lyrics)!
        
        setUp()
    }
    
    func setUp() {
        let colorLyric = defaults.getIntFromLocal("ColorSetup")

  
        if colorLyric == 1 {
            songlyric.textColor = UIColor.systemPurple
        } else {
            songlyric.textColor = UIColor.black
        }
        
        let sizeLyric = defaults.getIntFromLocal("SizeSetup")
        songlyric.font = UIFont.systemFont(ofSize: CGFloat(sizeLyric ?? 17))
    }
}

