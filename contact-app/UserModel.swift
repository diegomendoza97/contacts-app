//
//  UserModel.swift
//  contact-app
//
//  Created by Diego Mendoza on 3/18/23.
//

import Foundation

class User: Identifiable{
    var userId: String;
    var firstName: String;
    var lastName: String;
    var email: String?;
    var phoneNumber: String?;
    var secondaryPhone: String?;
    
    var id: String {
        userId;
    }
    init(userId: String, firstName: String, lastName: String, email: String? = nil, phoneNumber: String? = nil, secondaryPhone: String? = nil) {
        self.userId = userId;
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phoneNumber = phoneNumber
        self.secondaryPhone = secondaryPhone
    }
}
