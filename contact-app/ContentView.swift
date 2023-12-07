//
//  ContentView.swift
//  contact-app
//
//  Created by Diego Mendoza on 3/18/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedUser: User?;
    @State var users: [User] = [];
    @State var showDetails: Bool;
    init() {
        self.showDetails = false;
    }
    
    func updateUser(newUsers: [User]) {
        self.users = newUsers;
        print(self.users);
    }

    var body: some View {
        NavigationView {
            List($users, id: \.id) {user in
                NavigationLink(destination: DetailsView(user: user)) {
                    ContactTile(person: user)
                }
            }
            .frame(maxWidth: .infinity)
            .listStyle(.grouped)
        }.onAppear {
            UserService().getUsers { users in
                self.users = users;
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
