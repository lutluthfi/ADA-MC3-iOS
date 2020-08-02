//
//  RewardRedeemViewController.swift
//  MC3
//
//  Created by Antonius F Aulia on 30/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class RewardRedeemViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    let AlertService = RedeemHistoryAlertService()
    
    @IBAction func BuyButtonPressed(_ sender: UIButton) {
        let alertVC = AlertService.alert()
        present(alertVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buyButton.layer.cornerRadius = 10
        buyButton.clipsToBounds = true
        
        imageDetail.layer.borderWidth = 5
        imageDetail.layer.borderColor = #colorLiteral(red: 0.3243855536, green: 0.2837193608, blue: 0.2650057673, alpha: 1)
        imageDetail.layer.cornerRadius = 15
        imageDetail.clipsToBounds = true
        
        titleLabel.text = redeemRewardArray[selectedReward].rewardDetail.rewardTitle
        detailLabel.text = redeemRewardArray[selectedReward].rewardDetail.rewardDesc
        imageDetail.image = redeemRewardArray[selectedReward].rewardDetail.rewardImage
        
        if redeemRewardArray[selectedReward].isRedeemed == true {
            buyButton.setTitle("View Code", for: .normal)
        }
        
        if selectedReward == 3 {
            
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
