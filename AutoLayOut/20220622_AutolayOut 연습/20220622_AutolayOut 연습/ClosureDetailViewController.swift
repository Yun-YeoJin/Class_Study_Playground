import UIKit

class ClosureDetailViewController: UIViewController {


    var myClosure: ((String) -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func closurePassData(_ sender: Any) {
        
        myClosure?("Closure String")
        self.dismiss(animated: true, completion: nil)
    }
    
}
