import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            News()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            Profile ()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}
