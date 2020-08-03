//
//  AudioManager.swift
//  MC3
//
//  Created by Rahmat Zulfikri on 01/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation
import AVFoundation

class AudioManager {
    
    var avAudioPlayer: AVAudioPlayer?
    
    init(audioPath: String) {
        let path = Bundle.main.path(forResource: audioPath, ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            avAudioPlayer = try AVAudioPlayer(contentsOf: url)
        } catch {
            print("FAILED TO INIT AUDIO MANAGER WITH PATH \(audioPath)")
        }
    }
    
    public func play() {
        if let player: AVAudioPlayer = avAudioPlayer {
            player.numberOfLoops = -1
            player.play()
        } else {
            print("FAILED TO PLAY AUDIO")
        }
    }
    
    public func stop() {
        if let player: AVAudioPlayer = avAudioPlayer {
            player.stop()
        } else {
            print("FAILED TO STOP AUDIO")
        }
    }
    
    public func getPlayerStatus() -> Bool{
        return self.avAudioPlayer?.isPlaying ?? false
    }
}
