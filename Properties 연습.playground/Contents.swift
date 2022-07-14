import UIKit

// Properties (프로퍼티)

class MyInfo {
    
    // stored property (저장)
    var name = ""
    var age = 0
    
    // lazy stored property
    
    lazy var myProfile = [UIImage(named: "a"), UIImage(named: "b"), UIImage(named: "c"), UIImage(named: "d") ]
  // 큰 것들이 많이 있으면 메모리를 많이 차지해서 lazy를 사용함으로써 부드럽게 만들어준다. (바로 사용할게 아니라면)
  // 분산효과가 있다. 성능면에서 유리하다.

    // computed property (계산)
    var isAdult: Bool { // 클로저 형태로 만들어준다. 로직을 써줘야함.
        if age > 19 {
            return true
        }
        return false
    }
    
    // 조건 : email -> 보안 -> 암호화 된 값으로 사용한다.(항상)
   var _email = ""
    var email: String {
        get {
            return _email
        }
        set {
            _email = newValue  // 새로운 값이 들어온다.
        }                      // newValue.hash.description -> 암호화 된 값이 출력된다.
    }
}

let myinfo = MyInfo()
myinfo.email = "duwls0349@naver.com"
myinfo.email
myinfo.age = 27
myinfo.name = "윤기사"

myinfo.isAdult // computed property (계산)

myinfo.myProfile

