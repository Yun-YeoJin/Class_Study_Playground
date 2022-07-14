import UIKit

// Structure 구조체 (값 타입)

struct ImageType {
    var type = ""
}
var imageType1 = ImageType()
var imageType2 = imageType1
var imageType3 = imageType2

imageType1.type = "jpg"
imageType2.type = "abc"
imageType3.type = "png"

imageType1.type // 계속 복제되어서 사용한다.
imageType2.type
imageType3.type


// 참조 타입 Class

 class MyInfo {
    var age = 0
 }

 var info1 = MyInfo()
 var info2 = info1
 var info3 = info2

 info1.age = 20
 info1.age
 info2.age
 info3.age

