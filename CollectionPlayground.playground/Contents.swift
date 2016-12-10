//: Playground - noun: a place where people can play

import UIKit

enum BufferError : Error {
    case NoData
}

class RoundBuffer<T> {
    
    private var data = [T]()
    
    func push(value: T) {
        data.append(value)
    }
    
    func pop() throws -> T {
        guard data.count > 0 else {
            throw BufferError.NoData
        }
        
        return data.remove(at: 0)
    }
    
    subscript(index: Int) -> T {
        get {
            return data[index % data.count]
        }
    }
}

let buffer = RoundBuffer<Int>()

for i in 1...10 {
    buffer.push(value: i)
}

print("Pop value = \(try! buffer.pop())")

for i in 0...15 {
    print("Value at index \(i) = \(buffer[i])")
}