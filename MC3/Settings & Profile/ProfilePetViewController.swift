//
//  ProfilePetViewController.swift
//  MC3
//
//  Created by Rahmat Zulfikri on 20/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ProfilePetViewController: UIViewController {

    @IBOutlet var backBtn: UIButton!
    @IBOutlet var homeBtn: UIButton!
    
    @IBOutlet var foodProgress: UIProgressView!
    @IBOutlet var sleepProgress: UIProgressView!
    @IBOutlet var vetProgress: UIProgressView!
    @IBOutlet var gameProgress: UIProgressView!
    @IBOutlet var pettingProgress: UIProgressView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareScreen()
        // Do any additional setup after loading the view.
    }
    
    func prepareScreen() {
        homeBtn.layer.borderWidth = 4
        homeBtn.layer.cornerRadius = 5
        homeBtn.layer.borderColor = UIColor(hex: "#413834")?.cgColor
        
        backBtn.layer.borderWidth = 4
        backBtn.layer.cornerRadius = 5
        backBtn.layer.borderColor = UIColor(hex: "#413834")?.cgColor
    
        prepareProgressView()
    }
    
    func prepareProgressView() {
        foodProgress.transform = foodProgress.transform.scaledBy(x: 1, y: 4.5)
        sleepProgress.transform = sleepProgress.transform.scaledBy(x: 1, y: 4.5)
        vetProgress.transform = vetProgress.transform.scaledBy(x: 1, y: 4.5)
        gameProgress.transform = gameProgress.transform.scaledBy(x: 1, y: 4.5)
        pettingProgress.transform = pettingProgress.transform.scaledBy(x: 1, y: 4.5)
        
        foodProgress.layer.cornerRadius = 1
        foodProgress.clipsToBounds = true
        sleepProgress.layer.cornerRadius = 1
        sleepProgress.clipsToBounds = true
        vetProgress.layer.cornerRadius = 1
        vetProgress.clipsToBounds = true
        gameProgress.layer.cornerRadius = 1
        gameProgress.clipsToBounds = true
        pettingProgress.layer.cornerRadius = 1
        pettingProgress.clipsToBounds = true
    }
    
    @IBAction func onPressButton(_ sender: UIButton) {
        switch sender {
        case homeBtn:
            performSegue(withIdentifier: "unwind2MainGardenView", sender: nil)
            break
        case backBtn:
            self.navigationController?.popViewController(animated: true)
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
