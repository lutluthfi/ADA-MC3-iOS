//
//  SoundManager.swift
//  MC3
//
//  Created by Rahmat Zulfikri on 01/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager: AudioManager {
    
    override func play() {
        let soundStatus = settingsDefaults.bool(forKey: "soundStatus")
        
//        if (soundStatus) {
//            if let player: AVAudioPlayer = self.avAudioPlayer {
//                if (!player.isPlaying) {
//                    player.numberOfLoops = 1
//                    player.play()
//                }
//                
//            } else {
//                print("FAILED TO PLAY AUDIO")
//            }
//        }
    }
    
    override func stop() {
        let soundStatus = settingsDefaults.bool(forKey: "soundStatus")
        
        if (soundStatus) {
            if let player: AVAudioPlayer = avAudioPlayer {
                player.stop()
            } else {
                print("FAILED TO STOP AUDIO")
            }
        }
    }
    
    public func getPlayer() -> AVAudioPlayer?{
        return self.avAudioPlayer ?? nil
    }
}
