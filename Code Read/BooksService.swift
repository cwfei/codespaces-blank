import UIKit

class BooksService {
    //----------------------------------------
    // MARK: - Actions
    //----------------------------------------

    func fetchBooks(url: String, completionHandler: @escaping ([Book]?, Error?) -> Void) {
        var request = URLRequest(url: URL(string: url)!)

        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            if error != nil {
                completionHandler(nil, error)
            }

            do {
                let decoder = JSONDecoder()
                let booksList = try decoder.decode([Book].self, from: data!)
                completionHandler(booksList, nil)
            } catch {
                completionHandler(nil, error)
            }
        })
        task.resume()
    }

    func favoriteBooks(url: String, completionHandler: @escaping (Book?, Error?) -> Void) {
        var request = URLRequest(url: URL(string: url)!)

        request.httpMethod = "POST"
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            if error != nil {
                completionHandler(nil, error)
            }

            do {
                let decoder = JSONDecoder()
                let books = try decoder.decode(Book.self, from: data!)
                completionHandler(books, nil)
            } catch {
                completionHandler(nil, error)
            }
        })
        task.resume()
    }
}
