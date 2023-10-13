//: [Previous](@previous)

import Foundation

var name: String = "Hello World"
//buat fungsi untuk mengembalikan jumlah karakter pada kalimat tersebut, dan hitung jumlah tiap hurufnya
func countWord(word: String) -> [String : Int]{
    var hasil: [String:Int] = [:]
    var n: Int = 1
    for i in name{
        hasil["\(i)"] = n
    }
    retun hasil
}

print(cac(name))
