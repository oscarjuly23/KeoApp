//
//  ViewController.swift
//  oscar.julian_bernat.segura
//
//

import UIKit
import Firebase

class ViewControllerRegister: UIViewController {
    var handle: AuthStateDidChangeListenerHandle?
    
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { auth, user in
              
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    @IBAction func checkRegister(_ sender: UIButton) {
        let email : String = tfUsername.text!
        let password : String = tfPassword.text!
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let auth = authResult {
                if let usr = auth.user as? User {
                    if let email = usr.email as? String{
                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let nextViewController = storyBoard.instantiateViewController(identifier: "mainTabBarController")
                        nextViewController.modalPresentationStyle = .fullScreen
                        self.present(nextViewController, animated: true, completion: nil)
                        return
                    }
                }
            }
            self.showAlert("Error on register", self)
        }
    }
    
    func showAlert(_ txt:String, _ view : UIViewController ) {
        let dialogMessage = UIAlertController(title: txt, message: "", preferredStyle: UIAlertController.Style.actionSheet)
        let acept = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in })
        dialogMessage.addAction(acept)
        view.present(dialogMessage, animated: true, completion: nil)
    }
}
