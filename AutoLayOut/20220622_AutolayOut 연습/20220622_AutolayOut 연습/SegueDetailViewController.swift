

import UIKit

class SegueDetailViewController: UIViewController {

    
    @IBOutlet weak var dataLabel: UILabel!
    
    var dataString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataLabel.text = dataString
        
    }
    

   

}
