//
//  TestSettingViewController.swift
//  MC3
//
//  Created by Rahmat Zulfikri on 16/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class TestSettingViewController: UIViewController {
    
    @IBOutlet var btnSettings: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onBtnSettingPress(_ sender: Any) {
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
