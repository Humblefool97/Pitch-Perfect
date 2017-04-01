//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Rajeev Kr on 01/04/17.
//  Copyright © 2017 Rajeev Kr. All rights reserved.
//

import UIKit

class PlaySoundsViewController: UIViewController {
    var recordedAudioURL: URL!
    
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var highPitchButton: UIButton!
    @IBOutlet weak var lowPitchButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func startPlayback(_ sender: UIButton) {
        print("Playback started..")
        
    }
    
    @IBAction func stopPlayback(_ sender: UIButton) {
        print("Playback stopped..")

    }


}
