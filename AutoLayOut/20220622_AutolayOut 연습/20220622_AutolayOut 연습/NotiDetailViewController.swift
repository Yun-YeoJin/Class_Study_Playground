import UIKit

class NotiDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

           }

    @IBAction func notiAction(_ sender: Any) {
        let notificationName = Notification.Name("sendSomeString")
        
        let STRDic = ["STR": "Notification 실행"]
        
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: STRDic)
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
