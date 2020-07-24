//
//  RewardViewController.swift
//  MC3
//
//  Created by Antonius F Aulia on 23/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class RewardViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet weak var rewardCollectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = rewardCollectionView.dequeueReusableCell(withReuseIdentifier: "rewardCell", for: indexPath) as! RewardCollectionViewCell
        cell.rewardCellImage.layer.borderColor = #colorLiteral(red: 0.3243855536, green: 0.2837193608, blue: 0.2650057673, alpha: 1)
        cell.rewardCellImage.layer.cornerRadius = 10
        cell.rewardCellImage.layer.borderWidth = 3
        return cell
    }
    

    @IBOutlet weak var prizeButton: UIButton!
    @IBOutlet weak var redeemButton: UIButton!
    @IBOutlet weak var historyButton: UIButton!
    
    @IBAction func PrizeButtonPressed(_ sender: UIButton) {
        prizeButton.isSelected = true
        redeemButton.isSelected = false
        historyButton.isSelected = false
        buttonCondition()
    }
    
    @IBAction func RedeemButtonPressed(_ sender: UIButton) {
        prizeButton.isSelected = false
        redeemButton.isSelected = true
        historyButton.isSelected = false
        buttonCondition()
    }
    
    @IBAction func HistoryButtonPressed(_ sender: UIButton) {
        prizeButton.isSelected = false
        redeemButton.isSelected = false
        historyButton.isSelected = true
        buttonCondition()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        prizeButton.isSelected = true
        rewardCollectionView.delegate = self
        rewardCollectionView.dataSource = self
        buttonCondition()
        // Do any additional setup after loading the view.
    }
    
    func buttonCondition() {
        prizeButton.setTitleColor(.white, for: .normal)
        prizeButton.backgroundColor = #colorLiteral(red: 0.3243855536, green: 0.2837193608, blue: 0.2650057673, alpha: 1)
        prizeButton.layer.cornerRadius = 10
        prizeButton.clipsToBounds = true
        redeemButton.setTitleColor(.white, for: .normal)
        redeemButton.backgroundColor = #colorLiteral(red: 0.3243855536, green: 0.2837193608, blue: 0.2650057673, alpha: 1)
        redeemButton.layer.cornerRadius = 10
        redeemButton.clipsToBounds = true
        historyButton.setTitleColor(.white, for: .normal)
        historyButton.backgroundColor = #colorLiteral(red: 0.3243855536, green: 0.2837193608, blue: 0.2650057673, alpha: 1)
        historyButton.layer.cornerRadius = 10
        historyButton.clipsToBounds = true
        
        if prizeButton.isSelected {
            prizeButton.backgroundColor = #colorLiteral(red: 1, green: 0.9918932319, blue: 0.9789504409, alpha: 1)
            prizeButton.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            prizeButton.layer.borderColor = #colorLiteral(red: 0.3243855536, green: 0.2837193608, blue: 0.2650057673, alpha: 1)
            prizeButton.layer.borderWidth = 4
            prizeButton.setTitleColor(#colorLiteral(red: 0.3243855536, green: 0.2837193608, blue: 0.2650057673, alpha: 1), for: .selected)
        } else if redeemButton.isSelected {
            redeemButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            redeemButton.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            redeemButton.layer.borderColor = #colorLiteral(red: 0.3243855536, green: 0.2837193608, blue: 0.2650057673, alpha: 1)
            redeemButton.layer.borderWidth = 4
            redeemButton.titleLabel?.textColor = #colorLiteral(red: 0.3243855536, green: 0.2837193608, blue: 0.2650057673, alpha: 1)
            redeemButton.setTitleColor(#colorLiteral(red: 0.3243855536, green: 0.2837193608, blue: 0.2650057673, alpha: 1), for: .selected)
        } else if historyButton.isSelected{
            historyButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            historyButton.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            historyButton.layer.borderColor = #colorLiteral(red: 0.3243855536, green: 0.2837193608, blue: 0.2650057673, alpha: 1)
            historyButton.layer.borderWidth = 4
            historyButton.titleLabel?.textColor = #colorLiteral(red: 0.3243855536, green: 0.2837193608, blue: 0.2650057673, alpha: 1)
            historyButton.setTitleColor(#colorLiteral(red: 0.3243855536, green: 0.2837193608, blue: 0.2650057673, alpha: 1), for: .selected)
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