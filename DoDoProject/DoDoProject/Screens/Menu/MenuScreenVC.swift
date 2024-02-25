import UIKit

final class MenuScreenVC: GenericViewController<MenuView> {
    
    // MARK: - Private Properties
    
    private var productService = ProductService()
    private var bannerService = BannerService()
    private var categoryService = CategoryService()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getProducts()
        getBanners()
        getCategories()
    }
    
    // MARK: - Private Mathods
    
    private func getProducts() {
        rootView.tableView.products = productService.fetchProducts()
    }
    
    private func getBanners() {
        rootView.tableView.banners = bannerService.fetchBanners()
    }
    
    private func getCategories() {
        rootView.tableView.categories = categoryService.fetchCategories()
    }
}
