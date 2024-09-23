import Foundation

class NewsService {
    func fetchNews(completion: @escaping ([Article]?) -> Void) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        let yesterdayString = formatter.string(from: yesterday)

        let urlString = "https://newsapi.org/v2/everything?q=Apple&from=\(yesterdayString)&sortBy=popularity&apiKey=a7e405378f594fa29e5d8a48145bb435"

        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                completion(nil)
                return
            }

            guard let data = data else {
                completion(nil)
                return
            }

            print("Response data: \(String(data: data, encoding: .utf8) ?? "")")

            do {
                let decoder = JSONDecoder()
                let newsResponse = try decoder.decode(NewsResponse.self, from: data)
                completion(newsResponse.articles)
            } catch {
                print("Error decoding JSON: \(error)")
                completion(nil)
            }
        }.resume()
    }
}
