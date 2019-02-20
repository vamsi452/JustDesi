//
//  UserDetails.swift
//  JustDesi
//
//  Created by Vamsi Kallepalli on 2/19/19.
//  Copyright © 2019 Vamsi Kallepalli. All rights reserved.
//

import Foundation
import Firebase

struct UserDetails {
    var name: String
    var email: String
    var city : String
    var dob : String
    
    var dictionary: [String: Any] {
        return [
            "name": name,
            "email": email,
            "city": city,
            "dob": dob,
            
        ]
    }
    
}

/*
extension UserDetails: DocumentSerializable {
    init?(dictionary: [String : Any]) {
        guard let name = dictionary["name"] as? String,
            let email = dictionary["email"] as? String,
            let city = dictionary["city"] as? String,
            let dob = dictionary["dob"] as? Int else { return nil }
        
    
    
    self.init(name: name,
              category: category,
              city: city,
              price: price,
              ratingCount: ratingCount,
              averageRating: averageRating)
    
}
}
*/
