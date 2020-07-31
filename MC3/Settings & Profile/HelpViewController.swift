//
//  HelpViewController.swift
//  MC3
//
//  Created by Rahmat Zulfikri on 20/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {

    @IBOutlet var help1Img: UIImageView!
    @IBOutlet var help2Img: UIImageView!
    @IBOutlet var help3Img: UIImageView!
    @IBOutlet var help4Img: UIImageView!
    @IBOutlet var help5Img: UIImageView!
    @IBOutlet var help6Img: UIImageView!
    
    @IBOutlet var closeBtn: UIButton!
    @IBOutlet var nextBtn: UIButton!
    @IBOutlet var prevBtn: UIButton!
    
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareScreen()
        // Do any additional setup after loading the view.
    }
    
    func prepareScreen() {
//        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        view.isOpaque = false
        
        prepareHelpContent(index: 0)
    }
    
    func prepareHelpContent(index: Int) {
        self.index = index
        switch index {
        case 0:
            help1Img.isHidden = false
            help2Img.isHidden = true
            help3Img.isHidden = true
            help4Img.isHidden = true
            help5Img.isHidden = true
            help6Img.isHidden = true
            
            prevBtn.isHidden = true
            break
        case 1:
            help1Img.isHidden = true
            help2Img.isHidden = false
            help3Img.isHidden = true
            help4Img.isHidden = true
            help5Img.isHidden = true
            help6Img.isHidden = true
            
            prevBtn.isHidden = false
            nextBtn.isHidden = false
            break
        case 2:
            help1Img.isHidden = true
            help2Img.isHidden = true
            help3Img.isHidden = false
            help4Img.isHidden = true
            help5Img.isHidden = true
            help6Img.isHidden = true
            
            prevBtn.isHidden = false
            nextBtn.isHidden = false
            break
        case 3:
            help1Img.isHidden = true
            help2Img.isHidden = true
            help3Img.isHidden = true
            help4Img.isHidden = false
            help5Img.isHidden = true
            help6Img.isHidden = true
            
            prevBtn.isHidden = false
            nextBtn.isHidden = false
            break
        case 4:
            help1Img.isHidden = true
            help2Img.isHidden = true
            help3Img.isHidden = true
            help4Img.isHidden = true
            help5Img.isHidden = false
            help6Img.isHidden = true
            
            prevBtn.isHidden = false
            nextBtn.isHidden = false
            break
        case 5:
            help1Img.isHidden = true
            help2Img.isHidden = true
            help3Img.isHidden = true
            help4Img.isHidden = true
            help5Img.isHidden = true
            help6Img.isHidden = false
            
            prevBtn.isHidden = false
            nextBtn.isHidden = true
            break
        default:
            break
        }
    }
    
    @IBAction func onPressButton(_ sender: UIButton) {
        switch sender {
        case closeBtn:
            dismiss(animated: true, completion: nil)
            break
        case nextBtn:
            if (index < 5) {
                prepareHelpContent(index: index + 1)
            }
            break
        case prevBtn:
            if (index > 0) {
                prepareHelpContent(index: index - 1)
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
