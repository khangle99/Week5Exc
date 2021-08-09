import Foundation

struct FoodItem: Codable {
    let name: String
    let priceUnit: PriceUnit
    let currentPrice: Double
    let price: Double
    let avartarUrl: String
    
    static func getDummyData() -> [FoodItem] {
        return [
            FoodItem(name: "Banana", priceUnit: .PricePerKg, currentPrice: 5, price: 10, avartarUrl: "https://static.libertyprim.com/files/familles/banane-large.jpg?1569271725"),
            FoodItem(name: "Apple", priceUnit: .PricePerKg, currentPrice: 5, price: 10, avartarUrl: "https://thumbs.dreamstime.com/b/small-red-apple-white-background-fresh-newly-harvested-apple-tree-red-apple-small-one-white-background-154280688.jpg"),
        ]
    }
}
