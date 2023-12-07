//
//  UserService.swift
//  contact-app
//
//  Created by Diego Mendoza on 3/25/23.
//

import Foundation

class UserService {
    let url = "http://localhost:8080";
    func getUsers(completion: @escaping ([User]) -> ()) {
        let endpoint = URL(string: url + "/users")!;
        URLSession.shared.fetchUsers(for: endpoint) { (result: Result<[User], Error>) in
            print(result)
            switch result {
            case .success(let fetchedUsers):
                DispatchQueue.main.async {
                    completion(fetchedUsers);
                }
                break;
            case .failure(let error):
                DispatchQueue.main.async {
                    completion([]);
                }
                break;
                // A failure, please handle
            }
        }
    }
    
    
}
