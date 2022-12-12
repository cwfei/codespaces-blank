import UIKit

class BookCell: UICollectionViewCell {
    //----------------------------------------
    // MARK: - Properties
    //----------------------------------------

    static let identifier = "cell"
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        return label
    }()

    lazy var favoriteImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        return imageView
    }()

    //----------------------------------------
    // MARK: - Lifecycle
    //----------------------------------------
    
    override func layoutSubviews() {
        title.topAnchor.constraint(equalTo: topAnchor, constant: 8.0).isActive = true
        title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0).isActive = true
        title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8.0).isActive = true
        title.heightAnchor.constraint(equalToConstant: 24.0).isActive = true

        favoriteImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8.0).isActive = true
        favoriteImageView.trailingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0).isActive = true
        favoriteImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8.0).isActive = true
        favoriteImageView.heightAnchor.constraint(equalToConstant: 24.0).isActive = true
    }

    //----------------------------------------
    // MARK: - Actions
    //----------------------------------------

    func configureTitle(_ title: String) {
        self.title.text = title
    }
}
