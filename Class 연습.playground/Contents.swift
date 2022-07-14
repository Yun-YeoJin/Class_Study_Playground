import UIKit

//Class 초기값은 무조건 넣어야하지만, init를 선언하면 안넣어줘도 된다.

class MyInfo {
    
    init(gender: GenderType) {
        self.genderType = gender
    }
    enum GenderType {
        case male
        case female
    }
    
    var genderType: GenderType // private var genderType: GenderType도 가능
                               // 이건 Class 안에서만 사용 가능하다.
                               // var genderType = GenderType.male 도 가능.
    var name = ""
    var age = 0
    
    func isAdult() -> Bool {
        if age > 19 {
            return true
        }
        return false
    }
}

//참조 (Class는 참조타입)
var myinfo = MyInfo(gender: .male)

myinfo.age = 20
myinfo.genderType

var myinfo2 = myinfo
myinfo2.age = 30

var myinfo3 = myinfo2
myinfo3.age = 40 //최종적으로는 이걸로 바뀐다.

myinfo.age
myinfo2.age
myinfo3.age

// Class - 상속
// 부모한테 받아서 그대로 사용

//  class Soccer {
//    var homeScore = 0
//    var awayScore = 0
//    func presentScore() -> String { //description은 문자열 표시할 때 사용 (String)
//        return homeScore.description + " : " + awayScore.description
//    }
//  }
//
//  class Baseball {
//    var homeScore = 0
//    var awayScore = 0
//    func presentScore() -> String { //description은 문자열 표시할 때 사용 (String)
//        return homeScore.description + " : " + awayScore.description
//    }
//  }
//
//  class Football {
//    var homeScore = 0
//    var awayScore = 0
//    func presentScore() -> String { //description은 문자열 표시할 때 사용 (String)
//        return homeScore.description + " : " + awayScore.description
//    }
//    }
// let soccer = Soccer()
// soccer.awayScore = 1
// soccer.homeScore = 2
// soccer.presentScore()


class GameInfo {
    var homeScore = 0
    var awayScore = 0
    func presentScore() -> String { // description은 문자열 표시할 때 사용 (String)
                                    // final func으로 작성하면 override가 불가능하다.
        return homeScore.description + " : " + awayScore.description
    }
}



class Soccer: GameInfo{ //부모가 가진 GameInfo 내용을 가져다가 사용할 수 있다.
    var time = 0        // 더 필요한 것들은 추가할 수 있다.
}

class Baseball: GameInfo{
    override func presentScore() -> String { // 이 클래스의 부모 func를 구현해서 안에 있는 로직으로 쓰겠다.
        return homeScore.description + " 대 " + awayScore.description
    }
    var round = 0 // 더 필요한 것들은 추가할 수 있다.
}

class Football: GameInfo{
}

let soccer = Soccer()
soccer.awayScore = 1
soccer.homeScore = 2
soccer.time = 45
soccer.presentScore()

let baseball = Baseball()
baseball.awayScore = 3
baseball.homeScore = 4
baseball.round = 9
baseball.presentScore()
