//
//  InstanceDetailViewController.swift
//  20220622_AutolayOut 연습
//
//  Created by 윤여진 on 2022/06/23.
//

import UIKit

class InstanceDetailViewController: UIViewController {

    var mainVC: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func sendDataMainVc(_ sender: Any) {
        mainVC?.dataLabel.text = "InStance"
        self.dismiss(animated: true, completion: nil)
    }
    

}
