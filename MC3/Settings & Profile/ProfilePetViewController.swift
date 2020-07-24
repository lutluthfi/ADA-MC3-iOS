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
    
    @IBOutlet var sundayBtn: UIButton!
    @IBOutlet var mondayBtn: UIButton!
    @IBOutlet var tuesdayBtn: UIButton!
    @IBOutlet var wednesday: UIButton!
    @IBOutlet var thrusdayBtn: UIButton!
    @IBOutlet var fridayBtn: UIButton!
    @IBOutlet var saturdayBtn: UIButton!
    
    var activeDay = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareScreen()
        setActiveDay(index: activeDay)
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
        prepareDayButton()
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
    
    func prepareDayButton() {
        sundayBtn.layer.cornerRadius = 12.5
        mondayBtn.layer.cornerRadius = 12.5
        tuesdayBtn.layer.cornerRadius = 12.5
        wednesday.layer.cornerRadius = 12.5
        thrusdayBtn.layer.cornerRadius = 12.5
        fridayBtn.layer.cornerRadius = 12.5
        saturdayBtn.layer.cornerRadius = 12.5
    }
    
    func setActiveDay(index: Int) {
        activeDay = index
        setButtonInactiveExcept(index: activeDay)
        setProgressView(index: activeDay)
    }
    
    func getDayButtonFromIndex(index: Int) -> UIButton {
        switch index {
        case 0:
            return sundayBtn
        case 1:
            return mondayBtn
        case 2:
            return tuesdayBtn
        case 3:
            return wednesday
        case 4:
            return thrusdayBtn
        case 5:
            return fridayBtn
        case 6:
            return saturdayBtn
        default:
            return sundayBtn
        }
    }
    
    func setButtonInactiveExcept(index: Int) {
        for loopIndex in 0 ... 6 {
            if (loopIndex == index) {
                let btn = getDayButtonFromIndex(index: loopIndex)
                btn.backgroundColor = UIColor(hex: "#725A4E")
            } else {
                let btn = getDayButtonFromIndex(index: loopIndex)
                btn.backgroundColor = UIColor(hex: "#C4C4C4")
            }
        }
    }
    
    func setProgressView(index: Int) {
        let progress1 = Int.random(in: 0 ..< 100)
        let progress2 = Int.random(in: 0 ..< 100)
        let progress3 = Int.random(in: 0 ..< 100)
        let progress4 = Int.random(in: 0 ..< 100)
        let progress5 = Int.random(in: 0 ..< 100)
        
        foodProgress.progress = Float(progress1)/Float(100.00)
        sleepProgress.progress = Float(progress2)/Float(100.00)
        vetProgress.progress = Float(progress3)/Float(100.00)
        gameProgress.progress = Float(progress4)/Float(100.00)
        pettingProgress.progress = Float(progress5)/Float(100.00)
    }
    
    @IBAction func onPressButton(_ sender: UIButton) {
        switch sender {
        case homeBtn:
            dismiss(animated: true, completion: nil)
            break
        case backBtn:
            dismiss(animated: true, completion: nil)
            break
        case sundayBtn:
            setActiveDay(index: 0)
            break
        case mondayBtn:
            setActiveDay(index: 1)
            break
        case tuesdayBtn:
            setActiveDay(index: 2)
            break
        case wednesday:
            setActiveDay(index: 3)
            break
        case thrusdayBtn:
            setActiveDay(index: 4)
            break
        case fridayBtn:
            setActiveDay(index: 5)
            break
        case saturdayBtn:
            setActiveDay(index: 6)
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
