import SwiftUI

struct PrepareView: View {
    var body: some View {
        NavigationStack {
            NavigationLink ("Go to news", destination: ContentView())
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        PrepareView()
    }
}