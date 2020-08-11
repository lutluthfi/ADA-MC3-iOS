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
    @IBOutlet var aboutNextBtn: UIButton!
    @IBOutlet var aboutPrevBtn: UIButton!
    
    var musicStatus: Bool = true
    var soundStatus: Bool = true
    var notificationStatus: Bool = true
    
    var aboutContentIndex: Int = 0
    let aboutContent: [String] = [
        "Freeden was made with solely one simple purpose, which is to develop awareness on animal welfare through a way that is acceptable and able to reach anyone, with the \("Five of Freedom") principle as the basic guidelines. By playing the game, we hope that users will implement those principles to the animals that they encounter in real life.",
        "Background music by:\nsyncopika\n\nSound effects by:\n\nFocus on Fun Games Company\nJesús Lastra\nVoltiment555\nfarfadet46",
        "Icons by:\nYazmin Alanis from the Noun Project\n\nUnsplash Photos by:\nАлександр Гросс, Markus Winkler, Courtney Roberson, Matthew Cabret, Sergio Souza, Lydia Torrey, Daiga Ellaby, Japheth Mast, Ivan Rojas Urrea"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareScreen()
        // Do any additional setup after loading the view.
    }
    
    func prepareScreen() {
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
            aboutContentIndex = 0
            prepareAboutScreen(index: 0)
            break
        case aboutNextBtn:
            if (aboutContentIndex < 2) {
                aboutContentIndex += 1
                prepareAboutScreen(index: aboutContentIndex)
            }
            break
        case aboutPrevBtn:
            if (aboutContentIndex > 0) {
                aboutContentIndex -= 1
                prepareAboutScreen(index: aboutContentIndex)
            }
            break
        default:
            break
        }
    }
    
    func prepareAboutScreen(index: Int) {
        switch index {
        case 0:
            aboutPrevBtn.isHidden = true
            aboutNextBtn.isHidden = false
            aboutContentLabel.text = aboutContent[0]
            break
        case 1:
            aboutPrevBtn.isHidden = false
            aboutNextBtn.isHidden = false
            aboutContentLabel.text = aboutContent[1]
            break
        case 2:
            aboutPrevBtn.isHidden = false
            aboutNextBtn.isHidden = true
            aboutContentLabel.text = aboutContent[2]
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
