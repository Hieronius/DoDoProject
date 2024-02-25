import UIKit

protocol Reusable {
    static var reuseID: String { get }
}

extension Reusable {
    static var reuseID: String {
        return String.init(describing: self)
    }
}

extension UITableViewCell: Reusable {}

extension UICollectionViewCell: Reusable {}
