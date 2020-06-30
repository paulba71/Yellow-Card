//
//  AppDelegate.swift
//  Yellow Card
//
//  Created by Paul Barnes on 29/06/2020.
//  Copyright © 2020 Paul Barnes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var settingShowAudioButton: Bool = true
    var settingShowCardTitle: Bool = true
    var settingLongPressForSound: Bool = true
    var settingRunBefore: Bool = false // False until first run - true after
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Load the setting from UserDefaults
        let defaults = UserDefaults.standard
        let storedSettingRunBefore = defaults.bool(forKey: "RunBefore")
        if storedSettingRunBefore{
            let storedSettingShowAudioButton = defaults.bool(forKey: "ShowAudioButton")
            settingShowAudioButton = storedSettingShowAudioButton
            let storedSettingShowCardTitle = defaults.bool(forKey: "ShowCardTitle")
            settingShowCardTitle = storedSettingShowCardTitle
            let storedSettingLongPressForSound = defaults.bool(forKey: "LongPressForSound")
            settingLongPressForSound = storedSettingLongPressForSound
        } else {
            settingRunBefore = true
            saveSettings()
        }
        
        //let tabBar: UITabBarController = (window?.rootViewController as? UITabBarController)!
        //tabBar.selectedIndex = 3
        
        return true
    }
    
    func saveSettings() {
        let defaults = UserDefaults.standard
        defaults.set(settingRunBefore, forKey: "RunBefore")
        defaults.set(settingShowAudioButton, forKey: "ShowAudioButton")
        defaults.set(settingLongPressForSound, forKey: "LongPressForSound")
        defaults.set(settingShowCardTitle, forKey: "ShowCardTitle")
        defaults.set(settingRunBefore, forKey: "RunBefore")
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

