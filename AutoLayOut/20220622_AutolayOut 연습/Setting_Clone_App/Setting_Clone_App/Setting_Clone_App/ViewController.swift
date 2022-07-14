

import UIKit

class ViewController: UIViewController{

    var settingModel = [[SettingModel]]()
    
    @IBOutlet weak var settingTableView: UITableView!
    
    func makeData() {
        settingModel.append( [SettingModel(leftImageName: "person.circle", menuTitle: "Sign in to your iPhone", subTitle: "Set up iCloud, the App Store, and more", rightImageName: nil )]
        )
        
        
        settingModel.append(
        [SettingModel(leftImageName: "gear.circle", menuTitle: "General", subTitle: nil, rightImageName: "chevron.right"),
        SettingModel(leftImageName: "person.fill", menuTitle: "Accessibility", subTitle: nil, rightImageName: "chevron.right"),
        SettingModel(leftImageName: "hand.raised.square.fill", menuTitle: "Privacy", subTitle: nil, rightImageName: "chevron.right")]
        )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.backgroundColor = UIColor(white: 235/255, alpha: 1)
        
        let nib = UINib(nibName: "ProfileCell", bundle: nil)
        settingTableView.register(nib, forCellReuseIdentifier: "ProfileCell")
    
        let nib2 = UINib(nibName: "MenuCell", bundle: nil)
        settingTableView.register(nib2, forCellReuseIdentifier: "MenuCell")
        
        self.title = "Settings"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = UIColor(white: 235/255, alpha: 1)
        makeData()
        
         }
}

extension ViewController:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingModel[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingModel.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 && indexPath.row == 0 {
            
           let myidVC = MyIDViewController(nibName: "MyIDViewController", bundle: nil)
            
            self.present(myidVC, animated: true, completion: nil)
        
        } else if indexPath.section == 1 && indexPath.row == 0 {
           if let generalVC = UIStoryboard(name: "GeneralViewController", bundle: nil).instantiateViewController(identifier: "GeneralViewController") as? GeneralViewController {
                self.navigationController?.pushViewController(generalVC, animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
     
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
            cell.topTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
            cell.profileImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
            cell.bottomDescription.text  = settingModel[indexPath.section][indexPath.row].subTitle
            
            return cell
            
        }
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        
        cell.leftImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
        cell.leftImageView.tintColor = .red
        cell.middleTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
        cell.rightImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].rightImageName ?? "")
        
            return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return UITableView.automaticDimension
        }
        return 60
    }
    
}
