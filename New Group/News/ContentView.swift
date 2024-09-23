import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            News()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }

            Profile ()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }

           // ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    ContentView()
}
