//
//  BlackViewController.swift
//  Yellow Card
//
//  Created by Paul Barnes on 29/06/2020.
//  Copyright © 2020 Paul Barnes. All rights reserved.
//

import UIKit
import AVFoundation

class BlackViewController: UIViewController {
    
    var settingShowAudioButton: Bool = true
    var settingShowCardTitle: Bool = true
    var settingLongPressForSound: Bool = true
    
    var player: AVAudioPlayer = AVAudioPlayer()
    
    func loadSettings(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        settingLongPressForSound = appDelegate.settingLongPressForSound
        settingShowAudioButton = appDelegate.settingShowAudioButton
        settingShowCardTitle = appDelegate.settingShowCardTitle
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        do{
            let audioPlayer = Bundle.main.path(forResource: "whistle", ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPlayer!) as URL)
        }
        catch {
            // Problem initialising the audio player...
        }
        
        loadSettings()
    }
    
    @IBAction func longPressDetected(_ sender: Any) {
        if (settingLongPressForSound){
            player.play()
        }
    }
    
    @IBAction func whistlePressed(_ sender: Any) {
        player.play()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("BlackView did appear")
        loadSettings()
        // Show / Hide the title
        cardLabel.isHidden = !settingShowCardTitle
        // Show / Hide the button
        playButton.isHidden = !settingShowAudioButton
    }
    
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
}
