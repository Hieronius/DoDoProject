import UIKit

final class BannerCollectionCell: UICollectionViewCell {
    
    // MARK: - Public Properties
    
    static let reuseID = "BannerManagerCell"
    
    // MARK: - Private Properties
    
    private var container = UIView()
    private var productLabel = UILabel()
    private var priceLabel = CustomBannerPriceLabel()
    private var productImage = UIImageView()
    
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        //  setupContentView()
        setupContainer()
        setupProductImage()
        setupProductLabel()
        setupPriceLabel()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Public Methods

extension BannerCollectionCell {
    func update(_ banner: Banner) {
        productLabel.text = banner.name
        priceLabel.text = "\(banner.price) р"
        productImage.image = UIImage(named: banner.image)
    }
}

// MARK: - UI and Constraints

extension BannerCollectionCell {
    
    private func customShadowPath(viewLayer layer: CALayer, shadowHeight: CGFloat) -> UIBezierPath {
        let layerX = layer.bounds.origin.x
        let layerY = layer.bounds.origin.y
        let layerWidth = layer.bounds.size.width
        let layerHeight = layer.bounds.size.height
        
        let path = UIBezierPath()
        path.move(to: CGPoint.zero)
        
        path.addLine(to: CGPoint(x: layerX + layerWidth,
                                 y: layerY))
        path.addLine(to: CGPoint(x: layerX + layerWidth,
                                 y: layerY + 20))
        path.addCurve(to: CGPoint(x: 0,
                                  y: layerHeight),
                      controlPoint1: CGPoint(x: layerX + layerWidth,
                                             y: layerHeight),
                      controlPoint2: CGPoint(x: layerX,
                                             y: layerHeight))
        
        return path
    }
    
    
    private func setupContentView() {
        
        contentView.layer.backgroundColor = UIColor.gray.cgColor
        contentView.layer.shadowOffset = CGSize(width: 10, height: 10)
        contentView.layer.shadowRadius = 5
        contentView.layer.shadowOpacity = 0.5
        
        contentView.layer.shadowPath = CGPath(rect: container.bounds, transform: nil)
    }
    
    
    
    
    private func setupContainer() {
        container.backgroundColor = UIColor.white
        container.layer.cornerRadius = 15
        contentView.addSubview(container)
        
        container.layer.shadowOffset = .zero
        container.layer.shadowRadius = 3
        container.layer.shadowOpacity = 0.1
        container.layer.shadowColor = UIColor.black.cgColor
        
        container.snp.makeConstraints {
            $0.edges.equalTo(contentView)
        }
    }
    
    private func setupProductImage() {
        productImage.image = UIImage.init(named: "margarita")
        productImage.contentMode = .scaleAspectFit
        let width = UIScreen.main.bounds.width
        productImage.widthAnchor.constraint(equalToConstant: 0.25 * width).isActive = true
        container.addSubview(productImage)
        
        productImage.snp.makeConstraints {
            $0.left.equalTo(container).inset(10)
            $0.top.equalTo(container)
            $0.bottom.equalTo(container)
        }
    }
    
    private func setupProductLabel() {
        productLabel.text = "Пицца"
        productLabel.font = UIFont.systemFont(ofSize: 15)
        container.addSubview(productLabel)
        productLabel.snp.makeConstraints {
            $0.top.equalTo(container).inset(15)
            $0.left.equalTo(productImage.snp.right).offset(10)
        }
    }
    
    private func setupPriceLabel() {
        priceLabel.text = "599"
        priceLabel.textColor = .brown
        priceLabel.backgroundColor = .orange.withAlphaComponent(0.1)
        priceLabel.contentInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        priceLabel.layer.cornerRadius = 18
        priceLabel.clipsToBounds = true
        
        container.addSubview(priceLabel)
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(productLabel.snp.bottom).offset(30)
            $0.left.equalTo(productImage.snp.right).offset(10)
        }
    }
    
}
