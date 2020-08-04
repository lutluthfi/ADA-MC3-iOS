//
//  SettingLauncher.swift
//  MC3
//
//  Created by Jeremy Jason on 21/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

protocol TikusGameDelegate {
    func playAgain()
    func backToRoom()
}

class SettingLauncher: NSObject {
    
    let blackView = UIView()
    let whiteView = UIView()
    let tulisan = UILabel()
    let tulisan2 = UILabel()
    let tulisan3 = UILabel()
    var playButton = CustomButton()
    var homeButton = CustomButton()
    
    var delegate: TikusGameDelegate?
    
    func showSettings() {
        //show pop up
        handleMuncul()
        if let window = UIApplication.shared.keyWindow{
            
            window.addSubview(blackView)
            window.addSubview(whiteView)
            window.addSubview(tulisan)
            window.addSubview(tulisan2)
            window.addSubview(tulisan3)
            window.addSubview(playButton)
            window.addSubview(homeButton)
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.8)
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.5) {
                self.blackView.alpha = 1
            }
            
            whiteView.frame = CGRect(x: 240, y: 50, width: 400, height: 320)
            whiteView.backgroundColor = UIColor(white: 1, alpha: 1)
            whiteView.layer.cornerRadius = 10
            
            tulisan.frame = CGRect(x: 340, y: 7, width: 400, height: 200)
            tulisan.text = "Congratulation!"
            tulisan.textColor = UIColor.black
            tulisan.font = UIFont(name: "Arial", size: 30)
            
            tulisan2.frame = CGRect(x: 375, y: 50, width: 400, height: 200)
            tulisan2.textColor = UIColor.black
            tulisan2.font = UIFont(name: "Arial", size: 15)
            
            tulisan3.frame = CGRect(x: 380, y: 75, width: 400, height: 200)
            tulisan3.textColor = UIColor.black
            tulisan3.font = UIFont(name: "Arial", size: 15)
            
            playButton.frame = CGRect(x: 300, y: 280, width: 130, height: 50)
            playButton.setTitle("Play Again", for: .normal)
            
            homeButton.frame = CGRect(x: 440, y: 280, width: 130, height: 50)
            homeButton.setTitle("Back to Room", for: .normal)
            
            addReplayAction()
            addHomeAction()
        }
    }
    
    
    
    func addReplayAction(){
        playButton.addTarget(self, action: #selector(handlePlayAgain), for: .touchUpInside)
    }
    
    func addHomeAction(){
        homeButton.addTarget(self, action: #selector(pindahScreen), for: .touchUpInside)
    }
    
    @objc func handlePlayAgain() {
        handleDismiss()
        delegate?.playAgain()
    }
    
    @objc func pindahScreen(){
        handleDismiss()
        delegate?.backToRoom()
    }
    
    func handleDismiss(){
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
            self.whiteView.alpha = 0
            self.tulisan.alpha = 0
            self.tulisan2.alpha = 0
            self.tulisan3.alpha = 0
            self.playButton.alpha = 0
            self.homeButton.alpha = 0
        }
    }
    
    func handleMuncul(){
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 1
            self.whiteView.alpha = 1
            self.tulisan.alpha = 1
            self.tulisan2.alpha = 1
            self.tulisan3.alpha = 1
            self.playButton.alpha = 1
            self.homeButton.alpha = 1
        }
    }
    
    override init() {
        super.init()
        
    }
}
