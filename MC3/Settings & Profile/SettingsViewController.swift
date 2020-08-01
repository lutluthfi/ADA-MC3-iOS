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
    
    var musicStatus: Bool = true
    var soundStatus: Bool = true
    var notificationStatus: Bool = true
    
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
        
        setMusicIcon(status: settingsDefaults.bool(forKey: "musicStatus"))
        setSoundIcon(status: settingsDefaults.bool(forKey: "soundStatus"))
        setNotificationIcon(status: settingsDefaults.bool(forKey: "notificationStatus"))
    }
    
    @IBAction func onBackgroundViewTap(_ sender: UITapGestureRecognizer) {
        // this code to detect that, if user tap outisde contentview / child view it will dismiss the screen
        let location = sender.location(in: sender.view)
        if ((location.x < contentView.frame.minX || location.x > contentView.frame.maxX) || (location.y < contentView.frame.minY || location.y > contentView.frame.maxY)) {
            dismiss(animated: true, completion: nil)
        }
    }
    
    func setMusicIcon(status: Bool) {
        if (status) {
            musicBtn.setImage(UIImage(systemName: "music.note"), for: .normal)
        } else {
            musicBtn.setImage(#imageLiteral(resourceName: "music-slash"), for: .normal)
        }
        
        musicStatus = status
        settingsDefaults.set(status, forKey: "musicStatus")
        
        if (backgroundMusic.getPlayerStatus() != status) {
            if (status) {
                backgroundMusic.play()
            }else {
                backgroundMusic.stop()
            }
        }
    }
    
    func setSoundIcon(status: Bool) {
        if (status) {
            soundBtn.setImage(UIImage(systemName: "speaker.2.fill"), for: .normal)
        } else {
            soundBtn.setImage(UIImage(systemName: "speaker.slash.fill"), for: .normal)
        }
        
        soundStatus = status
        settingsDefaults.set(status, forKey: "soundStatus")
    }
    
    func setNotificationIcon(status: Bool) {
        if (status) {
            notificationBtn.setImage(UIImage(systemName: "bell.fill"), for: .normal)
        } else {
            notificationBtn.setImage(UIImage(systemName: "bell.slash.fill"), for: .normal)
        }
        
        notificationStatus = status
        settingsDefaults.set(status, forKey: "notificationStatus")
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
            setMusicIcon(status: !musicStatus)
            break
        case soundBtn:
            setSoundIcon(status: !soundStatus)
            break
        case profileBtn:
            performSegue(withIdentifier: "settings2profile", sender: nil)
            break
        case notificationBtn:
            setNotificationIcon(status: !notificationStatus)
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
