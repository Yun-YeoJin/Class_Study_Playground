import UIKit
import Foundation
import os

// func과 유사하다.

func myScore(a: Int) -> String { //Int가 들어가서 String이 나온다.
    return "\(a)점"
        }

let score = myScore(a: 50) // let score = myScore
print(score)               // score(50)


// Closure

let myScore2 = { (a: Int) -> String in // 받아줄 이름이 꼭 있어야 한다 = 꼭 변수를                                              설정해줘야 한다.
    return "\(a)점"
}
myScore2(20)

// Closure 축약(생략)

let myScore3 = { (a: Int) -> String in
    "\(a)점" // 1줄일 경우에 return은 생략이 가능하다.
}
myScore3(30)

let myScore4 = { (a: Int) in // (-> String)도 생략 가능하다.
    "\(a)점"
}
myScore4(40)

let myScore5: (Int) -> String = { a in //타입 어노테이션 방법
    "\(a)점"
}
myScore5(200)

let myScore6: (Int) -> String = {
    return "\($0)점" //return은 생략이 가능하다.
}
myScore6(300)

// 내용이 많다면 이것도 가능

let myScore7: (Int, Int, Int) -> String = {
             "\($0 + $1 + $2)점" }
myScore7(100,200,300)



// Closure 실전
// 조건 -> 찾는다 -> 특정한 글자가 포함된 것을 찾는다. (containsText)
// 조건 -> 찾는다 -> 입력한 글자로 시작하는 첫글자를 찾는다. (startText)
let names = ["apple", "banana", "orange", "red", "brown", "blue", "candy"]

let containsText: (String, String) -> Bool = { name, find in
    if name.contains(find) { //containsText 설정 -> 찾는 것이 names배열에 있는지
        return true
    }
    return false
}
let startText: (String, String) -> Bool = { name, find in
    if name.first?.description == find { //시작하는 글자가 find의 첫글자라면
        return true
    }
    return false
}
func findtext(findstring: String, condition: (String, String) -> Bool) -> [String] {
    var newnames = [String]()
    
    for name in names {
        if condition(name, findstring) {
            newnames.append(name)
        }
    }
    return newnames
}

findtext(findstring: "a", condition: containsText)
findtext(findstring: "a", condition: startText)




// 글자가 포함되어 있으면 배열에 추가 (somefind)

func somefind(find: String) -> [String] {
    var newnames = [String]()
    
    
    for name in names {
        if name.contains(find) { //글자가 포함되었으면 true, 아니면 false
            newnames.append(name)
        }
    }
    return newnames
}

somefind(find: "a")


// Closure 실제 사용

var Names = ["Yun","Moon","Kim","Seo"]

Names.sorted() //sorted는 return값이 있다. (값의 대한 변경은 없음)
               //순서는 바뀐다.
Names.sort { (lhs, rhs) -> Bool in //(lhs, rhs) -> Bool in 도 생략가능
                                   // 생략하면 Names.sort { $0 < $1 }
    return lhs < rhs //return 생략가능
}

Names.sort { $0 < $1 }

Names.sort(by : <)

Names.sort(by: { $0 < $1 })

Names.sort() { $0 < $1 }
