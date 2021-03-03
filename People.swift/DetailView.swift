//
//  DetailView.swift
//  People.swift
//
//  Created by Arshya GHAVAMI on 3/1/21.
//

import SwiftUI

struct DetailView: View {
    var user: User
    var body: some View {
        Form {
            Text(user.name)
            Text(user.email)
            Text(user.address)
//            Text(user.formattedRegistered)
            Text(user.about)
            Text(String(user.age))
           List(user.friends) { friend in
            Text(friend.name)
            }
            
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(user: User())
//    }
//}
