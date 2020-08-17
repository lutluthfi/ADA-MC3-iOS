//
//  NewShopVC.swift
//  MC3
//
//  Created by Muhammad Faruuq Qayyum on 16/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

var newSelectedItem: ItemShop?
var category: String = "Bush"

class NewShopVC: UIViewController {

    @IBOutlet weak var bushBtn: UIButton!
    @IBOutlet weak var benchBtn: UIButton!
    @IBOutlet weak var flowerBtn: UIButton!
    @IBOutlet weak var lampBtn: UIButton!
    @IBOutlet weak var treeBtn: UIButton!
    @IBOutlet weak var shopCollectionView: UICollectionView!
    @IBOutlet weak var rewardsValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rewardsValue.text = ("\(settingsDefaults.integer(forKey: Keys.rewards))")
        presentItems = bushItems
        shopCollectionView.delegate = self
        shopCollectionView.dataSource = self
    }

    @IBAction func categoryBtnAction(_ sender: UIButton) {
        switch sender.currentTitle {
        case "Bush":
            //show item
            category = sender.currentTitle!
            presentItems = bushItems
            shopCollectionView.reloadData()
            
            //button appearance
            bushBtn.isSelected = true
            bushBtn.backgroundColor = UIColor(named: "BG")
            benchBtn.isSelected = false
            benchBtn.backgroundColor = UIColor(named: "413834")
            flowerBtn.isSelected = false
            flowerBtn.backgroundColor = UIColor(named: "413834")
            lampBtn.isSelected = false
            lampBtn.backgroundColor = UIColor(named: "413834")
            treeBtn.isSelected = false
            treeBtn.backgroundColor = UIColor(named: "413834")
        case "Bench":
            //show item
            category = sender.currentTitle!
            presentItems = benchItems
            shopCollectionView.reloadData()
            
            //button appearance
            benchBtn.isSelected = true
            benchBtn.backgroundColor = UIColor(named: "BG")
            bushBtn.isSelected = false
            bushBtn.backgroundColor = UIColor(named: "413834")
            flowerBtn.isSelected = false
            flowerBtn.backgroundColor = UIColor(named: "413834")
            lampBtn.isSelected = false
            lampBtn.backgroundColor = UIColor(named: "413834")
            treeBtn.isSelected = false
            treeBtn.backgroundColor = UIColor(named: "413834")
        case "Flower":
            //show item
            category = sender.currentTitle!
            presentItems = flowerItems
            shopCollectionView.reloadData()
            
            //button appearance
            flowerBtn.isSelected = true
            flowerBtn.backgroundColor = UIColor(named: "BG")
            bushBtn.isSelected = false
            bushBtn.backgroundColor = UIColor(named: "413834")
            benchBtn.isSelected = false
            benchBtn.backgroundColor = UIColor(named: "413834")
            lampBtn.isSelected = false
            lampBtn.backgroundColor = UIColor(named: "413834")
            treeBtn.isSelected = false
            treeBtn.backgroundColor = UIColor(named: "413834")
        case "Lamp":
            //show item
            category = sender.currentTitle!
            presentItems = lampItems
            shopCollectionView.reloadData()
            
            //button appearance
            lampBtn.isSelected = true
            lampBtn.backgroundColor = UIColor(named: "BG")
            bushBtn.isSelected = false
            bushBtn.backgroundColor = UIColor(named: "413834")
            benchBtn.isSelected = false
            benchBtn.backgroundColor = UIColor(named: "413834")
            flowerBtn.isSelected = false
            flowerBtn.backgroundColor = UIColor(named: "413834")
            treeBtn.isSelected = false
            treeBtn.backgroundColor = UIColor(named: "413834")
        case "Tree":
            //show item
            category = sender.currentTitle!
            presentItems = treeItems
            shopCollectionView.reloadData()
            
            //button appearance
            treeBtn.isSelected = true
            treeBtn.backgroundColor = UIColor(named: "BG")
            bushBtn.isSelected = false
            bushBtn.backgroundColor = UIColor(named: "413834")
            benchBtn.isSelected = false
            benchBtn.backgroundColor = UIColor(named: "413834")
            flowerBtn.isSelected = false
            flowerBtn.backgroundColor = UIColor(named: "413834")
            lampBtn.isSelected = false
            lampBtn.backgroundColor = UIColor(named: "413834")
        default:
            break
        }
    }
}

extension NewShopVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presentItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = shopCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NewShopCell
        let presents = presentItems[indexPath.item]
        cell.shopImage.image = UIImage(named: presents.image)
        cell.shopPriceLabel.text = "$\(presents.price)"
        cell.shopImage.layer.cornerRadius = 10
        cell.shopImage.layer.borderWidth = 5
        cell.shopImage.layer.borderColor = UIColor(named: "413834")?.cgColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected item is \(presentItems[indexPath.item])")
        newSelectedItem = presentItems[indexPath.item]
        let storyboard = UIStoryboard(name: "ShopStoryboard", bundle: .main)
        let alertVC = storyboard.instantiateViewController(withIdentifier: "AlertConfirmation") as! AlertConfirmation
        alertVC.modalTransitionStyle = .crossDissolve
        present(alertVC, animated: true)
    }
    
}
