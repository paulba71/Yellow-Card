//
//  AboutSettingsViewController.swift
//  Yellow Card
//
//  Created by Paul Barnes on 29/06/2020.
//  Copyright © 2020 Paul Barnes. All rights reserved.
//

import UIKit

class AboutSettingsViewController: UIViewController {
    
    var settingShowAudioButton: Bool = true
    var settingShowCardTitle: Bool = true
    var settingLongPressForSound: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        settingLongPressForSound = appDelegate.settingLongPressForSound
        settingShowAudioButton = appDelegate.settingShowAudioButton
        settingShowCardTitle = appDelegate.settingShowCardTitle
        switchLongPressForSound.isOn = settingLongPressForSound
        switchShowCardTitle.isOn = settingShowCardTitle
        switchShowAudioButton.isOn = settingShowAudioButton
    }
    
    func storeSettings () {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.settingLongPressForSound = settingLongPressForSound
        appDelegate.settingShowAudioButton = settingShowAudioButton
        appDelegate.settingShowCardTitle = settingShowCardTitle
        appDelegate.saveSettings()
    }
    
    @IBOutlet weak var switchShowAudioButton: UISwitch!
    
    @IBOutlet weak var switchLongPressForSound: UISwitch!
    
    @IBOutlet weak var switchShowCardTitle: UISwitch!
    
    @IBAction func toggleShowAudioButton(_ sender: Any) {
        settingShowAudioButton = switchShowAudioButton.isOn
        storeSettings()
    }
    
    @IBAction func toggleLongPressForSound(_ sender: Any) {
        settingLongPressForSound = switchLongPressForSound.isOn
        storeSettings()
    }
    
    @IBAction func toggleShowCardTitles(_ sender: Any) {
        settingShowCardTitle = switchShowCardTitle.isOn
        storeSettings()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
