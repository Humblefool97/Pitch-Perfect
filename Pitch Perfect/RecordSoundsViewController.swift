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
        recordingLabel.text = Utils.TEXT_RECORDING_IN_PROGRESS
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
        recordingLabel.text = Utils.TEXT_TAP_TO_RECORD
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
            performSegue(withIdentifier:Utils.SEGUE_CONTROLLER_PLAY_SOUND, sender: url)
        }else{
            print("onRecordFinish Failed...")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Utils.SEGUE_CONTROLLER_PLAY_SOUND {
            let playSoundVc = segue.destination as! PlaySoundsViewController
            let url = sender as! URL
            playSoundVc.recordedAudioURL = url
        }
    }
}

