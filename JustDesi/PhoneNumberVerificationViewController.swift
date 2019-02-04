//
//  PhoneNumberVerificationViewController.swift
//  JustDesi
//
//  Created by Vamsi Kallepalli on 10/23/17.
//  Copyright © 2017 Vamsi Kallepalli. All rights reserved.
//

import UIKit
import FirebaseAuth

class PhoneNumberVerificationViewController: UIViewController {

    @IBOutlet weak var phoneNum: UITextField!
    
    @IBOutlet weak var showMessagePrompt: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func sendVerificationCode(_ sender: Any) {
      /*  let alert = UIAlertController(title: "Phone Number", message: "Is this your Phone number? \n \(phoneNum.text!)", preferredStyle: .alert)
        
        let action = UIAlertAction(title:"Yes", style: .default) { (UIAlertAction) in
            
            PhoneAuthProvider.provider().verifyPhoneNumber(self.phoneNum.text!, uiDelegate: nil) { (verificationID, error) in
                if  error != nil {
                    //self.showMessagePrompt(error.localizedDescription)
                    print("error: \(String(describing: error?.localizedDescription))")
                    
                } else{
                    let defaults = UserDefaults.standard
                    defaults.set(verificationID, forKey: "authVID")
                    self.performSegue(withIdentifier: "enterPin", sender: Any?.self)
                }
            
        }
        }
        let cancel = UIAlertAction(title:"No", style: .cancel, handler: nil)
        
            alert.addAction(action)
            alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
            
        */
            // Sign in using the verificationID and the code sent to the user
            // ...
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
