//
//  RouterTestApp.swift
//  RouterTest
//
//  Created by David Gary Wood on 24/04/21.
//

import SwiftUI

@main
struct RouterTestApp: App {
    @StateObject var appRouter = AppRouter(services: AppServices())
    
    var body: some Scene {
        WindowGroup {
            self.appRouter.rootView()
        }
    }
}
