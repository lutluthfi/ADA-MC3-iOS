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
        
        // prepare catpurr sound
        let pathCatPur = Bundle.main.path(forResource: "Cat-Purr.mp3", ofType:nil)!
        let urlCatPurr = URL(fileURLWithPath: pathCatPur)
       
        do {
            let catPurAvAudioPlayer = try AVAudioPlayer(contentsOf: urlCatPurr)
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
