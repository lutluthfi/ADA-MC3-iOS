//
//  SettingsViewController.swift
//  MC3
//
//  Created by Rahmat Zulfikri on 16/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var backgroundView: UIView!
    @IBOutlet var contentView: UIView!
    
    @IBOutlet var btnMusic: UIButton!
    @IBOutlet var btnSound: UIButton!
    @IBOutlet var btnProfile: UIButton!
    @IBOutlet var btnNotification: UIButton!
    @IBOutlet var btnHelp: UIButton!
    @IBOutlet var btnAbout: UIButton!
    @IBOutlet var btnClose: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareScreen()
        // Do any additional setup after loading the view.
    }
    
    func prepareScreen() {
        view.backgroundColor = UIColor.clear
        view.isOpaque = false
        contentView.layer.cornerRadius = 10
        btnSound.setImage(#imageLiteral(resourceName: "settings-sound-active"), for: .normal)
    }
    
    @IBAction func onBackgroundViewTap(_ sender: UITapGestureRecognizer) {
        // this code to detect that, if user tap outisde contentview / child view it will dismiss the screen
        let location = sender.location(in: sender.view)
        if ((location.x < contentView.frame.minX || location.x > contentView.frame.maxX) || (location.y < contentView.frame.minY || location.y > contentView.frame.maxY)) {
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func onBtnPress(_ sender: UIButton) {
        switch sender {
        case btnClose:
            dismiss(animated: true, completion: nil)
            break
        case btnSound:
            if btnSound.currentImage == #imageLiteral(resourceName: "settings-sound-active") {
                btnSound.setImage(#imageLiteral(resourceName: "settings-sound-mute"), for: .normal)
            } else {
                btnSound.setImage(#imageLiteral(resourceName: "settings-sound-active"), for: .normal)
            }
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
