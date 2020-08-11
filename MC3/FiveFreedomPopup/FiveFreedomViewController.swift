//
//  FiveFreedomViewController.swift
//  MC3
//
//  Created by Rahmat Zulfikri on 11/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class FiveFreedomViewController: UIViewController {

    @IBOutlet var backgroundView: UIView!
    @IBOutlet var contentImg: UIImageView!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var closeBtn: UIButton!
    @IBOutlet var nextBtn: UIButton!
    @IBOutlet var prevBtn: UIButton!
    
    
    let fiveImages: [UIImage] = [
        UIImage(named: "Five-Freedom-1")!,
        UIImage(named: "Five-Freedom-2")!,
        UIImage(named: "Five-Freedom-3")!,
        UIImage(named: "Five-Freedom-4")!,
        UIImage(named: "Five-Freedom-5")!,
    ]
    
    let fiveContents: [String] = [
        "Freedom from thirst and hunger is the basic need of all animals which emphasize consideration of the food type, the frequency provided, the manner of presentation, as well as the nutritional quality.",
        "Freedom from discomfort requires consideration of a number of factors including protection from adverse weather conditions, availability of fresh air, shade, warmth, sun-accessible areas, and other suitable facilities.",
        "Freedom from pain, injury and disease must consider the design of the cage, the availability of adequate space to prevent conflicts between animals, appropriate sanitation, food and health care from the veterinarian.",
        "Freedom to express normal behavior includes giving the animal an opportunity to choose and control so that they can make meaningful contributions to their own quality of life.",
        "Freedom from fear and distress includes freedom from suffering caused by threats of predators and frustration or boredom so that animals do not suffer from chronic stress."
    ]
    
    var contentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareScreen()
        // Do any additional setup after loading the view.
    }
    
    func prepareScreen() {
        view.isOpaque = false
        backgroundView.layer.cornerRadius = 10
        
        contentIndex = 0
        prepareContent(index: contentIndex)
    }
    
    func prepareContent(index: Int) {
        contentImg.image = fiveImages[index]
        contentLabel.text = fiveContents[index]
        
        switch index {
        case 0:
            prevBtn.isHidden = true
            nextBtn.isHidden = false
            break
        case 1, 2, 3:
            prevBtn.isHidden = false
            nextBtn.isHidden = false
            break
        case 4:
            prevBtn.isHidden = false
            nextBtn.isHidden = true
            break
        default:
            break
        }
    }
    
    @IBAction func onPressButton(_ sender: UIButton) {
        switch sender {
        case prevBtn:
            if (contentIndex > 0) {
                contentIndex -= 1
                prepareContent(index: contentIndex)
            }
            break
        case nextBtn:
            if (contentIndex < 4) {
                contentIndex += 1
                prepareContent(index: contentIndex)
            }
            break
        case closeBtn:
            dismiss(animated: true, completion: nil)
            break
        default:
            break
        }
    }
    
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: sender.view)
        if ((location.x < backgroundView.frame.minX || location.x > backgroundView.frame.maxX) || (location.y < backgroundView.frame.minY || location.y > backgroundView.frame.maxY)) {
           dismiss(animated: true, completion: nil)
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
