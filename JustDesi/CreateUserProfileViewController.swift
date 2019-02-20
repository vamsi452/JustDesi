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
import FirebaseUI

class CreateUserProfileViewController: UIViewController {

    var displayName:String = ""
    @IBOutlet var firstName: UITextField!
    @IBOutlet var lastName: UITextField!
    
    private var documents: [DocumentReference] = []
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
    
    @IBAction func registerAccount(_ sender: Any) {
        self.register()
    }
    func register() {
        let firestore: Firestore = Firestore.firestore()
var documentData: [AnyHashable : Any]? = nil
        let docRef: DocumentReference? = firestore.collection("users").document(displayName)



        docRef?.getDocument(completion: { snapshot, error in
    if snapshot?.exists != nil {
        // Document data may be nil if the document exists but has no keys or values.

        documentData = snapshot?.data()
        self.editFireStoreDocument()

        //NSLog(@"Document data: %@", documentData);

        //NSLog(@"Document data: %@", tokenList);
    } else {
        //NSLog(@"Document does not exist");
        self.editFireStoreDocument()
    }
})

    }
    
func editFireStoreDocument() {
    
    let db: Firestore = Firestore.firestore()
    
    
    
    // Add a new document with a generated ID
    var ref: DocumentReference? = nil
    
    print(Auth.auth().currentUser?.uid)
    
    db.collection("users").document(displayName).setData([
        "first": "Ada",
        "last": "Lovelace",
        "born": 1815
    ]) { error in
    if error != nil {
        //NSLog(@"Error adding document: %@", error);
    } else {
        //NSLog(@"Document successfully written!");
    }
}
    
    /*
    ref = db.collection("users").addDocument(data: [
        "first": "Ada",
        "last": "Lovelace",
        "born": 1815
    ]) { err in
        if let err = err {
            print("Error adding document: \(err)")
        } else {
            print("Document added with ID: \(ref!.documentID)")
        }
    }
 */
}

    fileprivate func baseQuery() -> Query {
        // Firestore needs to use Timestamp type instead of Date type.
        // https://firebase.google.com/docs/reference/swift/firebasefirestore/api/reference/Classes/FirestoreSettings
        let firestore: Firestore = Firestore.firestore()
        let settings = firestore.settings
        settings.areTimestampsInSnapshotsEnabled = true
        firestore.settings = settings
        return firestore.collection("users").limit(to: 50)
    }

}
