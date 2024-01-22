//
//  DataAPI.swift
//  oscar.julian_bernat.segura
//
//

import Foundation
import UIKit

class dataAPI {
    
    let cache = OurUserDefaults.init()
    //let feel = ViewControllerNewFeeling.init()
    
    func getData(info tableInfo: Any, updateView: @escaping (String) -> Void) {
        if let lastTime = self.cache.timeTillLastUpdate() {
            let now = Date().timeIntervalSince1970
            if lastTime + (5*60) > now {
                // LOCAL
                print("From local")
                updateView(self.cache.getDataFromLocal() ?? "")
                return
            }
        }
        print("From api")

        let session = URLSession.shared
        let url = URL(string: "https://kidkeo.herokuapp.com/songs")
        if let url = url {
            let task = session.dataTask(with: url) { data, response, error in
                // ERRORS LOCALS:
                guard error == nil else {
                    self.handleClientError(error)
                    return
                }
                //ERROR HTTP/S
                guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
                    self.handleServerError(response!)
                    return
                }
                //DADES
                if let data = data {
                    
                    //Guardem les dades a user defaults
                    let dadesTxt = String(decoding: data, as: UTF8.self)
                    //print(dadesTxt)
                    DispatchQueue.main.async {
                        self.cache.saveDataToLocal(dadesTxt)
                    }
                    
                    //Cridem a la funcio de table view
                    updateView(dadesTxt)
                }
            }
            task.resume()
        }
    }
    
    func uploadData(_ name: String, _ artist: String, _ lyrics: String, _ view: UIViewController) {
        var json = [String: Any]()
        json["name"] = name
        json["artist"] = artist
        json["lyrics"] = lyrics
        do {
            let data = try JSONSerialization.data(withJSONObject: json, options:[])
            let url = URL(string: "https://kidkeo.herokuapp.com/songs")
            if let url = url {
                var session = URLRequest(url: url)
                session.httpMethod = "POST"
                session.httpBody = data
                session.addValue("application/json", forHTTPHeaderField: "Content-Type")
                session.addValue("application/json", forHTTPHeaderField: "Accept")

                let task = URLSession.shared.dataTask(with: session) { data, response, error in
                    // ERRORS LOCALS:
                    guard error == nil else {
                        self.handleClientError(error)
                        return
                    }
                    //ERROR HTTP/S
                    guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
                        
                        DispatchQueue.main.async {
                            self.showAlert("Error on add new song", view)
                        }
                        
                        self.handleServerError(response!)
                        return
                    }
                    //DADES
                    if let httpResponse = response as? HTTPURLResponse{
                        //print(httpResponse.statusCode)
                        if httpResponse.statusCode == 200{
                            DispatchQueue.main.async {
                                self.showAlert("Success on add new song", view)
                                self.cache.invalidateData()
                            }
                        }
                    }
                }
                task.resume()
            }
        } catch {
            
        }
    }
    
    func handleClientError(_: Error?) {
        print("Client error")
        
    }
    
    func handleServerError(_: URLResponse) {
        print("Server error")
    }
    
    func showAlert(_ txt:String, _ view : UIViewController ) {
        let dialogMessage = UIAlertController(title: txt, message: "", preferredStyle: UIAlertController.Style.actionSheet)
        let acept = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in })
        dialogMessage.addAction(acept)
        view.present(dialogMessage, animated: true, completion: nil)
    }
}
