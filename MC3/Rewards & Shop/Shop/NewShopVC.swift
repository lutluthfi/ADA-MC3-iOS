//
//  NewShopVC.swift
//  MC3
//
//  Created by Muhammad Faruuq Qayyum on 16/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit



class NewShopVC: UIViewController {
    
    var singleSelectedItem: ItemShop?
    var category: String = "Bush"

    var presentItems: [ItemShop] = [] {
        didSet {
            shopCollectionView.reloadData()
        }
    }
    var bushItems = [
        ItemShop(image: "Bush-1", price: 20, isPurchased: false, isLocked: false, itemNumber: 0),
        ItemShop(image: "Bush-2", price: 30, isPurchased: false, isLocked: false, itemNumber: 1),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 2),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 3),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 4),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 5),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 6),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 7),
    ]
    var benchItems = [
        ItemShop(image: "Bench", price: 40, isPurchased: false, isLocked: false, itemNumber: 0),
        ItemShop(image: "Bench-Flip", price: 40, isPurchased: false, isLocked: false, itemNumber: 1),
        ItemShop(image: "Bench-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 2),
        ItemShop(image: "Bench-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 3),
        ItemShop(image: "Bench-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 4),
        ItemShop(image: "Bench-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 5),
        ItemShop(image: "Bench-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 6),
        ItemShop(image: "Bench-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 7)
    ]
    var flowerItems = [
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 0),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 1),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 2),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 3),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 4),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 5),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 6),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 7),
    ]
    var lampItems = [
        ItemShop(image: "Reward-Lamp-1", price: 50, isPurchased: false, isLocked: false, itemNumber: 0),
        ItemShop(image: "Reward-Lamp-2", price: 60, isPurchased: false, isLocked: false, itemNumber: 1),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 2),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 3),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 4),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 5),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 6),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 7),
    ]
    var treeItems = [
        ItemShop(image: "Tree", price: 70, isPurchased: false, isLocked: true, itemNumber: 0),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 1),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 2),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 3),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 4),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 5),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 6),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 7),
    ]
    
    //    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("items.plist")
    let bushFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("bush.plist")
    let benchFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("bench.plist")
    let flowerFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("flower.plist")
    let lampFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("lamp.plist")
    let treeFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("tree.plist")
    var arrayNumber: Int?
    
    @IBOutlet weak var bushBtn: UIButton!
    @IBOutlet weak var benchBtn: UIButton!
    @IBOutlet weak var flowerBtn: UIButton!
    @IBOutlet weak var lampBtn: UIButton!
    @IBOutlet weak var treeBtn: UIButton!
    @IBOutlet weak var shopCollectionView: UICollectionView!
    @IBOutlet weak var rewardsLabel: UILabel!
    @IBOutlet weak var alert: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rewardsLabel.text = ("\(settingsDefaults.integer(forKey: Keys.rewards))")
        category = "Bush"
        shopCollectionView.delegate = self
        shopCollectionView.dataSource = self
        checkExistence(url: bushFilePath!, item: bushItems)
        print("File Manager = \(bushFilePath!)")
    }
    
    @IBAction func categoryBtnAction(_ sender: UIButton) {
        switch sender.currentTitle {
        case "Bush":
            //show item
            category = sender.currentTitle!
            checkExistence(url: bushFilePath!, item: bushItems)
//            shopCollectionView.reloadData()
            
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
            checkExistence(url: benchFilePath!, item: benchItems)
//            shopCollectionView.reloadData()
            
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
            checkExistence(url: flowerFilePath!, item: flowerItems)
//            shopCollectionView.reloadData()
            
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
            checkExistence(url: lampFilePath!, item: lampItems)
//            shopCollectionView.reloadData()
            
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
            checkExistence(url: treeFilePath!, item: treeItems)
//            shopCollectionView.reloadData()
            
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
                singleSelectedItem?.isPurchased = true
                presentItems[arrayNumber!] = singleSelectedItem!
                switch category {
                case "Bush":
                    saveItems(item: presentItems, url: bushFilePath!)
                case "Bench":
                    saveItems(item: benchItems, url: benchFilePath!)
                case "Flower":
                    saveItems(item: presentItems, url: flowerFilePath!)
                case "Lamp":
                    saveItems(item: presentItems, url: lampFilePath!)
                case "Tree":
                    saveItems(item: presentItems, url: treeFilePath!)
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
        shopCollectionView.reloadData()
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
//        shopCollectionView.reloadData()
    }
    
    func checkExistence(url: URL, item: [ItemShop]) {
        if FileManager.default.fileExists(atPath: url.path) == false {
            presentItems = item
        } else {
            loadItems(url: url)
        }
//        shopCollectionView.reloadData()
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
