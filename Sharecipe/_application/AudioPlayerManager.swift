//
//  AudioPlayerManager.swift
//  Sharecipe
//
//  Created by Tales Valente on 15/06/23.
//

import Foundation
import UIKit
import AVKit
import AVFoundation
import SwiftUI

class AudioPlayerManager: ObservableObject {
    var audioPlayer: AVAudioPlayer?

    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleInterruption), name: AVAudioSession.interruptionNotification, object: nil)

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
            print("Playback OK")
            try AVAudioSession.sharedInstance().setActive(true)
            print("Session is Active")
        } catch {
            print(error)
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    func playSound(sound: URL) {
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: sound)
            self.audioPlayer?.play()
        } catch {
            print("Failed to play sound: \(error)")
        }
    }

    func stopSound() {
        self.audioPlayer?.stop()
        self.audioPlayer = nil
    }

    @objc func handleInterruption(notification: Notification) {
        guard let info = notification.userInfo,
              let typeValue = info[AVAudioSessionInterruptionTypeKey] as? UInt,
              let type = AVAudioSession.InterruptionType(rawValue: typeValue) else {
            return
        }

        if type == .began {
            // An interruption began, typically a phone call.
            // Here you should pause the audio.
            audioPlayer?.pause()
        } else if type == .ended {
            if let optionsValue = info[AVAudioSessionInterruptionOptionKey] as? UInt {
                let options = AVAudioSession.InterruptionOptions(rawValue: optionsValue)
                if options.contains(.shouldResume) {
                    // Interruption Ended - playback should resume
                    // Here you should resume the audio.
                    audioPlayer?.play()
                }
            }
        }
    }
}
