//
//  MenuView.swift
//  DoDoProject
//
//  Created by Арсентий Халимовский on 29.07.2023.
//

import UIKit

final class MenuView: UIView {
    
    // MARK: - Public Properties
    
    var tableView: MenuTableViewManager!
    
    // MARK: - Initialization
    
    init() {
        super.init(frame: .zero)
        setupTableView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupTableView() {
        tableView = MenuTableViewManager(frame: self.bounds, style: .plain)
        
        self.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalTo(safeAreaLayoutGuide)
        }
    }
    
}
