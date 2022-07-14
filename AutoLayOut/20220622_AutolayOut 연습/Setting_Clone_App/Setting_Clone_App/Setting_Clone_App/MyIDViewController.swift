

import UIKit

class MyIDViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBAction func doCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

        textFieldDidChange(sender: emailTextField)
    }

    @objc func textFieldDidChange(sender: UITextField) {
   
        if sender.text?.isEmpty == true {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
        
    }


}
