import UIKit

func sevenBoom(a: Int, b: Int) -> [String] {
    var numbers: [String] = []
    for num in a...b {
        if num % 7 == 0 || String(num).contains("7") {
            numbers.append("Boom")
            continue
        }
        numbers.append("\(num)")
    }
    return numbers
}
print(sevenBoom(a: 1, b: 18))
