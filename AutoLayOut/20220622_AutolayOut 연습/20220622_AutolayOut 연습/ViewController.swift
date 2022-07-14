

// 1. instance property
// 2. segue
// 3. instance
// 4. delegate (delegation)
// 5. Closure
// 6. Notification

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationName = Notification.Name("sendSomeString")
        
        NotificationCenter.default.addObserver(self, selector: #selector(showSomeString), name: notificationName, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
    
     // NotificationCenter.default.removeObserver(self, name: notificationName, object: nil)

    }
    @objc func keyboardWillShow() {
        print("will show")
    }
    @objc func keyboardDidShow() {
        print("Did show")
    }

    @objc func showSomeString(notification: Notification) {
        if let STR = notification.userInfo?["STR"] as? String {
            self.dataLabel.text = STR
    }
    }
    
    @IBOutlet weak var dataLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetail" {
            if let detailVC = segue.destination as? SegueDetailViewController {
                detailVC.dataString = "abcde"
            }
        }
        
    }
    
    @IBAction func moveToDetail(_ sender: Any) {
    
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        // detailVC.someString = "aaa 데이터"
        
        self.present(detailVC, animated: true, completion: nil)
        
        detailVC.someLabel.text = "Instance"
    }
    

    @IBAction func moveToInstance(_ sender: Any) {
        let detailVC = InstanceDetailViewController(nibName: "InstanceDetailViewController", bundle: nil)
        
        detailVC.mainVC = self
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
    @IBAction func moveToDelegate(_ sender: Any) {
        let detailVC = DelegateDetailViewController(nibName: "DelegateDetailViewController", bundle: nil)
        
        detailVC.delegate = self
        // 위의 self들과 천지차이!
        self.present(detailVC, animated: true, completion: nil)
    }
    
    
    @IBAction func moveToClosure(_ sender: Any) {
        
        let detailVC = ClosureDetailViewController(nibName: "ClosureDetailViewController", bundle: nil)
        
        detailVC.myClosure = { str in
            self.dataLabel.text = str
        }
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
    // 연결점이 전혀 없을 때 notification 사용
    @IBAction func moveToNoti(_ sender: Any) {
        
        let detailVC = NotiDetailViewController(nibName: "NotiDetailViewController", bundle: nil)
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
}

extension ViewController: DelegateDetailViewControllerDelegate {
    
    func passString(string: String) {
        self.dataLabel.text = string
    }
    
}
