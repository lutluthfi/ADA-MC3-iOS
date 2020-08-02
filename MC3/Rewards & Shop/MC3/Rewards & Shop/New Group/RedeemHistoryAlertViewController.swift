//
//  RewardRedeemViewController.swift
//  MC3
//
//  Created by Antonius F Aulia on 30/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class RedeemHistoryAlertViewController: UIViewController {
    var contentArray = ["Do you want to redeem “Taman Safari Indonesia” ticket ?", "Redeem Smart Socialization Puppy Seminar Ticket ?"]
    
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var qrImage: UIImageView!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var okayButton: UIButton!
    
    @IBAction func noPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)

            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }

        return nil
    }
    
    func randomString(length: Int) -> String {
      let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    @IBAction func yesPressed(_ sender: UIButton) {
        let redeemCode = randomString(length: 8)
        redeemRewardArray[selectedReward].redeemCode = redeemCode
        qrImage.isHidden = false
        qrImage.image = generateQRCode(from: redeemCode)
        qrImage.layer.cornerRadius = 10
        descLabel.text = "Your just redeemed your reward !\nYour redeem code is : \n \(redeemCode) "
        noButton.isHidden = true
        yesButton.isHidden = true
        okayButton.isHidden = false
    }
    
    @IBAction func okayPressed(_ sender: UIButton) {
        if redeemRewardArray[selectedReward].isRedeemed == false {
            redeemRewardArray[selectedReward].isRedeemed = true
        }
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if redeemRewardArray[selectedReward].isRedeemed == false {
            if redeemRewardArray[selectedReward].rewardDetail.rewardTitle == "Safari" {
                descLabel.text = contentArray[0]
            } else if redeemRewardArray[selectedReward].rewardDetail.rewardTitle == "Seminar" {
                descLabel.text = contentArray[1]
            }
        } else {
            qrImage.isHidden = false
            qrImage.image = generateQRCode(from: redeemRewardArray[selectedReward].redeemCode)
            qrImage.layer.cornerRadius = 10
            descLabel.text = "Your redeem code is : \n \(redeemRewardArray[selectedReward].redeemCode) "
            noButton.isHidden = true
            yesButton.isHidden = true
            okayButton.isHidden = false
        }
        
        
        alertView.layer.cornerRadius = 10
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
