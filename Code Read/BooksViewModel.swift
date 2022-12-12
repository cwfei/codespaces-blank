import UIKit

class BooksViewModel {
    //----------------------------------------
    // MARK: - Properties
    //----------------------------------------

    let booksService = BooksService()

    //----------------------------------------
    // MARK: - Actions
    //----------------------------------------

    func fetchBooks(url: String, completionHandler: @escaping ([Book]?, Error?) -> Void) {
        DispatchQueue.main.async {
            self.booksService.fetchBooks(url: url) { books, error in
                completionHandler(books, error)
            }
        }
    }

    //----------------------------------------
    // MARK: - Error handling
    //----------------------------------------

    func fetchBooksError(viewController: UIViewController) {
        let alert = UIAlertController(title: "Fetch Books Failure!",
                                      message: "An error occurred while trying to fetch books, please try again.",
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler:nil))
        viewController.present(alert, animated: true, completion: nil)
    }

    func favoriteBooksError(viewController: UIViewController) {
        let alert = UIAlertController(title: "Favorite Book Failure!",
                                      message: "An error occurred while trying to favorite books, please try again.",
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler:nil))
        viewController.present(alert, animated: true, completion: nil)
    }
}
