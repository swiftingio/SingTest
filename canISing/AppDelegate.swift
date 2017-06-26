//
//  AppDelegate.swift
//  canISing
//
//  Created by woroninb on 08/05/17.
//  Copyright © 2017 com.roche. All rights reserved.
//

import UIKit


//Done

//-add tabbar http://swiftdeveloperblog.com/code-examples/create-uitabbarcontroller-programmatically/
// wyciąć ćwiczenia 1, 2, 3, 4
//- sprawdzić jak działą tuner od audio kit

//To do:
// add protocol extensoions
// end task nie działa
// use only dimensions structs
// remove tabbar
// add result label
// poczytać o skalach żeńskich i męskich
// add octave done view to NoteProgressBar
// check what ocateve do yo have
// use NoteProgressBar in singsetpview
// build Auidokot microphone app on device
// build singe viwcontroller to display different of cases
//- add repeat button and next button
//- warm your voice exercise
//- zrobić custom step http://blog.shazino.com/articles/dev/researchkit-new-active-task/


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

