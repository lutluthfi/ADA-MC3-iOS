//
//  NewShopVC.swift
//  MC3
//
//  Created by Muhammad Faruuq Qayyum on 16/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class NewShopVC: UIViewController {
    
    static var bush1Purchased: Bool = false
    static var bush2Purchased: Bool = false
    static var benchPurchased: Bool = false
    static var flowePurchased: Bool = false
    static var lamp1Purchased: Bool = false
    static var lamp2Purchased: Bool = false
    static var treePurchased: Bool = false

    var presentItems: [ItemShop] = [] {
        didSet {
            shopCollectionView.reloadData()
        }
    }
    
    var singleSelectedItem: ItemShop?
    var category: String = "Bush"
    var arrayNumber: Int?
    
    @IBOutlet weak var bushBtn: UIButton!
    @IBOutlet weak var benchBtn: UIButton!
    @IBOutlet weak var flowerBtn: UIButton!
    @IBOutlet weak var lampBtn: UIButton!
    @IBOutlet weak var treeBtn: UIButton!
    @IBOutlet weak var shopCollectionView: UICollectionView!
    @IBOutlet weak var rewardsLabel: UILabel!
    @IBOutlet weak var alert: UIVisualEffectView!
    @IBOutlet weak var confirmationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rewardsLabel.text = ("\(settingsDefaults.integer(forKey: Keys.rewards))")
        category = "Bush"
        shopCollectionView.delegate = self
        shopCollectionView.dataSource = self
        checkExistence(url: DataModel.bushFilePath!, item: DataModel.bushItems)
        print("File Manager = \(DataModel.bushFilePath!)")
    }
    
    @IBAction func categoryBtnAction(_ sender: UIButton) {
        switch sender.currentTitle {
        case "Bush":
            //show item
            category = sender.currentTitle!
            checkExistence(url: DataModel.bushFilePath!, item: DataModel.bushItems)
            
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
            checkExistence(url: DataModel.benchFilePath!, item: DataModel.benchItems)
            
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
            checkExistence(url: DataModel.flowerFilePath!, item: DataModel.flowerItems)
            
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
            checkExistence(url: DataModel.lampFilePath!, item: DataModel.lampItems)
            
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
            checkExistence(url: DataModel.treeFilePath!, item: DataModel.treeItems)
            
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
    
    @IBAction func unwindToNewShopVC(_ segue: UIStoryboardSegue) {
        rewardsLabel.text = "\(settingsDefaults.integer(forKey: Keys.rewards))"
    }
    
    @IBAction func alertBtn(_ sender: UIButton) {
        switch sender.currentTitle {
        case "No":
            UIView.animate(withDuration: 0.3) {
                self.alert.alpha = 0
            }
        default:
            if rewardsValue < singleSelectedItem!.price {
                let alert = UIAlertController(title: "Insufficient Balance", message: "You are running out of coins. Play with your cat to get more coins", preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(ok)
                present(alert, animated: true)
            } else {
                rewardsValue -= singleSelectedItem!.price
                settingsDefaults.set(rewardsValue, forKey: Keys.rewards)
                DispatchQueue.main.async {
                    self.rewardsLabel.text = ("\(settingsDefaults.integer(forKey: Keys.rewards))")
                }
                singleSelectedItem?.isPurchased = true
                presentItems[arrayNumber!] = singleSelectedItem!
                switch category {
                case "Bush":
                    saveItems(item: presentItems, url: DataModel.bushFilePath!)
                    if arrayNumber == 0 {
                        NewShopVC.bush1Purchased = true
                        settingsDefaults.set(NewShopVC.bush1Purchased, forKey: Keys.bush1Purchased)
                    } else if arrayNumber == 1 {
                        NewShopVC.bush2Purchased = true
                        settingsDefaults.set(NewShopVC.bush2Purchased, forKey: Keys.bush2Purchased)
                    }
                case "Bench":
                    saveItems(item: presentItems, url: DataModel.benchFilePath!)
                    NewShopVC.benchPurchased = true
                    settingsDefaults.set(NewShopVC.benchPurchased, forKey: Keys.benchPurchased)
                case "Flower":
                    saveItems(item: presentItems, url: DataModel.flowerFilePath!)
                case "Lamp":
                    saveItems(item: presentItems, url: DataModel.lampFilePath!)
                    if arrayNumber == 0 {
                        NewShopVC.lamp1Purchased = true
                        settingsDefaults.set(NewShopVC.lamp1Purchased, forKey: Keys.lamp1Purchased)
                    } else if arrayNumber == 1 {
                        NewShopVC.lamp2Purchased = true
                        settingsDefaults.set(NewShopVC.lamp2Purchased, forKey: Keys.lamp2Purchased)
                    }
                case "Tree":
                    saveItems(item: presentItems, url: DataModel.treeFilePath!)
                    NewShopVC.treePurchased = true
                    settingsDefaults.set(NewShopVC.treePurchased, forKey: Keys.treePurchased)
                default:
                    break
                }
                alert.alpha = 0
            }
        }
    }
    
    func saveItems(item: [ItemShop], url: URL) {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(item)
            try data.write(to: url)
        } catch {
            print("Error encoding data array, \(error)")
        }
    }
    
    func loadItems(url: URL) {
        if let data = try? Data(contentsOf: url) {
            let decoder = PropertyListDecoder()
            do {
                presentItems = try decoder.decode([ItemShop].self, from: data)
            } catch {
                print("Error decoding data array, \(error)")
            }
        }
    }
    
    func checkExistence(url: URL, item: [ItemShop]) {
        if FileManager.default.fileExists(atPath: url.path) == false {
            presentItems = item
        } else {
            loadItems(url: url)
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
        
        if presents.price == 0 && presents.isLocked == true {
            cell.shopPriceLabel.text = "Locked"
            cell.shopImage.alpha = 1
        } else if presents.isPurchased == true {
            cell.shopImage.alpha = 0.5
            cell.shopPriceLabel.text = "SOLD"
        } else {
            cell.shopImage.alpha = 1
            cell.shopPriceLabel.text = "$\(presents.price)"
        }
        cell.shopImage.image = UIImage(named: presents.image)
        
        cell.shopImage.layer.cornerRadius = 10
        cell.shopImage.layer.borderWidth = 5
        cell.shopImage.layer.borderColor = UIColor(named: "413834")?.cgColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let present = presentItems[indexPath.item]
        if present.isPurchased == false {
            singleSelectedItem = presentItems[indexPath.item]
            arrayNumber = presentItems[indexPath.item].itemNumber
            print("selected item = \(String(describing: singleSelectedItem)), item number = \(String(describing: arrayNumber))")
            confirmationLabel.text = "Buy 1 \(category) for $\(presentItems[indexPath.item].price)?"
            UIView.animate(withDuration: 0.3) {
                self.alert.alpha = 1
            }
        } else {
            return
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
