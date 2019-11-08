//
//  HowmVC.swift
//  LoginDemoUni
//
//  Created by mac-00012 on 08/11/19.
//  Copyright © 2019 mac-00012. All rights reserved.
//

import UIKit

class HowmVC: UIViewController {
    var userName = String()
    
    @IBOutlet weak var lblUserName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblUserName.text = "Hi...\(userName)"
    }
    @IBAction func btnLogoutClick(_ sender: UIButton) {
       self.navigationController?.popViewController(animated: true)
    }
}
