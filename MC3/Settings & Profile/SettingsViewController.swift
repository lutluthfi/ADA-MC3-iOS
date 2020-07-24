//
//  SettingsViewController.swift
//  MC3
//
//  Created by Rahmat Zulfikri on 20/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var backgroundView: UIView!
    @IBOutlet var contentView: UIView!
    @IBOutlet var settingsView: UIView!
    @IBOutlet var aboutView: UIView!
    
    @IBOutlet var musicBtn: UIButton!
    @IBOutlet var soundBtn: UIButton!
    @IBOutlet var profileBtn: UIButton!
    @IBOutlet var notificationBtn: UIButton!
    @IBOutlet var helpBtn: UIButton!
    @IBOutlet var aboutBtn: UIButton!
    
    @IBOutlet var settingsCloseBtn: UIButton!
    @IBOutlet var aboutCloseBtn: UIButton!
    
    @IBOutlet var aboutContentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareScreen()
        // Do any additional setup after loading the view.
    }
    
    func prepareScreen() {
//        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        view.isOpaque = false
        
        contentView.layer.cornerRadius = 10
        settingsView.layer.cornerRadius = 10
        
        aboutView.layer.cornerRadius = 10
    }
    
    @IBAction func onBackgroundViewTap(_ sender: UITapGestureRecognizer) {
        // this code to detect that, if user tap outisde contentview / child view it will dismiss the screen
        let location = sender.location(in: sender.view)
        if ((location.x < contentView.frame.minX || location.x > contentView.frame.maxX) || (location.y < contentView.frame.minY || location.y > contentView.frame.maxY)) {
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func onButtonPress(_ sender: UIButton) {
        switch sender {
        case settingsCloseBtn:
            dismiss(animated: true, completion: nil)
            break
        case aboutCloseBtn:
            aboutView.isHidden = true
            break
        case musicBtn:
            break
        case soundBtn:
            break
        case profileBtn:
            performSegue(withIdentifier: "settings2profile", sender: nil)
            break
        case notificationBtn:
            break
        case helpBtn:
            performSegue(withIdentifier: "settings2help", sender: nil)
            break
        case aboutBtn:
            aboutView.isHidden = false
            break
        default:
            break
        }
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
