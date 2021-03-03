//
//  ContentView.swift
//  People.swift
//
//  Created by Arshya GHAVAMI on 2/28/21.
//

import SwiftUI

struct Friend: Codable, Identifiable, Hashable {
    var id: String
    var name: String
}

struct User: Codable, Identifiable, Hashable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: String
    var tags: [String]
    var friends: [Friend]
    //    var formattedRegistered: String {
    //        let dateFormatter = DateFormatter()
    //        dateFormatter.dateStyle = .long
    //        let date = dateFormatter.string(from: registered)
    //        return date
    //    }
}
class Users: ObservableObject, Identifiable {
    @Published var userList = [User]()
    func fetchUsers() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decoded = try? JSONDecoder().decode([User].self, from: data) {
                    DispatchQueue.main.async {
                        // update our UI
                        self.userList = decoded
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
    init() {
        fetchUsers()
    }
}
struct ContentView: View {
    @ObservedObject var users = Users()
    var body: some View {
        NavigationView {
            List(users.userList) { user in
                NavigationLink(destination: DetailView(user: user)) {
                    VStack(alignment: .leading) {
                        Text(user.name)
                        Text(String(user.age))
                    }
                }
            }
            .navigationBarTitle("People")
        }
    }
}
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//

