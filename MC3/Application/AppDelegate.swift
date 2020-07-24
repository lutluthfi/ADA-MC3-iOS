//
//  AppDelegate.swift
//  MC3
//
//  Created by Arif Luthfiansyah on 14/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

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
        self.navigationDidStarted()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

}

extension AppDelegate {

    private func navigationDidStarted() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: SplashViewController.identifier, bundle: nil)
        let viewController = storyboard
            .instantiateViewController(identifier: SplashViewController.identifier)
        self.navigationController.setViewControllers([viewController], animated: true)
        self.window?.rootViewController = self.navigationController
        self.window?.makeKeyAndVisible()
    }

}
