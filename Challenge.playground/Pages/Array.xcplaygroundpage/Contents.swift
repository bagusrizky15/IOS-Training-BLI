//: [Previous](@previous)

import UIKit

var cekLulus : Int = 0

func cekScore(score: [Int]) -> [String] {
    var nilaiHuruf : [String] = []
    var cekLulus : Int = 0
    for nilai in score{
        
        switch nilai{
        case 81...100 : nilaiHuruf.append("A")
        case 61...80 : nilaiHuruf.append("B")
        case 51...60 : nilaiHuruf.append("C")
        case 41...50 :
            nilaiHuruf.append("D")
            cekLulus+=1
        default :
            nilaiHuruf.append("E")
            cekLulus+=1
        }
    }
    return nilaiHuruf
}

print(cekScore(score: [10,20,30,40,50]))
print(cekLulus > 3 ? "Lulus" : "Gak lulus")



