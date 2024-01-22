//
//  ViewController.swift
//  oscar.julian_bernat.segura
//
//

import UIKit
import Firebase


class ViewControllerLogin: UIViewController {
    var handle: AuthStateDidChangeListenerHandle?

    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnLogin(_ sender: Any) {
        let email : String = tfUsername.text!
        let password : String = tfPassword.text!
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard self != nil else { return }
            if let this = self as? UIViewController {

                if let auth = authResult {
                    if let usr = auth.user as? User {
                        if let email = usr.email as? String{

                            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            let nextViewController = storyBoard.instantiateViewController(identifier: "mainTabBarController")
                            nextViewController.modalPresentationStyle = .fullScreen
                            this.present(nextViewController, animated: true, completion: nil)
                            return
                            
                        }
                    }
                }
                self?.showAlert("Error on login", this)
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

