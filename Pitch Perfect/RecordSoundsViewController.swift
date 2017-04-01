//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Rajeev Kr on 01/04/17.
//  Copyright © 2017 Rajeev Kr. All rights reserved.
//

import UIKit

class RecordSoundsViewController: UIViewController,OnRecordFinishProtocol {
    private var recordSoundController:RecordSoundsController?
    @IBOutlet weak var stopRecordingBUtton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var recordingLabel: UILabel!
    
    @IBAction func recordAudioButton(_ sender: Any) {
        recordingLabel.text = "Recording in progress"
        toggleRecordState(isRecording: true)
        if recordSoundController != nil{
            recordSoundController?.recordSound()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        stopRecordingBUtton.isEnabled = false
        recordSoundController = RecordSoundsController(onRecordFinishListener: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func stopRecording(_ sender: Any) {
        recordingLabel.text = "Tap to record"
        toggleRecordState(isRecording: false)
        if recordSoundController != nil{
            recordSoundController?.stopRecording()
        }

    }

    private func toggleRecordState(isRecording:Bool){
        stopRecordingBUtton.isEnabled = isRecording
        recordButton.isEnabled = !isRecording
    }
    
    func onRecordFinish(isRecordSuccessful:Bool,url:URL) {
        if(isRecordSuccessful){
            performSegue(withIdentifier:"stopRecordingSegue", sender: url)
        }else{
            print("onRecordFinish Failed...")
        }
    }
}

