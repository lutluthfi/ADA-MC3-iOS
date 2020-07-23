//
//  ProfileArticlesViewController.swift
//  MC3
//
//  Created by Rahmat Zulfikri on 20/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ProfileArticlesViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var closeBtn: UIButton!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareScreen()
        // Do any additional setup after loading the view.
        
        scrollView.delegate = self
    }
    
    func prepareScreen() {
        closeBtn.layer.borderWidth = 4
        closeBtn.layer.cornerRadius = 5
        closeBtn.layer.borderColor = UIColor(hex: "#413834")?.cgColor
        
        let angle = CGFloat.pi/2
        pageControl.transform = CGAffineTransform(rotationAngle: angle)
        
        scrollView.contentInsetAdjustmentBehavior = .never
    }
    
    @IBAction func onPressClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func updatePageNumber() {
        // If not case to `Int` will give an error.
        let currentPage = Int(ceil(scrollView.contentOffset.y / scrollView.frame.size.height))
        pageControl.currentPage = currentPage
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        updatePageNumber()
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        updatePageNumber()
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
