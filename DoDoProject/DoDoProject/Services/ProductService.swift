import Foundation

final class ProductService {
    
    // MARK: - Private Properties

    private let products: [Product] = [
        Product(name: "Гавайская", detail: "Тесто, Сыр, Буженина", price: 590, image: "hawaii", type: "product", count: 0),
        Product(name: "Маргарита", detail: "Тесто, Сыр, Колбаска", price: 650, image: "margarita", type: "product", count: 0),
        Product(name: "Пепперони", detail: "Тесто, Сыр, Перец, Томат, Лук", price: 710, image: "pepperoni", type: "product", count: 0),
        Product(name: "Гавайская", detail: "Тесто, Сыр, Буженина", price: 590, image: "hawaii", type: "product", count: 0),
        Product(name: "Маргарита", detail: "Тесто, Сыр, Колбаска", price: 650, image: "margarita", type: "product", count: 0),
        Product(name: "Пепперони", detail: "Тесто, Сыр, Перец, Томат, Лук", price: 710, image: "pepperoni", type: "product", count: 0),
        Product(name: "Гавайская", detail: "Тесто, Сыр, Буженина", price: 590, image: "hawaii", type: "product", count: 0),
        Product(name: "Маргарита", detail: "Тесто, Сыр, Колбаска", price: 650, image: "margarita", type: "product", count: 0),
        Product(name: "Пепперони", detail: "Тесто, Сыр, Перец, Томат, Лук", price: 710, image: "pepperoni", type: "product", count: 0)
    ]

    // MARK: - Public Methods

    func fetchProducts() -> [Product] {
        return products
    }
}
