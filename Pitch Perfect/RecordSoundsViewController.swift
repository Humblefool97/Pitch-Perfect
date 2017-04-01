//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Rajeev Kr on 01/04/17.
//  Copyright © 2017 Rajeev Kr. All rights reserved.
//

import UIKit

class RecordSoundsViewController: UIViewController {
    @IBOutlet weak var stopRecordingBUtton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    @IBOutlet weak var recordingLabel: UILabel!
    
    @IBAction func recordAudioButton(_ sender: Any) {
        recordingLabel.text = "Recording in progress"
        toggleRecordState(isRecording: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        stopRecordingBUtton.isEnabled = false
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, t    ypically from a nib.
    }

    @IBAction func stopRecording(_ sender: Any) {
        recordingLabel.text = "Tap to record"
        toggleRecordState(isRecording: false)
    }

    private func toggleRecordState(isRecording:Bool){
        stopRecordingBUtton.isEnabled = isRecording
        recordButton.isEnabled = !isRecording
    }
}

