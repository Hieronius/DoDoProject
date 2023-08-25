//
//  UIView+ResizeImages.swift
//  DoDoProject
//
//  Created by Арсентий Халимовский on 25.08.2023.
//

import UIKit

extension UIImage {
    func resize(withSize size: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: size)
        let resizedImage = renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
        return resizedImage.withRenderingMode(.alwaysOriginal)
    }
}
