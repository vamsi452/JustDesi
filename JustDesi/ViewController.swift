//
//  ViewController.swift
//  JustDesi
//
//  Created by Vamsi Kallepalli on 10/16/17.
//  Copyright © 2017 Vamsi Kallepalli. All rights reserved.
//

import UIKit
import FirebaseUI
import FirebaseFirestore

class ViewController: UIViewController,FUIAuthDelegate {

    
    var displayName :String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginAction(_ sender: Any) {
        
       
        
    }
    
    
    @IBAction func signUpAction(_ sender: Any) {
        
        let authUI = FUIAuth.defaultAuthUI()
        guard authUI != nil else {
            return
        }
        // You need to adopt a FUIAuthDelegate protocol to receive callback
        let providers: [FUIAuthProvider] = [
            FUIGoogleAuth(),
            //FUIFacebookAuth(),
            FUIPhoneAuth(authUI:FUIAuth.defaultAuthUI()!),
            ]
        authUI!.providers = providers
        
        authUI?.delegate = self
        
        let authViewController = authUI?.authViewController()
        
        self.present((authViewController ?? nil)!, animated: true, completion: nil)
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        
        print(user?.displayName ?? "Empty")
        
        self.displayName = user?.displayName ?? "Add your own"
        
        performSegue(withIdentifier: "GoToCreateProfile", sender: nil)
        
        // handle user and error as necessary
    }
    
    
     // MARK: - Navigation
    
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
        if segue.destination is CreateUserProfileViewController {
            let vc = segue.destination as? CreateUserProfileViewController
            vc?.displayName = self.displayName
        }
        
     }
    

}

