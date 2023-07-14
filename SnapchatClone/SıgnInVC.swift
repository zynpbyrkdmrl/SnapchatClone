//
//  ViewController.swift
//  SnapchatClone
//
//  Created by Zeynep Bayrak Demirel on 13.07.2023.
//

import UIKit
import Firebase

class SıgnInVC: UIViewController {
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    @IBAction func SignInClicked(_ sender: Any) {
        if passwordText.text != "" && emailText.text != ""{ // username istemeye gerek yok burda.
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { result, error in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        }else{
            self.makeAlert(title: "Error", message: "Password/Email ?")
        }
    }
    
    @IBAction func SignUpClicked(_ sender: Any) {
        if usernameText.text != "" && passwordText.text != "" && emailText.text != ""{
            
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { auth, error in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                }else {
                    
                    //Kullanıcı adını kaydetmek istiyoruz. Authentication da kullanıcı adını kaydedecek yer yok.Veritabanına kaydedicez.
                    let firestore = Firestore.firestore()
                    
                    let userDictionary = ["email" : self.emailText.text!, "username": self.usernameText.text!] as [String : Any]
                   
                    firestore.collection("UserInfo").addDocument(data: userDictionary) { error in
                        if error != nil{
                            //istersen hata mesajı gösterebilirsin.
                        }
                    }
                    
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }else{
            self.makeAlert(title: "Error", message: "Username/Password/Email ?")
        }
    }
    
    func makeAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:  nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

