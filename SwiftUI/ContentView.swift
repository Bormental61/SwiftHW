import SwiftUI

struct ContentView: View {
    @State var news: [News] = []
    private var networkService = NetworkService ()

    var body: some View {
        List(news) { news in 
            VStack { 
                Text(Helper.getDate(date: news.date))
                    .font(.body)
                    .frontWeight(.light)
                Text(news.title)
                    .font(.title)
                    .frontWeight(.heavy)
            }
        }
            .onAppear {
                networkService.getNews { (news) in
                    self.news = news
                }
            }
    }    
}