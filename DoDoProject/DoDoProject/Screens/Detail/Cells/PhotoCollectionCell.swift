import UIKit

final class PhotoCollectionCell: UICollectionViewCell {
    
    // MARK: - Public Properties
    
    static let reuseID = "PhotoCollectionCell"
    
    // MARK: - Private Properties
    
    private var photoImageView = UIImageView()
    private var nameLabel = UILabel()
    private var priceLabel = UILabel()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPhotoImageView()
        setupNameLabel()
        setupPriceLabel()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Public Methods

extension PhotoCollectionCell {
    func update(_ ingredient: Ingredient) {
        nameLabel.text = ingredient.name
        priceLabel.text = "\(ingredient.price) р"
        photoImageView.image = UIImage(named: ingredient.image)
    }
}

// MARK: - UI and Constraints

extension PhotoCollectionCell {
    private func setupPhotoImageView() {
        photoImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.backgroundColor = .white
        photoImageView.image = UIImage.init(named: "cucumber")
        photoImageView.contentMode = .scaleAspectFit
        photoImageView.layer.cornerRadius = 15
        photoImageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        photoImageView.clipsToBounds = true
        
        contentView.addSubview(photoImageView)
        
        photoImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.left.right.equalTo(contentView)
        }
    }
    
    private func setupNameLabel() {
        nameLabel.text = "Маринованные огурчики"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 15)
        nameLabel.numberOfLines = 2
        nameLabel.textAlignment = .center
        
        contentView.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(10)
            make.left.right.equalTo(contentView)
        }
    }
    
    private func setupPriceLabel() {
        priceLabel.text = "79р"
        priceLabel.font = UIFont.boldSystemFont(ofSize: 20)
        priceLabel.textAlignment = .center
        
        contentView.addSubview(priceLabel)
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(10)
            $0.left.right.equalTo(contentView)
        }
        
    }
}
