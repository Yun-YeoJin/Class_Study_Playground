import UIKit

// deinitialization
// 해제

var a: Int? = 10
a = nil

class Game {
    var score = 0
    var name = ""
    var round: Round?
    
    init() {
        print("game init")
    }
    deinit {
        print("game deinit")
    }
}

class Round {
   weak var gameInfo: Game? //weak var -> Game의 정보가 없어지면 같이 없어지겠다는 뜻 (약한 참조)
    var lastRound = 10
    var roundTime = 20
    deinit {
        print("round deinit")
    }
}

var game: Game? = Game() //메모리에서 생성된 것이 사라지지 않는다.
var round: Round? = Round()

game?.round = round
round?.gameInfo = game   // 서로 상호참조하고 있다.
                    
game = nil
round = nil
