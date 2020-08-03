//
//  AppDelegate.swift
//  MC3
//
//  Created by Arif Luthfiansyah on 14/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

let settingsDefaults = UserDefaults.standard
let backgroundMusic = AudioManager.init(audioPath: "Background-Music.mp3")
let soundManager = SoundManager.init()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var navigationController: UINavigationController = {
        let controller = UINavigationController()
        controller.enableMCTransitioning()
        controller.setNavigationBarHidden(true, animated: false)
        return controller
    }()
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        // this code to check and set initial settings default
        let isInitSettingsDefault = settingsDefaults.bool(forKey: "init")
        
        if !isInitSettingsDefault {
            settingsDefaults.set(true, forKey: "musicStatus")
            settingsDefaults.set(true, forKey: "soundStatus")
            settingsDefaults.set(true, forKey: "notificationStatus")
            settingsDefaults.set(true, forKey: "init")
        }
        
        let musicStatus = settingsDefaults.bool(forKey: "musicStatus")
        
        if (musicStatus) {
            backgroundMusic.play()
        } else {
            backgroundMusic.stop()
        }
        
        self.navigationDidStarted()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        backgroundMusic.stop()
        soundManager.stopAll()
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        let musicStatus = settingsDefaults.bool(forKey: "musicStatus")
            
        if (musicStatus) {
            backgroundMusic.play()
        } else {
            backgroundMusic.stop()
        }
    }

}

extension AppDelegate {

    private func navigationDidStarted() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: MainGardenViewController.identifier, bundle: nil)
        let viewController = storyboard.instantiateViewController(
            identifier: MainGardenViewController.identifier
        )
        self.navigationController.setViewControllers([viewController], animated: true)
        self.window?.rootViewController = self.navigationController
        self.window?.makeKeyAndVisible()
    }

}
