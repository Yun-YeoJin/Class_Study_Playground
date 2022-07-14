import UIKit

// Initializer (생성자)

class MyInfo {
    var name: String //만약 여기서 값 설정하면 init 안해줘도 됨.
    var myId: String
    
    var age = 0
    var isAdult: Bool
    
    // designated initializer
    init(n: String, id: String) {
        self.name = n
        self.myId = id
        self.isAdult = (age > 19) ? true : false
    }
//    init() {
//        self.name = ""
//        self.myId = ""
//        self.isAdult = (age > 19) ? true : false
        // init은 반드시 초기 세팅값이 없으면 반드시 세팅해줘야한다.
//     }
//    init(id: String) {
//        self.name = ""
//        self.myId = id
//        self.isAdult = (age > 19) ? true : false
//    }
    
    // convenience initializer (필수조건 - 다른 init을 반드시 실행해야 한다.)
    convenience init() {
        self.init(n: "", id: "")
    }
    
    convenience init(id: String) {
        self.init(n: "", id: id)
    }
}
// 이니셜라이즈 - 메모리에 올려 존재하게 만든다.
var myInfo1 = MyInfo(n: "YUN", id: "duwls0349")
var myInfo2 = MyInfo()
var myInfo3 = MyInfo(id: "something")
myInfo1.myId
myInfo1.name

struct MyConfig {
    var config: String
}
var myconfig = MyConfig(config: "윤기사")
