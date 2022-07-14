
import UIKit

class DetailViewController: UIViewController {

    
    var someString = ""
    
    @IBOutlet weak var someLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        someLabel.text = someString

    }

}
