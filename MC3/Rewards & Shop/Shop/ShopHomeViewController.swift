//
//  ShopHomeViewController.swift
//  MC3
//
//  Created by Antonius F Aulia on 02/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit
var selectedCategory : Int = 0

struct ShopItem {
    var image : UIImage
    var price : Int
    var isPurchased : Bool
    var isSale : Bool
}

var bushArray = [ShopItem(image: #imageLiteral(resourceName: "Bush-1"), price: 50, isPurchased: false, isSale: true),
                 ShopItem(image: #imageLiteral(resourceName: "Bush-2"), price: 20, isPurchased: false, isSale: true),
                 ShopItem(image: #imageLiteral(resourceName: "Bush-1-Disable"), price: 20, isPurchased: false, isSale: false)]
var benchArray = [ShopItem(image: #imageLiteral(resourceName: "Bench"), price: 70, isPurchased: false, isSale: true),
                  ShopItem(image: #imageLiteral(resourceName: "Bench-Disable"), price: 50, isPurchased: false, isSale: false)]
var flowerArray = [ShopItem(image: #imageLiteral(resourceName: "Bush-1-Disable"), price: 50, isPurchased: false, isSale: false)]
var lampArray = [ShopItem(image: #imageLiteral(resourceName: "Reward-Lamp-1"), price: 80, isPurchased: false, isSale: true),
                 ShopItem(image: #imageLiteral(resourceName: "Reward-Lamp-2"), price: 80, isPurchased: false, isSale: true),
                 ShopItem(image: #imageLiteral(resourceName: "Bush-1-Disable"), price: 50, isPurchased: false, isSale: false)]
var treeArray = [ShopItem(image: #imageLiteral(resourceName: "Tree"), price: 100, isPurchased: false, isSale: true),
                 ShopItem(image: #imageLiteral(resourceName: "Tree-Disable"), price: 50, isPurchased: false, isSale: false)]

class ShopHomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = shopCollectionView.dequeueReusableCell(withReuseIdentifier: "shopCell", for: indexPath) as! ShopCollectionViewCell
        if selectedCategory == 0 {
            if indexPath.row < bushArray.count-1 {
                cell.shopCellImage.image = bushArray[indexPath.row].image
                cell.shopCellLabel.text = "$ \(String(bushArray[indexPath.row].price))"
            } else {
                cell.shopCellImage.image = bushArray[bushArray.count-1].image
                cell.shopCellLabel.text = "$ \(String(bushArray[bushArray.count-1].price))"
            }
        } else if selectedCategory == 1 {
            if indexPath.row < benchArray.count-1 {
                cell.shopCellImage.image = benchArray[indexPath.row].image
                cell.shopCellLabel.text = "$ \(String(benchArray[indexPath.row].price))"
            } else {
                cell.shopCellImage.image = benchArray[benchArray.count-1].image
                cell.shopCellLabel.text = "$ \(String(benchArray[benchArray.count-1].price))"
            }
        } else if selectedCategory == 2 {
            if indexPath.row < flowerArray.count-1 {
                cell.shopCellImage.image = flowerArray[indexPath.row].image
                cell.shopCellLabel.text = "$ \(String(flowerArray[indexPath.row].price))"
            } else {
                cell.shopCellImage.image = flowerArray[flowerArray.count-1].image
                cell.shopCellLabel.text = "$ \(String(flowerArray[flowerArray.count-1].price))"
            }
        } else if selectedCategory == 3 {
            if indexPath.row < lampArray.count-1 {
                cell.shopCellImage.image = lampArray[indexPath.row].image
                cell.shopCellLabel.text = "$ \(String(lampArray[indexPath.row].price))"
            } else {
                cell.shopCellImage.image = lampArray[lampArray.count-1].image
                cell.shopCellLabel.text = "$ \(String(lampArray[lampArray.count-1].price))"
            }
        } else if selectedCategory == 4 {
            if indexPath.row < treeArray.count-1 {
                cell.shopCellImage.image = treeArray[indexPath.row].image
                cell.shopCellLabel.text = "$ \(String(treeArray[indexPath.row].price))"
            } else {
                cell.shopCellImage.image = treeArray[treeArray.count-1].image
                cell.shopCellLabel.text = "$ \(String(treeArray[treeArray.count-1].price))"
            }
        } else {
            cell.shopCellLabel.text = "blom"
        }
        
        cell.shopCellImage.layer.cornerRadius = 10
        cell.shopCellImage.layer.borderColor = #colorLiteral(red: 0.3243855536, green: 0.2837193608, blue: 0.2650057673, alpha: 1)
        cell.shopCellImage.layer.borderWidth = 5
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectedCategory == 0 {
            
        } else if selectedCategory == 1 {
            
        } else if selectedCategory == 2 {
            
        } else if selectedCategory == 3 {
            
        } else if selectedCategory == 4 {
            
        } else {
            return
        }
    }
    
    @IBOutlet weak var shopCollectionView: UICollectionView!
    @IBOutlet weak var bushButton: UIButton!
    @IBOutlet weak var benchButton: UIButton!
    @IBOutlet weak var flowerButton: UIButton!
    @IBOutlet weak var lampButton: UIButton!
    @IBOutlet weak var treeButton: UIButton!
    
    @IBAction func bushPressed(_ sender: UIButton) {
        selectedCategory = 0
        bushButton.isSelected = true
        benchButton.isSelected = false
        flowerButton.isSelected = false
        lampButton.isSelected = false
        treeButton.isSelected = false
        buttonCondition()
        shopCollectionView.reloadData()
    }
    
    @IBAction func benchPressed(_ sender: UIButton) {
        selectedCategory = 1
        benchButton.isSelected = true
        bushButton.isSelected = false
        flowerButton.isSelected = false
        lampButton.isSelected = false
        treeButton.isSelected = false
        buttonCondition()
        shopCollectionView.reloadData()
    }
    
    @IBAction func flowerPressed(_ sender: UIButton) {
        selectedCategory = 2
        flowerButton.isSelected = true
        bushButton.isSelected = false
        benchButton.isSelected = false
        lampButton.isSelected = false
        treeButton.isSelected = false
        buttonCondition()
        shopCollectionView.reloadData()
    }
    
    @IBAction func lampPressed(_ sender: UIButton) {
        selectedCategory = 3
        lampButton.isSelected = true
        bushButton.isSelected = false
        benchButton.isSelected = false
        flowerButton.isSelected = false
        treeButton.isSelected = false
        buttonCondition()
        shopCollectionView.reloadData()
    }
    
    @IBAction func treePressed(_ sender: UIButton) {
        selectedCategory = 4
        treeButton.isSelected = true
        bushButton.isSelected = false
        benchButton.isSelected = false
        flowerButton.isSelected = false
        lampButton.isSelected = false
        buttonCondition()
        shopCollectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bushButton.isSelected = true
        buttonCondition()
        
        shopCollectionView.delegate = self
        shopCollectionView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func buttonCondition () {
        bushButton.setTitleColor(.white, for: .normal)
        bushButton.backgroundColor = #colorLiteral(red: 0.3243855536, green: 0.2837193608, blue: 0.2650057673, alpha: 1)
        bushButton.layer.cornerRadius = 5
        benchButton.setTitleColor(.white, for: .normal)
        benchButton.backgroundColor = #colorLiteral(red: 0.3243855536, green: 0.2837193608, blue: 0.2650057673, alpha: 1)
        benchButton.layer.cornerRadius = 5
        flowerButton.setTitleColor(.white, for: .normal)
        flowerButton.backgroundColor = #colorLiteral(red: 0.3243855536, green: 0.2837193608, blue: 0.2650057673, alpha: 1)
        flowerButton.layer.cornerRadius = 5
        lampButton.setTitleColor(.white, for: .normal)
        lampButton.backgroundColor = #colorLiteral(red: 0.3243855536, green: 0.2837193608, blue: 0.2650057673, alpha: 1)
        lampButton.layer.cornerRadius = 5
        treeButton.setTitleColor(.white, for: .normal)
        treeButton.backgroundColor = #colorLiteral(red: 0.3243855536, green: 0.2837193608, blue: 0.2650057673, alpha: 1)
        treeButton.layer.cornerRadius = 5
        
        
        if bushButton.isSelected == true {
            bushButton.setTitleColor(#colorLiteral(red: 0.3243855536, green: 0.2837193608, blue: 0.2650057673, alpha: 1), for: .selected)
            bushButton.backgroundColor = .white
            bushButton.tintColor = .white
            bushButton.layer.cornerRadius = 5
            bushButton.layer.borderColor = #colorLiteral(red: 0.3243855536, green: 0.2837193608, blue: 0.2650057673, alpha: 1)
            bushButton.layer.borderWidth = 5
        } else if benchButton.isSelected == true {
            benchButton.setTitleColor(#colorLiteral(red: 0.3243855536, green: 0.2837193608, blue: 0.2650057673, alpha: 1), for: .selected)
            benchButton.backgroundColor = .white
            benchButton.tintColor = .white
            benchButton.layer.cornerRadius = 5
            benchButton.layer.borderColor = #colorLiteral(red: 0.3243855536, green: 0.2837193608, blue: 0.2650057673, alpha: 1)
            benchButton.layer.borderWidth = 5
        } else if flowerButton.isSelected == true {
            flowerButton.setTitleColor(#colorLiteral(red: 0.3243855536, green: 0.2837193608, blue: 0.2650057673, alpha: 1), for: .selected)
            flowerButton.backgroundColor = .white
            flowerButton.tintColor = .white
            flowerButton.layer.cornerRadius = 5
            flowerButton.layer.borderColor = #colorLiteral(red: 0.3243855536, green: 0.2837193608, blue: 0.2650057673, alpha: 1)
            flowerButton.layer.borderWidth = 5
        } else if lampButton.isSelected == true {
            lampButton.setTitleColor(#colorLiteral(red: 0.3243855536, green: 0.2837193608, blue: 0.2650057673, alpha: 1), for: .selected)
            lampButton.backgroundColor = .white
            lampButton.tintColor = .white
            lampButton.layer.cornerRadius = 5
            lampButton.layer.borderColor = #colorLiteral(red: 0.3243855536, green: 0.2837193608, blue: 0.2650057673, alpha: 1)
            lampButton.layer.borderWidth = 5
        } else if treeButton.isSelected == true {
            treeButton.setTitleColor(#colorLiteral(red: 0.3243855536, green: 0.2837193608, blue: 0.2650057673, alpha: 1), for: .selected)
            treeButton.backgroundColor = .white
            treeButton.tintColor = .white
            treeButton.layer.cornerRadius = 5
            treeButton.layer.borderColor = #colorLiteral(red: 0.3243855536, green: 0.2837193608, blue: 0.2650057673, alpha: 1)
            treeButton.layer.borderWidth = 5
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
