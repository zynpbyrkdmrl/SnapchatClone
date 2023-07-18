//
//  SettingsVC.swift
//  SnapchatClone
//
//  Created by Zeynep Bayrak Demirel on 14.07.2023.
//

import UIKit
import Firebase

class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutClicked(_ sender: Any) {
        // signOut throw bir metot oldugu için try catch yapmamız lazım.
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toSignInVC", sender: nil)
        } catch {
            
        }
    }
    
}
