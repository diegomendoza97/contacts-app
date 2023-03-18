//
//  DetailsView.swift
//  contact-app
//
//  Created by Diego Mendoza on 3/18/23.
//

import SwiftUI

struct DetailsView: View {
    @Binding var user: User;
//    @State var firstName: String;
//    @State var lastName: String;
//    @State var email: String;
//    @State var phoneNumber: String;
//    @State var secondaryPhone: String;
    @State var editMode = false;

    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Circle()
                    .stroke(Color.gray, lineWidth: 3)
                    .background(Circle().foregroundColor(.gray))
                    .padding(3)
                    .frame(width: 100, height: 100)
                    Text(self.getUserInitials(user: self.user))
                        .font(.system(size: 32))
                        .frame(width: 80, height: 80, alignment: .center)
                        .padding()
                        .foregroundColor(.white)
                }
                .shadow(radius: 10)
                .padding(EdgeInsets(top: -100, leading: 10, bottom: 10, trailing: 10))
                TextField(self.user.firstName, text: $user.firstName)
                    .disabled(!editMode)
                    .padding()
                    .frame(height: 50)
                    .background(Color.white)
                    .cornerRadius(25)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))

                TextField(self.user.lastName, text: $user.lastName)
                    .disabled(!editMode)
                    .padding()
                    .frame(height: 50)
                    .background(Color.white)
                    .cornerRadius(25)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))

                TextField(self.user.email ?? "email@email.com", text: $user.email.toUnwrapped(defaultValue: "") )
                    .disabled(!editMode)
                    .padding()
                    .frame(height: 50)
                    .foregroundColor(.black)
                    .background(Color.white)
                    .cornerRadius(25)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))


                TextField(self.user.phoneNumber ?? "phone", text: $user.phoneNumber.toUnwrapped(defaultValue: ""))
                    .disabled(!editMode)
                    .padding()
                    .frame(height: 50)
                    .background(Color.white)
                    .cornerRadius(25)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))

                TextField(self.user.secondaryPhone ?? "other phone", text: $user.secondaryPhone.toUnwrapped(defaultValue: ""))
                    .disabled(!editMode)
                    .padding()
                    .frame(height: 50)
                    .background(Color.white)
                    .cornerRadius(25)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                Spacer()
                Divider()
            }
            .background(Color(red: 230/255, green: 230/255, blue: 230/255))
        }
        .navigationBarItems(trailing: Button {
            if editMode {
                self.updateUser();
            }
            self.editMode.toggle()
        } label: {
            Text(self.editMode ? "Done" :"Edit")
        })
       
    }
    
    func getUserInitials(user: User) -> String {
        var firstLetter = "";
        var lastNameLetter = "";
        if !user.firstName.isEmpty {
            firstLetter = String(user.firstName.first!)
        }
        
        if !user.lastName.isEmpty {
            lastNameLetter = String(user.lastName.first!)
        }
        
        return "\(firstLetter)\(lastNameLetter)"
    }
    
    func updateUser() {
    }
    
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
//        @State var user1: User = User(userId: "1", firstName: "Diego", lastName: "Mendoza")
        ContentView()
    }
}


extension Binding {
     func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}
