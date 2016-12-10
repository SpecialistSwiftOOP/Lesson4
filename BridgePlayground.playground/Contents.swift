//: Playground - noun: a place where people can play
import UIKit

class NetworkRequest {
    
    func retrieveData() -> String {
        return "{\"title\": \"HelloTitle\", \"published\": \"10.12.2016\", \"count\": 20}"
    }
    
}

class Book {
    
    let title: String
    let publishedDate: String
    let count: Int
    
    static func parse(jsonText: String) -> Book {
        let json = try! JSONSerialization.jsonObject(with: jsonText.data(using: .utf8)!, options: .allowFragments)
        
        var title = ""
        var date = ""
        var count = 0
        
        if let dict = json as? [String: AnyObject] {
            title = dict["title"] as! String
            date = dict["published"] as! String
            count = dict["count"] as! Int
        }
        
        return Book(title: title, publishedDate: date, count: count)
    }
    
    init(title: String, publishedDate: String, count: Int) {
        self.title = title
        self.publishedDate = publishedDate
        self.count = count
    }
    
}

class Streamer {
    
    func stream(book: Book) {
        print("Book \(book.title) published \(book.publishedDate) in count of \(book.count)")
    }
    
}

let streamer = Streamer()
let request = NetworkRequest()
streamer.stream(book: Book.parse(jsonText: request.retrieveData()))
