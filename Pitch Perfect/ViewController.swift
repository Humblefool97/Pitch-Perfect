//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Rajeev Kr on 01/04/17.
//  Copyright © 2017 Rajeev Kr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var recordingLabel: UILabel!
    
    @IBAction func recordAudioButton(_ sender: Any) {
        recordingLabel.text = "Recording in progress"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, t    ypically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

