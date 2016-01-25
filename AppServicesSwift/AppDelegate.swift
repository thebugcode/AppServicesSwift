//
//  AppDelegate.swift
//  AppServicesSwift
//
//  Created by Dan Ursu on 25/01/16.
//  Copyright © 2016 Dan Ursu. All rights reserved.
//

import UIKit

@UIApplicationMain

/**
    If you want to add a new service to your app, you go in this class. This class's only 
    responsibility is passing messages down to services.
*/


class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    var services: [UIApplicationDelegate] = [
        PersistenceService(),
        AnalyticsService(),
        CrashReporterService()
    ]
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Here is an example how you pass a message to your services
        for service in self.services {
            service.application?(application, didFinishLaunchingWithOptions: launchOptions)
        }
        return true
    }


    func applicationDidEnterBackground(application: UIApplication) {
        // And here is another one
        for service in self.services {
            service.applicationDidEnterBackground?(application)
        }
    }
}