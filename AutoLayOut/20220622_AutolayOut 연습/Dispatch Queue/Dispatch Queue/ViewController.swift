

//dispatch queue

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var finishLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
        
            self.timerLabel.text = Date().timeIntervalSince1970.description
            
    
        }
        

}
 
    @IBAction func action1(_ sender: Any) {
        
        // finishLabel.text = "끝"
        
        simpleClosure {
            self.finishLabel.text = "끝"
        }
    }

    func simpleClosure(completion: @escaping () -> Void) {
    
        DispatchQueue.global().async {
            for index in 0..<10 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
        DispatchQueue.main.async {
            completion()
        }
}
}
    @IBAction func action2(_ sender: Any) {
        
        let dispatchGroup = DispatchGroup()
        
        let queue1 = DispatchQueue(label: "Q1")
        let queue2 = DispatchQueue(label: "Q2")
        let queue3 = DispatchQueue(label: "Q3")
       
        queue1.async(group: dispatchGroup) {
            dispatchGroup.enter()
            DispatchQueue.global().async {
                for index in 0..<10 {
                    Thread.sleep(forTimeInterval: 0.2)
                    print(index)
                }
                dispatchGroup.leave()
            }
        }
        queue2.async(group: dispatchGroup) {
            dispatchGroup.enter()
            DispatchQueue.global().async {
            for index in 10..<20 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
                dispatchGroup.leave()
        }
        }
        queue3.async(group: dispatchGroup) {
            dispatchGroup.enter()
            DispatchQueue.global().async {
            for index in 20..<30 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
                dispatchGroup.leave()
        }
        }
        dispatchGroup.notify(queue: DispatchQueue.main) {
            print("끝")
        }
        
    }
    @IBAction func action3(_ sender: Any) {
        
        DispatchQueue.main.async {
            
        }
        
        let queue1 = DispatchQueue(label: "Q1")
        let queue2 = DispatchQueue(label: "Q2")

        queue1.sync {
                for index in 0..<10 {
                    Thread.sleep(forTimeInterval: 0.2)
                    print(index)
                }
        // DeadLock -> 상대 작업이 끝날 때 까지 서로 기다리는 상태
        queue1.sync{
            for index in 10..<20 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
          
        }
    }
}
}
}

