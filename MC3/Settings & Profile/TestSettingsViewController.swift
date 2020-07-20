//
//  TestSettingsViewController.swift
//  MC3
//
//  Created by Rahmat Zulfikri on 20/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class TestSettingsViewController: UIViewController {

    static let identifier = String(describing: TestSettingsViewController.self)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onPressButton(_ sender: UIButton) {
        performSegue(withIdentifier: "showSettings", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
