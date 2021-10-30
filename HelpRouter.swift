//
//  HelpRouter.swift
//  RouterTest
//
//  Created by David Gary Wood on 1/05/21.
//

import Foundation
import SwiftUI

class HelpRouter: ObservableObject {    
    // MARK: - Private vars
    private var services: Services
        
    // MARK: - Initialization
    init(services: Services) {
        self.services = services
        Logger.print("init:\(#file)")
    }
    
    deinit {
        Logger.print("deinit:\(#file)")
    }
    
    // MARK: - Methods    
    @ViewBuilder func helpContent(text: String) -> some View {
        Text(text)
    }
        
    internal func presentedOnboarding() {
        self.services.defaultsManager.setDefault(.hasPresentedOnboarding, value: true)
    }    
}

struct HelpRouterView: View {
    @StateObject var router: HelpRouter
    
    var body: some View {
        NavigationView {
            TabView {
                self.router.helpContent(text: "Some content to help the user is here")
                self.router.helpContent(text: "Page 2")
                self.router.helpContent(text: "Page 3")
                self.router.helpContent(text: "Page 4")
            }
            .tabViewStyle(PageTabViewStyle())
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            // Set our default to say we've shown onboarding, here
            self.router.presentedOnboarding()
        }
    }
}
