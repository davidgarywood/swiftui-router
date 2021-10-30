//
//  TabRouter.swift
//  RouterTest
//
//  Created by David Gary Wood on 1/05/21.
//

import Foundation
import SwiftUI

class TabRouter: ObservableObject {        
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
    @ViewBuilder func home() -> some View {
        HomeScreen(router: self, viewModel: HomeScreenViewModel(services: self.services))
    }
    
    @ViewBuilder func onboarding() -> some View {
        HelpRouterView(router: HelpRouter(services: self.services))
    }

    @ViewBuilder func account() -> some View {
        AccountRouterView(router: AccountRouter(services: self.services))
    }
}

struct TabRouterView: View {
    @StateObject var router: TabRouter
    
    var body: some View {
        TabView {
            self.router.onboarding()
                .tabItem {
                    Label("Help", systemImage: "questionmark.circle.fill")
                }

            self.router.home()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            self.router.account()
                .tabItem {
                    Label("Account", systemImage: "person.fill")
                }
        }
    }
}

extension TabRouter: HomeScreenRouter {
    
}
