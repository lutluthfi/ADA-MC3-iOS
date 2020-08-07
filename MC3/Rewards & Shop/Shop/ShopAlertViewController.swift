//
//  ShopAlertViewController.swift
//  MC3
//
//  Created by Antonius F Aulia on 02/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ShopAlertViewController: UIViewController {

//    let shopHomeVC = ShopHomeViewController()
    
    @IBOutlet weak var alertLabel: UILabel!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var okayButton: UIButton!
    
    @IBAction func noPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func yesPressed(_ sender: UIButton) {
        if bushArray[selectedItem].price > rewardsValue {
            let alert = UIAlertController(title: "Insufficient Balance", message: "You are running out of coins. Play with your cat to get more coins", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true)
        } else {
            yesButton.isHidden = true
            noButton.isHidden = true
            okayButton.isHidden = false
            if selectedCategory == 0 {
                alertLabel.text = "You just buy a bush !"
                bushArray[selectedItem].isPurchased = true
                rewardsValue -= bushArray[selectedItem].price
                settingsDefaults.set(rewardsValue, forKey: Keys.rewards)
            } else if selectedCategory == 1 {
                alertLabel.text = "You just buy a bench !"
                benchArray[selectedItem].isPurchased = true
                rewardsValue -= bushArray[selectedItem].price
                settingsDefaults.set(rewardsValue, forKey: Keys.rewards)
            } else if selectedCategory == 2 {
                alertLabel.text = "You just buy a flower !"
                flowerArray[selectedItem].isPurchased = true
                rewardsValue -= bushArray[selectedItem].price
                settingsDefaults.set(rewardsValue, forKey: Keys.rewards)
            } else if selectedCategory == 3 {
                alertLabel.text = "You just buy a lamp !"
                lampArray[selectedItem].isPurchased = true
                rewardsValue -= bushArray[selectedItem].price
                settingsDefaults.set(rewardsValue, forKey: Keys.rewards)
            } else if selectedCategory == 4 {
                alertLabel.text = "You just buy a tree !"
                treeArray[selectedItem].isPurchased = true
                rewardsValue -= bushArray[selectedItem].price
                settingsDefaults.set(rewardsValue, forKey: Keys.rewards)
            }
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rewardsValue = settingsDefaults.integer(forKey: Keys.rewards)
        
        alertView.layer.cornerRadius = 10
        if selectedCategory == 0 {
            alertLabel.text = "Do you want to buy a bush for $ \(String(bushArray[selectedItem].price))"
        } else if selectedCategory == 1 {
            alertLabel.text = "Do you want to buy a bench for $ \(String(benchArray[selectedItem].price))"
        } else if selectedCategory == 2 {
            alertLabel.text = "Do you want to buy a flower for $ \(String(flowerArray[selectedItem].price))"
        } else if selectedCategory == 3 {
            alertLabel.text = "Do you want to buy a lamp for $ \(String(lampArray[selectedItem].price))"
        } else if selectedCategory == 4 {
            alertLabel.text = "Do you want to buy a tree for $ \(String(treeArray[selectedItem].price))"
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
