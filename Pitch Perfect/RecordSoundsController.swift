//
//  RecordSoundsController.swift
//  Pitch Perfect
//
//  Created by Rajeev Kr on 01/04/17.
//  Copyright © 2017 Rajeev Kr. All rights reserved.
//

import Foundation
import AVFoundation

class RecordSoundsController:NSObject,AVAudioRecorderDelegate {
    private var audioRecorder:AVAudioRecorder?
    private var onRecordFinishListener:OnRecordFinishProtocol?
    
    init(onRecordFinishListener:OnRecordFinishProtocol) {
        self.onRecordFinishListener = onRecordFinishListener
    }
    
    public func recordSound(){
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let recordName = "recordedVoice.wav"
        let pathArray = [dirPath,recordName]
        let filePath = URL(string:pathArray.joined(separator: "/"))
        
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord, with: .defaultToSpeaker)
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder!.delegate = self
        audioRecorder!.isMeteringEnabled = true
        audioRecorder!.prepareToRecord()
        audioRecorder!.record()
    }
    
    public func stopRecording() {
        audioRecorder!.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if onRecordFinishListener != nil {
            onRecordFinishListener?.onRecordFinish(isRecordSuccessful:flag,url:audioRecorder!.url)
        }
    }
    
}
