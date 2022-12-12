import Foundation

class Book: NSObject, Codable {
    //----------------------------------------
    // MARK: - Properties
    //----------------------------------------

    open var book_id: Int?
    open var title: String?
    open var isFavorited: Bool = false

    //----------------------------------------
    // MARK: - Initialization
    //----------------------------------------
    
    public init(booksListItemJson: AnyObject) {
        super.init()
        
        book_id = booksListItemJson["book_id"] as? Int
        title = booksListItemJson["title"] as? String
    }
}
