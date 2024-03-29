import UIKit
import SnapKit

final class MenuTableViewManager: UITableView {
    
    // MARK: - Public Properties
    
    var products: [Product] = [] {
        didSet {
            self.reloadData()
        }
    }
    
    var banners: [Banner] = []
    var categories: [Category] = []
    
    // MARK: Private Properties
    
    private enum MenuSection: Int, CaseIterable {
        case banner
        case category
        case menu
    }
    
    // MARK: - Initialization
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
         setupTableViewManager()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods

extension MenuTableViewManager {
    private func setupTableViewManager() {
        dataSource = self
        delegate = self
        self.separatorStyle = .none
        registerCell(ProductTableCell.self)
        registerCell(BannerTableCell.self)
        registerCell(CategoryTableCell.self)
    }
}

// MARK: - UITableViewDelegate

extension MenuTableViewManager: UITableViewDelegate {
    
    func numberOfSections(in: UITableView) -> Int {
        return MenuSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let section = MenuSection.init(rawValue: section)
        
        switch section {
        case .banner:
            return 1
        case .category:
            return 1
        case .menu:
            return products.count
        default:
            return 1
        }
    }
}

// MARK: - UITableViewDataSource

extension MenuTableViewManager: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let section = MenuSection.init(rawValue: indexPath.section)
        var height = CGFloat()
        
        switch section {
        case .banner:
            height = 200
            return height
            
        case .category:
            height = 60
            return height
            
        case .menu:
            height = 160
            return height
            
        default:
            break
        }
        return height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let section = MenuSection.init(rawValue: indexPath.section) // 0 -> MenuSection.banner

        switch section {
        case .banner:
            let cell = dequeueCell(indexPath) as BannerTableCell
            cell.update(banners)
            
            return cell

        case .category:
            let cell = dequeueCell(indexPath) as CategoryTableCell
            cell.update(categories)
            return cell

        case .menu:
            let cell = dequeueCell(indexPath) as ProductTableCell
            let product = products[indexPath.row]
            cell.update(product)
            return cell

        default:
            return UITableViewCell()
        }
    }
}
