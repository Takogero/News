import SwiftUI

struct News: View {
    @State private var articles: [Article] = []

    var body: some View {
        NavigationView {
            List(articles) { article in
                VStack(alignment: .leading) {
                    Text(article.title)
                        .font(.headline)
                    Text(article.description ?? "")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("News")
            .onAppear {
                fetchNews()
            }
        }
    }

    func fetchNews() {
        let newsService = NewsService()
        newsService.fetchNews { articles in
            if let articles = articles {
                DispatchQueue.main.async {
                    self.articles = articles
                }
            } else {
                print("Failed to fetch news")
            }
        }
    }
}

#Preview {
    News()
}
