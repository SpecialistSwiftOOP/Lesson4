//: Playground - noun: a place where people can play

enum Color : String {
    case red
    case green
    case blue
}

enum Doors : String {
    case twoDoors = "with 2 doors"
    case fourDoors = "with 4 doors"
}

class Car {
    
    private var color: Color!
    
    private var wheelSize: Int!
    
    private var doors: Doors!
    
    private var maxSpeed: Int!
    
    private init() {
        
    }
    
    enum CarError : Error {
        case notBuilt(message: String)
    }
    
    func show() throws {
        guard let color = color, let doors = doors, let wheelSize = wheelSize, let maxSpeed = maxSpeed else {
            throw CarError.notBuilt(message: "Car has not been built completly!")
        }
        
        print("Car with color \(color.rawValue) \(doors.rawValue) with wheel size \(wheelSize) with max speed \(maxSpeed)")
    }
    
    class Builder {
        
        private var car = Car()
        
        func color(_ color: Color) -> Self {
            car.color = color
            return self
        }
        
        func wheel(size: Int) -> Self {
            car.wheelSize = size
            return self
        }
        
        func doors(_ doors: Doors) -> Self {
            car.doors = doors
            return self
        }
        
        func max(speed: Int) -> Self {
            car.maxSpeed = speed
            return self
        }
        
        func build() -> Car {
            let result = car
            car = Car()
            return result
        }
        
    }
    
}

let builder = Car.Builder()
let car = builder
    .color(.red)
    .doors(.fourDoors)
    .wheel(size: 16)
    .max(speed: 200)
    .build()

do {
    try car.show()
} catch let exc as Car.CarError {
    switch exc {
    case let .notBuilt(message):
        print(message)
    }
}
