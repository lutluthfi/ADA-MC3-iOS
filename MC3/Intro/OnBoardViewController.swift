//
//  OnBoardViewController.swift
//  MC3
//
//  Created by Rahmat Zulfikri on 07/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class OnBoardViewController: UIViewController {
    
    static let identifier = String(describing: OnBoardViewController.self)

    @IBOutlet var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    private func setupViewDidLoad() {
        btnNext.layer.cornerRadius = 5
    }

    @IBAction func onPressBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: IntroViewController.identifier, bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: IntroViewController.identifier)
        self.navigationController?.pushViewController(viewController, animated: true)    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
