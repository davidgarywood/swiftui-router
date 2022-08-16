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
        
    // MARK: - Initialization
    init() {
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
        AppDefaults.hasPresentedOnboarding.set(true)
    }
}

struct HelpRouterView: View {
    @StateObject var router: HelpRouter = HelpRouter()
    
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
