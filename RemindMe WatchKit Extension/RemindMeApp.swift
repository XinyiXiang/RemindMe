//
//  RemindMeApp.swift
//  RemindMe WatchKit Extension
//
//  Created by Vicky Xiang on 6/28/21.
//

import SwiftUI

@main
struct RemindMeApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
