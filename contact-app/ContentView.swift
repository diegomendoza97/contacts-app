//
//  ContentView.swift
//  contact-app
//
//  Created by Diego Mendoza on 3/18/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedUser: User?;
    let user1: User = User(userId: "1", firstName: "Diego", lastName: "Mendoza")
    let user2: User = User(userId: "2", firstName: "Jackelinee", lastName: "Maldonado")
    let user3: User = User(userId: "3", firstName: "John", lastName: "Doe")
    @State var users: [User] = [];
    @State var showDetails: Bool;
    init() {
        self.users = [self.user1, self.user2, self.user3];
        self.showDetails = false;
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
