//
//  UserModel.swift
//  contact-app
//
//  Created by Diego Mendoza on 3/18/23.
//

import Foundation

struct User: Identifiable, Decodable{
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


extension URLSession {
  func fetchUsers(for url: URL, completion: @escaping (Result<[User], Error>) -> Void) {
    self.dataTask(with: url) { (data, response, error) in
      if let error = error {
        completion(.failure(error))
      }

      if let data = data {
        do {
          let toDos = try JSONDecoder().decode([User].self, from: data)
          completion(.success(toDos))
        } catch let decoderError {
          completion(.failure(decoderError))
        }
      }
    }.resume()
  }
    
    func updateUser(for url: URL, updatedUser: User  ,completion: @escaping (Result<[User], Error>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "POST";
        let jsonData = try? JSONSerialization.data(withJSONObject: <#T##Any#>)
        
        self.dataTask(with: url) { (data, response, error) in
        if let error = error {
          completion(.failure(error))
        }

        if let data = data {
          do {
            let toDos = try JSONDecoder().decode([User].self, from: data)
            completion(.success(toDos))
          } catch let decoderError {
            completion(.failure(decoderError))
          }
        }
        }.resume()
    }
    
    
}
