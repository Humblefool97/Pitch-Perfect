//
//  RecordSoundsController.swift
//  Pitch Perfect
//
//  Created by Rajeev Kr on 01/04/17.
//  Copyright © 2017 Rajeev Kr. All rights reserved.
//

import Foundation
import AVFoundation

class RecordSoundsController {
    
    public static func recordSound(){
        var audioRecorder:AVAudioRecorder
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let recordName = "recordedVoice.wav"
        let pathArray = [dirPath,recordName]
        let filePath = URL(string:pathArray.joined(separator: "/"))
        
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord, with: .defaultToSpeaker)
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }


}
