//
//  CreateUserProfileViewController.swift
//  JustDesi
//
//  Created by Vamsi Kallepalli on 2/15/19.
//  Copyright © 2019 Vamsi Kallepalli. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class CreateUserProfileViewController: UIViewController {

    var displayName:String = ""
    @IBOutlet var firstName: UITextField!
    @IBOutlet var lastName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstName.text = displayName
        // Do any additional setup after loading the view.
    }
    
    
    // Add a new document in collection "cities"
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    fileprivate func baseQuery() -> Query {
        // Firestore needs to use Timestamp type instead of Date type.
        // https://firebase.google.com/docs/reference/swift/firebasefirestore/api/reference/Classes/FirestoreSettings
        let firestore: Firestore = Firestore.firestore()
        let settings = firestore.settings
        settings.areTimestampsInSnapshotsEnabled = true
        firestore.settings = settings
        return firestore.collection("restaurants").limit(to: 50)
    }

}
