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
                                      rewardImage: #imageLiteral(resourceName: "Safari-1")),
                         rewardDetail(rewardTitle: "Seminar",
                                      rewardDesc: "Topic: Smart Socialization Puppy \nDetails: Come learn about Socialization, what it is, what you need to do, and what you need to avoid. \nPrice: $100",
                                      rewardImage: #imageLiteral(resourceName: "Seminar-1")),
                         rewardDetail(rewardTitle: "Donation",
                                      rewardDesc: "Cause: Help Charlie to do a Surgery \nDetails: Charlie has two fractures on his hip due to falling onto something with a sharp edge. Please send positive vibes his way.",
                                      rewardImage: #imageLiteral(resourceName: "Donation-1"))]


class RewardDetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buyButton.layer.cornerRadius = 10
        buyButton.clipsToBounds = true
        
        imageDetail.layer.borderWidth = 5
        imageDetail.layer.borderColor = #colorLiteral(red: 0.3243855536, green: 0.2837193608, blue: 0.2650057673, alpha: 1)
        imageDetail.layer.cornerRadius = 15
        imageDetail.clipsToBounds = true
        
        titleLabel.text = rewardDetailArray[selectedReward].rewardTitle
        detailLabel.text = rewardDetailArray[selectedReward].rewardDesc
        imageDetail.image = rewardDetailArray[selectedReward].rewardImage
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
