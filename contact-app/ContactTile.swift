//
//  ContactTile.swift
//  contact-app
//
//  Created by Diego Mendoza on 3/18/23.
//

import SwiftUI

struct ContactTile: View {
 
    @Binding var person: User;
 
    var body: some View {
        HStack {
            
            ZStack {
                Circle()
                .stroke(Color.gray, lineWidth: 3)
                .background(Circle().foregroundColor(.gray))
                .padding(3)
                .frame(width: 60, height: 60)
                Text(self.getUserInitials(user: person))
                    .frame(width: 40, height: 40, alignment: .center)
                    .padding()
                    .foregroundColor(.white)
            }

            Text("\(person.firstName) \(person.lastName)" )
                .font(.custom("Roboto-Bold", size: 20))
                .foregroundColor(Color.black)
            
     
          }

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
        
    
}
    

struct ContactTile_Previews: PreviewProvider {
    static var previews: some View {
        ContactTile(person: .constant(User(userId: "1", firstName: "Diego", lastName: "Mendoza")))
    }
}


extension StringProtocol {
    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
    subscript(range: Range<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: ClosedRange<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: PartialRangeFrom<Int>) -> SubSequence { self[index(startIndex, offsetBy: range.lowerBound)...] }
    subscript(range: PartialRangeThrough<Int>) -> SubSequence { self[...index(startIndex, offsetBy: range.upperBound)] }
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence { self[..<index(startIndex, offsetBy: range.upperBound)] }
}
