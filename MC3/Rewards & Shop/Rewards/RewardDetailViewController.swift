//
//  RewardDetailViewController.swift
//  MC3
//
//  Created by Antonius F Aulia on 24/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

struct rewardDetail{
    var rewardTitle :String
    var rewardDesc : String
    var rewardImage : UIImage
}

var rewardDetailArray = [rewardDetail(rewardTitle: "Safari",
                                      rewardDesc: "Place: Taman Safari Indonesia \nActivities: Witness the majestic wildlife of Indonesia, an experience like no other (free lunch included). \nPrice: $150",
                                      rewardImage: #imageLiteral(resourceName: "Rewards-safari-1")),
                         rewardDetail(rewardTitle: "Seminar",
                                      rewardDesc: "Topic: Smart Socialization Puppy \nDetails: Come learn about Socialization, what it is, what you need to do, and what you need to avoid. \nPrice: $100",
                                      rewardImage: #imageLiteral(resourceName: "Rewards-seminar-1")),
                         rewardDetail(rewardTitle: "Donation",
                                      rewardDesc: "Cause: Help Charlie to do a Surgery \nDetails: Charlie has two fractures on his hip due to falling onto something with a sharp edge. Please send positive vibes his way.",
                                      rewardImage: #imageLiteral(resourceName: "Rewards-donation-1")),
                         rewardDetail(rewardTitle: "Safari",
                                      rewardDesc: "Coming Soon !",
                                      rewardImage: #imageLiteral(resourceName: "Rewards-safari-2")),
                         rewardDetail(rewardTitle: "Seminar",
                                      rewardDesc: "Coming Soon !",
                                      rewardImage: #imageLiteral(resourceName: "Rewards-seminar-2")),
                         rewardDetail(rewardTitle: "Donation",
                                      rewardDesc: "Coming Soon !",
                                      rewardImage: #imageLiteral(resourceName: "Rewards-donation-2")),
                         rewardDetail(rewardTitle: "Seminar",
                                      rewardDesc: "Coming Soon !",
                                      rewardImage: #imageLiteral(resourceName: "Rewards-seminar-3")),
                         rewardDetail(rewardTitle: "Donation",
                                      rewardDesc: "Coming Soon !",
                                      rewardImage: #imageLiteral(resourceName: "Rewards-donation-3"))
]


class RewardDetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var rewardsLabel: UILabel!
    
    let AlertService = alertService()
    
    @IBAction func BuyButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Thank you", message: "We are currently working on bringing you the rewards. Please stay tuned for when the reward is up and running!", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { (tap) in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(ok)
        present(alert, animated: true)
        
//        let alertVC = AlertService.alert()
//        present(alertVC, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rewardsLabel.text = ("\(settingsDefaults.integer(forKey: Keys.rewards))")
        rewardsLabel.font = UIFont(name: "HappyMonkey-Regular", size: 20)
        rewardsLabel.textColor = .black
        rewardsLabel.textAlignment = .right
        
        buyButton.layer.cornerRadius = 10
        buyButton.clipsToBounds = true
        
        imageDetail.layer.borderWidth = 5
        imageDetail.layer.borderColor = #colorLiteral(red: 0.3243855536, green: 0.2837193608, blue: 0.2650057673, alpha: 1)
        imageDetail.layer.cornerRadius = 15
        imageDetail.clipsToBounds = true
        
        if selectedReward < 3 {
            titleLabel.text = rewardDetailArray[selectedReward].rewardTitle
            detailLabel.text = rewardDetailArray[selectedReward].rewardDesc
            imageDetail.image = rewardDetailArray[selectedReward].rewardImage
        } else {
            titleLabel.text = "Coming Soon !"
            detailLabel.text = "Coming Soon !"
        }
        
        if selectedReward == 3 {
            
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindToRewardVC", sender: self)
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
