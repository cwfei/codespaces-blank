import UIKit

class BooksViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    //----------------------------------------
    // MARK: - Properties
    //----------------------------------------
    
    @IBOutlet public weak var collectionView: UICollectionView!
    
    let booksService = BooksService()
    let viewModel = BooksViewModel()
    
    public var booksList : Array<Book>?

    //----------------------------------------
    // MARK: - Lifecycle
    //----------------------------------------

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        fetchBooks()
    }

    //----------------------------------------
    // MARK: - View model actions   
    //----------------------------------------
    
    func fetchBooks() {
        viewModel.fetchBooks(url: "https://book.api.com/books", completionHandler: { books, error in
            if error != nil {
                self.viewModel.fetchBooksError(viewController: self)
                return
            }

            self.booksList = books
            self.collectionView.reloadData()
        })
    }

    //----------------------------------------
    // MARK: - Collection view delegate
    //----------------------------------------
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return booksList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookCell.identifier,
                                                            for: indexPath) as? BookCell else {
            fatalError("An error occurred while trying to dequeue reusable cell at \(indexPath)")
        }

        let title = booksList![indexPath.item].title!
        cell.configureTitle(title)
        cell.favoriteImageView.isHidden = !booksList![indexPath.row].isFavorited
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        booksService.favoriteBooks(url: "https://book.api.com/books/\(self.booksList![indexPath.row].book_id!)", completionHandler: { book, error in
            if error != nil {
                self.viewModel.favoriteBooksError(viewController: self)
                return
            }

            self.booksList![indexPath.row].isFavorited = true
            self.collectionView.reloadData()
        })
    }
}
