//
//  AppDelegate.swift
//  SMaiSuLang
//
//  Created by XYX on 15/8/14.
//  Copyright (c) 2015年 成良雨. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        
        var homepage = HomePage()
        var spotSupply = SpotSupply()
        var consult = Consulting()
        var pptable = PPtable()
        
        var nav1:UINavigationController = UINavigationController(rootViewController: homepage)
        var nav2:UINavigationController = UINavigationController(rootViewController: spotSupply)
        var nav3:UINavigationController = UINavigationController(rootViewController: consult)
        var nav4:UINavigationController = UINavigationController(rootViewController: pptable)
        
        var oneTabBarItem: UITabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Bookmarks, tag: 0)
        var twoTabBarItem: UITabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Contacts, tag: 1)
        var threeTabBarItem: UITabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Downloads, tag: 2)
        var fourTabBarItem: UITabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Favorites, tag: 3)
        println("i am a bad boy")
        
        homepage.tabBarItem = oneTabBarItem
        spotSupply.tabBarItem = twoTabBarItem
        consult.tabBarItem = threeTabBarItem
        pptable.tabBarItem = fourTabBarItem
        
        var tc = UITabBarController()
        tc.tabBar.barTintColor = UIColor.blackColor()
        tc.viewControllers = [nav1,nav2,nav3,nav4]
        self.window!.rootViewController = tc
        
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

