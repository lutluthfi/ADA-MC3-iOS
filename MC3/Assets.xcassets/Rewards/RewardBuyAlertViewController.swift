//
//  RewardBuyAlertViewController.swift
//  MC3
//
//  Created by Antonius F Aulia on 30/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class RewardBuyAlertViewController: UIViewController {
    var moneyDonated = 50
    var contentArray = ["Buy Safari Ticket to “Taman Safari Indonesia” for $150 ?", "Buy Smart Socialization Puppy Seminar Ticket for S100 ?", "How much do you want to donate ?"]
    var nextContentArray = ["You just bought Safari Ticket to “Taman Safari Indonesia” for $ 150!",
                            "You just bought Seminar Ticket for $ 100!",
                            "You just Donated "]
    
    @IBOutlet weak var NoButton: UIButton!
    @IBOutlet weak var YesButton: UIButton!
    @IBOutlet weak var OkayButton: UIButton!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var contentLabel: UILabel!
    
    
    
    
    @IBAction func noPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    @IBAction func yesPressed(_ sender: Any) {
        NoButton.isHidden = true
        YesButton.isHidden = true
        OkayButton.isHidden = false
        contentLabel.text = nextContentArray[selectedReward]
        if selectedReward ==  2 {
            contentLabel.text = nextContentArray[selectedReward] + "$ " + String(moneyDonated)
            minusButton.isHidden = true
            plusButton.isHidden = true
            donationMoneyLabel.isHidden = true
        }
    }
    @IBAction func okayPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    // donation items
    @IBOutlet weak var donationMoneyLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    
    @IBAction func minPressed(_ sender: Any) {
        moneyDonated -= 5
        donationMoneyLabel.text = "$ " + String(moneyDonated)
    }
    
    @IBAction func plusPressed(_ sender: Any) {
        moneyDonated += 5
        donationMoneyLabel.text = "$ " + String(moneyDonated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alertView.layer.cornerRadius = 10
        alertView.clipsToBounds = true
        
        NoButton.layer.borderColor = #colorLiteral(red: 0.3243855536, green: 0.2837193608, blue: 0.2650057673, alpha: 1)
        NoButton.layer.borderWidth = 5
        
        NoButton.layer.cornerRadius = 5
        NoButton.clipsToBounds = true
        YesButton.layer.cornerRadius = 5
        YesButton.clipsToBounds = true
        OkayButton.layer.cornerRadius = 5
        OkayButton.clipsToBounds = true
        
        
        if selectedReward < 3 {
            contentLabel.text = contentArray[selectedReward]
        }else{
            contentLabel.text = "Coming Soon !"
        }
        
        if selectedReward == 2 {
            plusButton.isHidden = false
            minusButton.isHidden = false
            donationMoneyLabel.isHidden = false
            donationMoneyLabel.text = "$ " + String(moneyDonated)
        }
        // Do any additional setup after loading the view.
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
