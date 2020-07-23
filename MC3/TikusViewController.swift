//
//  TikusViewController.swift
//  MC3
//
//  Created by Jeremy Jason on 19/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class TikusViewController: UIViewController {
    
    //kanan ke kiri
    @IBOutlet weak var tikus: UIImageView!
    @IBOutlet weak var tikus2: UIImageView!
    @IBOutlet weak var tikus3: UIImageView!
    @IBOutlet weak var tikus4: UIImageView!
    @IBOutlet weak var tikus5: UIImageView!
    @IBOutlet weak var tikus6: UIImageView!
    @IBOutlet weak var tikus7: UIImageView!
    @IBOutlet weak var tikus8: UIImageView!
    
    //kiri ke kanan
    @IBOutlet weak var tikus9: UIImageView!
    @IBOutlet weak var tikus10: UIImageView!
    @IBOutlet weak var tikus11: UIImageView!
    @IBOutlet weak var tikus12: UIImageView!
    
    @IBOutlet weak var tangan: UIImageView!
    
    var score = 0
    var timer: Timer?
    
    func startAnimate() {
        tesAnimasi(delay: 1, tikusInput: tikus, angka: -1000)
        tesAnimasi(delay: 2, tikusInput: tikus2, angka: -1000)
        tesAnimasi(delay: 3.1, tikusInput: tikus3, angka: -1000)
        tesAnimasi(delay: 4.2, tikusInput: tikus4, angka: -1000)
        tesAnimasi(delay: 5.4, tikusInput: tikus5, angka: 1000)
        tesAnimasi(delay: 6.3, tikusInput: tikus6, angka: -1000)
        tesAnimasi(delay: 7, tikusInput: tikus7, angka: -1000)
        tesAnimasi(delay: 8.3, tikusInput: tikus8, angka: -1000)
        tesAnimasi(delay: 9, tikusInput: tikus9, angka: 1000)
        tesAnimasi(delay: 10, tikusInput: tikus10, angka: 1000)
        tesAnimasi(delay: 10.2, tikusInput: tikus11, angka: 1000)
        tesAnimasi(delay: 3, tikusInput: tikus12, angka: 1000)
    }
    
    @objc func restart(){
        tikusHilang()
        startAnimate()
        
        Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { (_) in
           print("timer selesai")
        self.handle1()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tikusHilang()
        startAnimate()
        
        Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { (_) in
           print("timer selesai")
            self.handle()
        }
    }
    
    let settingsLauncher = SettingLauncher()
    
    func handle(){
        setText()
        settingsLauncher.showSettings()
    }
    
    func handle1(){
        setText()
        settingsLauncher.handleMuncul()
    }
    
    func ReplayAction(){
        settingsLauncher.playButton.addTarget(self, action: #selector(restart), for: .touchUpInside)
    }
    
    func setText(){
        let nilai = score*2
        settingsLauncher.tulisan2.text = "You just earn \(nilai)$ for"
        settingsLauncher.tulisan3.text = "catching \(score) mouse."
        score = 0
        ReplayAction()
    }

    
    
    @IBAction func tapped(_ sender: UITapGestureRecognizer) {
        // ngedetec position tikus 1 ketika bergerak
        guard let tikusPersentation = tikus.layer.presentation()
            else {
                return
        }
        // ngedetec position tikus 2 ketika bergerak
        guard let tikusPersentation2 = tikus2.layer.presentation()
            else {
                return
        }
        // ngedetec position tikus 3 ketika bergerak
        guard let tikusPersentation3 = tikus3.layer.presentation()
            else {
                return
        }
        // ngedetec position tikus 4 ketika bergerak
        guard let tikusPersentation4 = tikus4.layer.presentation()
            else {
                return
        }
        // ngedetec position tikus 5 ketika bergerak
        guard let tikusPersentation5 = tikus5.layer.presentation()
            else {
                return
        }
        // ngedetec position tikus 6 ketika bergerak
        guard let tikusPersentation6 = tikus6.layer.presentation()
            else {
                return
        }
        // ngedetec position tikus 7 ketika bergerak
        guard let tikusPersentation7 = tikus7.layer.presentation()
            else {
                return
        }
        // ngedetec position tikus 8 ketika bergerak
        guard let tikusPersentation8 = tikus8.layer.presentation()
            else {
                return
        }
        // ngedetec position tikus 9 ketika bergerak
        guard let tikusPersentation9 = tikus9.layer.presentation()
            else {
                return
        }
        // ngedetec position tikus 10 ketika bergerak
        guard let tikusPersentation10 = tikus10.layer.presentation()
            else {
                return
        }
        // ngedetec position tikus 11 ketika bergerak
        guard let tikusPersentation11 = tikus11.layer.presentation()
            else {
                return
        }
        // ngedetec position tikus 12 ketika bergerak
        guard let tikusPersentation12 = tikus12.layer.presentation()
            else {
                return
        }
        
        
        // ngedetec position tangan ketika bergerak
        guard let tanganPersentation = tangan.layer.presentation()
            else {
                return
        }
        
        
        let location = sender.location(in: sender.view)
        //            print(tikusPersentation.frame.origin.x)
        //            print(tanganPersentation.frame.origin.x)
        
        
        //animate tangan sesuai tap
        UIView.animate(withDuration: 0.3, animations: {
            self.tangan.center = location})
        self.tangan.center.y += 120
        
        /// pergerkan bnyak tikus
        // tikus satu
        
        if tanganPersentation.frame.intersects(tikusPersentation.frame)
        {
            // animasi berhenti
            tikus.alpha = 0
            self.tikus.stopAnimating()
            // Score nambah (score += 1)
            score += 1
        }
        // tikus satu selesai
        
        // tikus dua
        if tanganPersentation.frame.intersects(tikusPersentation2.frame)
        {
            // animasi berhenti
            tikus2.alpha = 0
            self.tikus2.stopAnimating()
            // Score nambah (score += 1)
            score += 1
        }
        // tikus dua selesai
        
        // tikus tiga
        if tanganPersentation.frame.intersects(tikusPersentation3.frame)
        {
            tikus3.alpha = 0
            self.tikus3.stopAnimating()
            // Score nambah (score += 1)
            score += 1
        }
        // tikus tiga selesai
        
        // tikus empat
        if tanganPersentation.frame.intersects(tikusPersentation4.frame)
        {
            tikus4.alpha = 0
            self.tikus4.stopAnimating()
            // Score nambah (score += 1)
            score += 1
        }
        // tikus dua selesai
        
        // tikus lima
        if tanganPersentation.frame.intersects(tikusPersentation5.frame)
        {
            tikus5.alpha = 0
            self.tikus5.stopAnimating()
            // Score nambah (score += 1)
            score += 1
        }
        // tikus dua selesai
        
        // tikus enam
        if tanganPersentation.frame.intersects(tikusPersentation6.frame)
        {
            tikus6.alpha = 0
            self.tikus6.stopAnimating()
            // Score nambah (score += 1)
            score += 1
        }
        // tikus enam selesai
        
        // tikus tujuh
        if tanganPersentation.frame.intersects(tikusPersentation7.frame)
        {
            tikus7.alpha = 0
             self.tikus7.stopAnimating()
            // Score nambah (score += 1)
            score += 1
        }
        // tikus tujuh selesai
        
        // tikus delapan
        if tanganPersentation.frame.intersects(tikusPersentation8.frame)
        {
            // animasi berhenti
            tikus8.alpha = 0
            self.tikus8.stopAnimating()
            // Score nambah (score += 1)
            score += 1
        }
        // tikus delapan selesai
        
        // tikus sembilan
        if tanganPersentation.frame.intersects(tikusPersentation9.frame)
        {
            // animasi berhenti
            tikus9.alpha = 0
            self.tikus9.stopAnimating()
            // Score nambah (score += 1)
            score += 1
        }
        // tikus sembilan selesai
        
        // tikus sepuluh
        if tanganPersentation.frame.intersects(tikusPersentation10.frame)
        {
            tikus10.alpha = 0
            self.tikus10.stopAnimating()
            // Score nambah (score += 1)
            score += 1
        }
        // tikus sepuluh selesai
        
        // tikus sebelas
        if tanganPersentation.frame.intersects(tikusPersentation11.frame)
        {
            tikus11.alpha = 0
            self.tikus11.stopAnimating()
            // Score nambah (score += 1)
            score += 1
        }
        // tikus sebelas selesai
        
        // tikus dua belas
        if tanganPersentation.frame.intersects(tikusPersentation12.frame)
        {
            tikus12.alpha = 0
            self.tikus12.stopAnimating()
            // Score nambah (score += 1)
            score += 1
        }
        // tikus dua belas selesai
        
        ///pergerakan banyak tikus selesai
        
    }
    
    func tesAnimasi(delay: Double, tikusInput: UIImageView, angka: Int) {
        UIView.animate(
            withDuration: 3,
            delay: delay,
            options: [.repeat],
            animations: {
            tikusInput.alpha = 1
            tikusInput.transform = CGAffineTransform(translationX: CGFloat(angka), y: 0)
        },
            completion: nil)
    }
    
    
    func tikusHilang(){
        tikus.alpha = 0
        tikus2.alpha = 0
        tikus3.alpha = 0
        tikus4.alpha = 0
        tikus5.alpha = 0
        tikus6.alpha = 0
        tikus7.alpha = 0
        tikus8.alpha = 0
        tikus9.alpha = 0
        tikus10.alpha = 0
        tikus11.alpha = 0
        tikus12.alpha = 0
    }
    
    func tikusMuncul(){
        tikus.alpha = 1
        tikus2.alpha = 1
        tikus3.alpha = 1
        tikus4.alpha = 1
        tikus5.alpha = 1
        tikus6.alpha = 1
        tikus7.alpha = 1
        tikus8.alpha = 1
        tikus9.alpha = 1
        tikus10.alpha = 1
        tikus11.alpha = 1
        tikus12.alpha = 1
    }
    
    
}


//performSegue(withIdentifier: "showSettings", sender: self)
//dismiss(animated: true, completion: nil)
