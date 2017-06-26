//
//  PlaySoundProtocol.swift
//  SingTest
//
//  Created by woroninb on 24/06/2017.
//  Copyright © 2017 com.roche. All rights reserved.
//

import Foundation
import AudioKit


protocol PlaySoundProtocol: class {
    var player: AVAudioPlayer? { get set }
    var singTest: Test? { get set }
    func playSound()
}

extension PlaySoundProtocol {
    func playSound() {
        let url = Bundle.main.url(forResource: singTest?.soundName, withExtension: "m4a")!
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            player.prepareToPlay()
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
