//
//  MenuScreenVC.swift
//  DoDoProject
//
//  Created by Арсентий Халимовский on 29.07.2023.
//

import UIKit

final class MenuScreenVC: GenericViewController<MenuView> {
    
    // MARK: - Private Properties
    
    private var productService = ProductService()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getProducts()
    }
    
    // MARK: - Private Mathods
    
    private func getProducts() {
        rootView.tableView.products = productService.fetchProducts()
    }
}
