//
//  ItemDetailViewController.swift
//  MC3
//
//  Created by Antonius F Aulia on 02/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {
    
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var buyButtonPressed: UIButton!
    @IBOutlet weak var rewardsLabel: UILabel!
    
    let AlertService = ShopAlertService()
    
    @IBAction func buyPressed(_ sender: UIButton) {
        let alertVC = AlertService.alert()
        present(alertVC, animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        rewardsLabel.text = ("\(settingsDefaults.integer(forKey: Keys.rewards))")
        rewardsLabel.textAlignment = .right
        rewardsLabel.textColor = .black
        rewardsLabel.font = UIFont(name: "HappyMonkey-Regular", size: 20)
        
        if selectedCategory == 0 {
            if selectedItem < bushArray.count - 1 && bushArray[selectedItem].isPurchased == false {
                imageDetail.image = bushArray[selectedItem].image
                detailLabel.text = "Price : $ \(bushArray[selectedItem].price)."
            } else {
                imageDetail.image = bushArray[bushArray.count-1].image
                detailLabel.text = "Coming Soon !"
                buyButtonPressed.isHidden = true
            }
        } else if selectedCategory == 1 && benchArray[selectedItem].isPurchased == false {
            if selectedItem < benchArray.count - 1 {
                imageDetail.image = benchArray[selectedItem].image
                detailLabel.text = "Price : $ \(benchArray[selectedItem].price)."
            } else {
                imageDetail.image = benchArray[benchArray.count-1].image
                detailLabel.text = "Coming Soon !"
                buyButtonPressed.isHidden = true
            }
        } else if selectedCategory == 2 && flowerArray[selectedItem].isPurchased == false {
            if selectedItem < flowerArray.count - 1 {
                imageDetail.image = flowerArray[selectedItem].image
                detailLabel.text = "Price : $ \(flowerArray[selectedItem].price)."
            } else {
                imageDetail.image = flowerArray[flowerArray.count-1].image
                detailLabel.text = "Coming Soon !"
                buyButtonPressed.isHidden = true
            }
        } else if selectedCategory == 3 && lampArray[selectedItem].isPurchased == false {
            if selectedItem < lampArray.count - 1 {
                imageDetail.image = lampArray[selectedItem].image
                detailLabel.text = "Price : $ \(lampArray[selectedItem].price)."
            } else {
                imageDetail.image = lampArray[lampArray.count-1].image
                detailLabel.text = "Coming Soon !"
                buyButtonPressed.isHidden = true
            }
        } else if selectedCategory == 4 && treeArray[selectedItem].isPurchased == false{
            if selectedItem < treeArray.count - 1 {
                imageDetail.image = treeArray[selectedItem].image
                detailLabel.text = "Price : $ \(treeArray[selectedItem].price)."
            } else {
                imageDetail.image = treeArray[treeArray.count-1].image
                detailLabel.text = "Coming Soon !"
                buyButtonPressed.isHidden = true
            }
        } else {
            return
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
