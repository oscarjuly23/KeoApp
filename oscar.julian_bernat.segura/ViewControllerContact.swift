//
//  ViewControllerContact.swift
//  oscar.julian_bernat.segura
//
//

import Foundation
import UIKit
import MapKit

class ViewControllerContact: UIViewController {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Map
        initMap()
    }
    
    func initMap () {
        let location = CLLocation(latitude: 48.858039, longitude: 2.2945)
        
        setLocation(location.coordinate, "Keoland")
    }
    
    func setLocation(_ coordinate: CLLocationCoordinate2D ,_ title: String?) {
        //Movem el mapa
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: CLLocationDistance(1000) , longitudinalMeters: CLLocationDistance(1000))
        
        map.setRegion(region, animated: true)
        
        //Borrem totes les anotacions existents
        self.map.removeAnnotations(self.map.annotations)
        
        //Creem la nova anotacio
        let annotation = MKPointAnnotation()
        annotation.title = title
        annotation.coordinate = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        map.addAnnotation(annotation)
    }
    
    
    @IBAction func btnTw(_ sender: UIButton) {
        if let url = URL(string: "https://twitter.com/KiddKeo95Flames") {
              UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    @IBAction func btnInsta(_ sender: Any) {
        if let url = URL(string: "https://www.instagram.com/thekiddkeo/") {
              UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    @IBAction func btnYt(_ sender: Any) {
        if let url = URL(string: "https://www.youtube.com/channel/UCBCD1nIuiH-d10_l6Q-8rRg") {
              UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    @IBAction func btnSpty(_ sender: Any) {
        if let url = URL(string: "https://open.spotify.com/artist/0VZrPa7mWAYXH4CwmYk8Km") {
              UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
