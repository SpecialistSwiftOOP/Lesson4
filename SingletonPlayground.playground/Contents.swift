//: Playground - noun: a place where people can play

class Product {
    
    let title: String
    let cost: Float
    
    init(title: String, cost: Float) {
        self.title = title
        self.cost = cost
    }
    
}

class SalesManager {
    
    static let instance = SalesManager()
    
    private var products = [Product]()
    
    private init() {
        
    }
    
    func report(about product: Product) {
        products.append(product)
    }
    
    func provideInfo(query: (Product) -> Bool) -> Product? {
        var result: Product? = nil
        
        for product in products {
            if query(product) {
                result = product
                break
            }
        }
        
        return result
    }
}

SalesManager.instance.report(about: Product(title: "Bread", cost: 50))
SalesManager.instance.report(about: Product(title: "Milk", cost: 40))

let product = SalesManager.instance.provideInfo {
    product in
    return product.cost > 40
}

if let product = product {
    print("Found product \(product.title)")
} else {
    print("Not found")
}