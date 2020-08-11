//
//  AppDelegate.swift
//  MC3
//
//  Created by Arif Luthfiansyah on 14/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit
import Instabug

let settingsDefaults = UserDefaults.standard
let backgroundMusic = AudioManager.init(audioPath: "Background-Music.mp3")
let soundManager = SoundManager.init()

//Logic Animal Room
var rewardsValue: Int = 0
var hunger: Float = 0.0
var sleep: Float = 0.0
var health: Float = 0.0
var fun: Float = 0.0
var love: Float = 0.0
var timeIntervalBackground: Double = 0
var timeIntervalForeground: Double = 0
var firstTime: Bool = true
var gapTime: Int = 0

struct Keys {
    static let hunger = "savedHunger"
    static let sleep = "savedSleep"
    static let health = "savedHealth"
    static let fun = "savedFun"
    static let love = "savedLove"
    static let rewards = "savedRewards"
    static let timeIntervalBackground = "savedTimeInterval"
    static let firstTime = "savedFirstTime"
    
    static let isAgree = "isAgree"
    static let isStartGame = "isStartGame"
    static let catName = "catName"
    
    static let onBoardingFood = "savedFirstTimeFood"
    static let onBoardingSleep = "savedFirstTimeSleep"
    static let onBoardingHealth = "savedFirstTimeHealth"
    static let onBoardingFun = "savedFirstTimeFun"
    static let onBoardingLove = "savedFirstTimeLove"
}

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
        
        //instabug
        Instabug.start(withToken: "85e293e4ae4f0754d950722e683e0f10", invocationEvents: [.shake, .screenshot])
        
        // this code to check and set initial settings default
        let isInitSettingsDefault = settingsDefaults.bool(forKey: "init")
        
        if !isInitSettingsDefault {
            settingsDefaults.set(true, forKey: "musicStatus")
            settingsDefaults.set(true, forKey: "soundStatus")
            settingsDefaults.set(true, forKey: "notificationStatus")
            settingsDefaults.set(true, forKey: "init")
            
            // for inventory
            settingsDefaults.set(nil, forKey: SettingsKey.itemPlaceholder1)
            settingsDefaults.set(nil, forKey: SettingsKey.itemPlaceholder2)
            settingsDefaults.set(nil, forKey: SettingsKey.itemPlaceholder3)
            settingsDefaults.set(nil, forKey: SettingsKey.itemPlaceholder4)
            settingsDefaults.set(nil, forKey: SettingsKey.itemPlaceholder5)
            settingsDefaults.set(nil, forKey: SettingsKey.itemPlaceholder6)
            settingsDefaults.set(nil, forKey: SettingsKey.itemPlaceholder7)
            settingsDefaults.set(nil, forKey: SettingsKey.itemPlaceholder8)
            
            // general
            settingsDefaults.set(false, forKey: Keys.isAgree)
            settingsDefaults.set(false, forKey: Keys.isStartGame)
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
        
        timeIntervalBackground = Date().timeIntervalSince1970
        settingsDefaults.set(timeIntervalBackground, forKey: Keys.timeIntervalBackground)
        print("background = \(timeIntervalBackground)")
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
        
        if firstTime == settingsDefaults.bool(forKey: Keys.firstTime) {
            timeIntervalForeground = Date().timeIntervalSince1970
            print("foreground = \(timeIntervalForeground)")
            timeIntervalBackground = settingsDefaults.double(forKey: Keys.timeIntervalBackground)
            gapTime = Int(timeIntervalForeground - timeIntervalBackground)
            print("gap time = \(gapTime)")
        } else if firstTime == true {
            firstTime = false
            settingsDefaults.set(firstTime, forKey: Keys.firstTime)
        }
        
        hunger = settingsDefaults.float(forKey: Keys.hunger)
        sleep = settingsDefaults.float(forKey: Keys.sleep)
        fun = settingsDefaults.float(forKey: Keys.fun)
        love = settingsDefaults.float(forKey: Keys.love)
        if hunger > 0 || sleep > 0 || fun > 0 || love > 0 {
            switch gapTime {
            case 1800...2700: //30-45 menit
                hunger -= 0.05
                sleep -= 0.05
                fun -= 0.05
                love -= 0.05
                settingsDefaults.set(hunger, forKey: Keys.hunger)
                settingsDefaults.set(sleep, forKey: Keys.hunger)
                settingsDefaults.set(fun, forKey: Keys.hunger)
                settingsDefaults.set(love, forKey: Keys.hunger)
            case 2701...5400: //45-90 menit
                hunger -= 0.1
                sleep -= 0.1
                fun -= 0.1
                love -= 0.1
                settingsDefaults.set(hunger, forKey: Keys.hunger)
                settingsDefaults.set(sleep, forKey: Keys.hunger)
                settingsDefaults.set(fun, forKey: Keys.hunger)
                settingsDefaults.set(love, forKey: Keys.hunger)
            case 5401...7200: //90-120 menit
                hunger -= 0.2
                sleep -= 0.2
                fun -= 0.2
                love -= 0.2
                settingsDefaults.set(hunger, forKey: Keys.hunger)
                settingsDefaults.set(sleep, forKey: Keys.hunger)
                settingsDefaults.set(fun, forKey: Keys.hunger)
                settingsDefaults.set(love, forKey: Keys.hunger)
            case 7201...: //>120 menit
                hunger = 0
                sleep = 0
                fun = 0
                love = 0
                settingsDefaults.set(hunger, forKey: Keys.hunger)
                settingsDefaults.set(sleep, forKey: Keys.hunger)
                settingsDefaults.set(fun, forKey: Keys.hunger)
                settingsDefaults.set(love, forKey: Keys.hunger)
            default:
                break
            }
        }
        
    }
    
}

extension AppDelegate {
    
    private func navigationDidStarted() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: SplashViewController.identifier, bundle: nil)
        let viewController = storyboard.instantiateViewController(
            identifier: SplashViewController.identifier
        )
        self.navigationController.setViewControllers([viewController], animated: true)
        self.window?.rootViewController = self.navigationController
        self.window?.makeKeyAndVisible()
    }
    
}
