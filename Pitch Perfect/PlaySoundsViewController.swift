//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Rajeev Kr on 01/04/17.
//  Copyright © 2017 Rajeev Kr. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    var recordedAudioURL: URL!
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    public var audioFile:AVAudioFile!
    public var audioEngine:AVAudioEngine!
    public var audioPlayerNode: AVAudioPlayerNode!
    public var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureUI(.notPlaying)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()

    }
    
    @IBAction func startPlayback(_ sender: UIButton) {
        print("Playback started..")
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)    }
    
    @IBAction func stopPlayback(_ sender: UIButton) {
        print("Playback stopped..")
        stopAudio()

    }


}
