
import UIKit

let a = 20
let b = 30

var c = 0

func plus(_ num1: Int, _ num2: Int) -> Int {
    return num1 + num2
}
func minus(_ num1: Int, _ num2: Int) -> Int {
    return num1 - num2
}
func multiply(_ num1: Int, _ num2: Int) -> Int {
    return num1 * num2
}

plus(a, b)
// View, present, display

var input = "+"

if input == "+" {
    print("연산결과 = ", plus(a, b))

} else if input == "-" {
    print("연산결과 =", minus(a, b))

} else if input == "*" {
    print("연산결과 =", multiply(a, b))
}

// 아래 방법이 더 가독성이 좋음

func displayresult(result: ( (Int, Int) -> Int ) ) {
    print("연산 결과 =", result(a, b))
}

if input == "+" {
    displayresult(result: plus)

} else if input == "-" {
    displayresult(result: minus)
    
} else if input == "*" {
  displayresult(result: multiply)
}

