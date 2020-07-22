//
//  ProfileViewController.swift
//  MC3
//
//  Created by Rahmat Zulfikri on 20/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var homeBtn: UIButton!
    @IBOutlet var ownerNameLabel: UILabel!
    @IBOutlet var ownerPhotoImg: UIImageView!
    @IBOutlet var signoutBtn: UIButton!
    @IBOutlet var catBtn: UIButton!
    @IBOutlet var catArticles1Btn: UIButton!
    @IBOutlet var catArticles2Btn: UIButton!
    @IBOutlet var catArticles1Label: UILabel!
    @IBOutlet var catArticles2Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareScreen()
        // Do any additional setup after loading the view.
    }
    
    func prepareScreen() {
        homeBtn.layer.borderWidth = 4
        homeBtn.layer.cornerRadius = 5
        homeBtn.layer.borderColor = UIColor(hex: "#413834")?.cgColor
    }
    
    @IBAction func onPressButton(_ sender: UIButton) {
        switch sender {
        case homeBtn:
            dismiss(animated: true, completion: nil)
            break
        case signoutBtn:
            break
        case catBtn:
            performSegue(withIdentifier: "profile2pet", sender: nil)
            break
        case catArticles1Btn:
            performSegue(withIdentifier: "profile2articles", sender: nil)
            break
        case catArticles2Btn:
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
