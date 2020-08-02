//
//  SoundManager.swift
//  MC3
//
//  Created by Rahmat Zulfikri on 01/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager {
    var soundCollection: [SoundEnum: AVAudioPlayer] = [:]
    var avAudioPlayer: AVAudioPlayer?

    init() {
        /** PREPARE SOUND*/
        
        // perpare button sound
        let pathButton = Bundle.main.path(forResource: "Button.mp3", ofType:nil)!
        let urlButton = URL(fileURLWithPath: pathButton)
        
        // perpare coin sound
        let pathCoin = Bundle.main.path(forResource: "Coins.mp3", ofType:nil)!
        let urlCoin = URL(fileURLWithPath: pathCoin)
        
        // perpare cat eating sound
        let pathCatEating = Bundle.main.path(forResource: "Cat-Eating.mp3", ofType:nil)!
        let urlCatEating = URL(fileURLWithPath: pathCatEating)
        
        // perpare cat angry sound
        let pathCatAngry = Bundle.main.path(forResource: "Cat-Meow-Angry.mp3", ofType:nil)!
        let urlCatAngry = URL(fileURLWithPath: pathCatAngry)
        
        // perpare cat regular sound
        let pathCatRegular = Bundle.main.path(forResource: "Cat-Meow-Regular.mp3", ofType:nil)!
        let urlCatRegular = URL(fileURLWithPath: pathCatRegular)
        
        // perpare cat puring food sound
        let pathCatPouringFood = Bundle.main.path(forResource: "Cat-Pouring-Food.mp3", ofType:nil)!
        let urlCatPouringFood = URL(fileURLWithPath: pathCatPouringFood)
        
        // prepare catpurr sound
        let pathCatPur = Bundle.main.path(forResource: "Cat-Purr.mp3", ofType:nil)!
        let urlCatPurr = URL(fileURLWithPath: pathCatPur)
       
        do {
            let buttonAvAudioPlayer = try AVAudioPlayer(contentsOf: urlButton)
            let coinAvAudioPlayer = try AVAudioPlayer(contentsOf: urlCoin)
            let catEatingAvAudioPlayer = try AVAudioPlayer(contentsOf: urlCatEating)
            let catAngryAvAudioPlayer = try AVAudioPlayer(contentsOf: urlCatAngry)
            let catRegularAvAudioPlayer = try AVAudioPlayer(contentsOf: urlCatRegular)
            let catPouringFoodAvAudioPlayer = try AVAudioPlayer(contentsOf: urlCatPouringFood)
            let catPurAvAudioPlayer = try AVAudioPlayer(contentsOf: urlCatPurr)

            soundCollection[.button] = buttonAvAudioPlayer
            soundCollection[.coin] = coinAvAudioPlayer
            soundCollection[.catEating] = catEatingAvAudioPlayer
            soundCollection[.catMeowAngry] = catAngryAvAudioPlayer
            soundCollection[.catMeowRegular] = catRegularAvAudioPlayer
            soundCollection[.catPouringFood] = catPouringFoodAvAudioPlayer
            soundCollection[.catPurr] = catPurAvAudioPlayer
        } catch {
            print("FAILED TO INIT SOUND MANAGER")
        }
    }
    
    func play(soundType: SoundEnum) {
        let soundStatus = settingsDefaults.bool(forKey: "soundStatus")
        
        if (soundStatus) {
            if let player: AVAudioPlayer = soundCollection[soundType] {
                if (!player.isPlaying) {
                    player.numberOfLoops = 1
                    player.play()
                }
                
            } else {
                print("FAILED TO PLAY AUDIO")
            }
        }
    }
    
    func stop(soundType: SoundEnum) {
        let soundStatus = settingsDefaults.bool(forKey: "soundStatus")
        
        if (soundStatus) {
            if let player: AVAudioPlayer = soundCollection[soundType] {
                player.stop()
            } else {
                print("FAILED TO STOP AUDIO")
            }
        }
    }
    
    public func getPlayer(soundType: SoundEnum) -> AVAudioPlayer?{
        return soundCollection[soundType] ?? nil
    }
    
    public func stopAll() {
        self.stop(soundType: .catPurr)
    }
}
