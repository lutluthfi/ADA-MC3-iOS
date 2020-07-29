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
        
        scrollView.contentInsetAdjustmentBehavior = .never
    }
    
    @IBAction func onPressClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func updatePageNumber() {
        // If not case to `Int` will give an error.
        let currentPage = Int(ceil(scrollView.contentOffset.x / scrollView.frame.size.width))
        pageControl.currentPage = currentPage
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        updatePageNumber()
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        updatePageNumber()
    }
    
    @IBAction func onTapGesture(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: sender.view)
        let frameWidth = self.view.frame.maxX
        let xPosition = location.x.truncatingRemainder(dividingBy: frameWidth)
        let currentPage = pageControl.currentPage
        if (xPosition < 200 && currentPage > 0) {
            let offset = CGPoint(x: (currentPage - 1) * Int(frameWidth), y: 0)
            self.scrollView.setContentOffset(offset, animated: true)
        }
        
        if (xPosition > self.view.frame.maxX - 200 && currentPage < 6) {
            let offset = CGPoint(x: (currentPage + 1) * Int(frameWidth), y: 0)
            self.scrollView.setContentOffset(offset, animated: true)
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
