//
//  NyobaTikusViewController.swift
//  MC3
//
//  Created by Jeremy Jason on 17/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class NyobaTikusViewController: UIViewController {

    @IBOutlet weak var tikus: UIImageView!
    @IBOutlet weak var tangan: UIImageView!
    
        override func viewDidLoad() {
        super.viewDidLoad()
        tikusJalan()
    }
    
    
    
    @IBAction func tapped(_ sender: UITapGestureRecognizer) {
        // ngedetec position tikus ketika bergerak
        guard let tikusPersentation = tikus.layer.presentation()
            else {
            return
        }
        // ngedetec position tangan ketika bergerak
        guard let tanganPersentation = tangan.layer.presentation()
            else {
            return
        }
        
        let location = sender.location(in: sender.view)
        print(tikusPersentation.frame.origin.x)
        print(tanganPersentation.frame.origin.x)
        //animate tangan sesuai tap
        UIView.animate(withDuration: 0.4, animations: {
        self.tangan.center = location})
        self.tangan.center.y += 100
// cara detect tap apakah kena di mouse ato ngga
//        if location.x < tikusPersentation.frame.origin.x && location.y < tikusPersentation.frame.origin.y
//            location.x < tikus.frame.maxX && location.y > tikus.frame.minY && location.y < tikus.frame.maxY
//        if tanganGerak == tikusGerak
            
        if tanganPersentation.frame.intersects(tikusPersentation.frame)
                {
                print("tikus kena")
                // ganti gambar ( image literal)
                    tikus.image = #imageLiteral(resourceName: "Phone")
                // func delay
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    print("This message is delayed")
                    // animasi berhenti
                    self.tikus.layer.removeAllAnimations()
                 }
                    
                // Score nambah (score += 1)
        } else {
            print("ga kena")
        }
    }
    
    func tikusJalan(){
        UIView.animate(withDuration: 10, animations: {
        self.tikus.frame.origin.x -= 900 },completion: nil)
    }


}
