//: Playground - noun: a place where people can play

import UIKit

protocol ArchiveAlgorithm {
    
    func compress(filePath: String, outputFilePath: String)
    func decompress(filePath: String, outputFilePath: String)
    
}

class Archive {
    
    var algorithm: ArchiveAlgorithm
    
    init(algorithm: ArchiveAlgorithm) {
        self.algorithm = algorithm
    }
    
    func compress(path: String, outPath: String) {
        algorithm.compress(filePath: path, outputFilePath: outPath)
    }
    
    func decompress(path: String, outPath: String) {
        algorithm.decompress(filePath: path, outputFilePath: outPath)
    }
    
}

class ZipAlgorithm : ArchiveAlgorithm {
    
    func compress(filePath: String, outputFilePath: String) {
        print("Zip algorithm compression for \(filePath) save to \(outputFilePath)")
    }
    
    func decompress(filePath: String, outputFilePath: String) {
        print("Zip algorithm decompression for \(filePath) save to \(outputFilePath)")
    }
    
}

class RarAlgorithm : ArchiveAlgorithm {
    
    func compress(filePath: String, outputFilePath: String) {
        print("\(filePath) to \(outputFilePath)")
    }
    
    func decompress(filePath: String, outputFilePath: String) {
        print("decompress \(filePath) to \(outputFilePath)")
    }
    
}

let archive = Archive(algorithm: ZipAlgorithm())
archive.compress(path: "zip.txt", outPath: "zip.zip")
archive.decompress(path: "zip.zip", outPath: "zip.txt")

archive.algorithm = RarAlgorithm()
archive.compress(path: "zip.txt", outPath: "zip.rar")
archive.decompress(path: "zip.rar", outPath: "zip.txt")
