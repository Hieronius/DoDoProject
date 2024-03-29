import Foundation

final class BannerService {
    
    // MARK: - Private Properties
    
    private let banners: [Banner] = [
        Banner(name: "Бруслетики", price: 230, image: "Бруслетики", specialOffer: "banner", count: 0),
        Banner(name: "Пепперони фреш", price: 299, image: "Пепперони фреш", specialOffer: "banner", count: 0),
        Banner(name: "3 пиццы", price: 1099, image: "3 пиццы", specialOffer: "banner", count: 0),
        Banner(name: "Додстер", price: 169, image: "Додстер", specialOffer: "banner", count: 0),
        Banner(name: "Комбо от 599 Р", price: 599, image: "Комбо от 599 Р", specialOffer: "banner", count: 0),
        Banner(name: "2 соуса", price: 75, image: "2 соуса", specialOffer: "banner", count: 0)
    ]
    
    // MARK: - Public Methods
    
    func fetchBanners() -> [Banner] {
        return banners
    }
}
