//
//  TabRouter.swift
//  RouterTest
//
//  Created by David Gary Wood on 1/05/21.
//

import Foundation
import SwiftUI

class TabRouter: Router {
        
    // MARK: - Private vars    
    private var services: Services

    lazy private var accountRouter: AccountRouter = {
        return AccountRouter(services: self.services)
    }()

    lazy private var onboardingRouter: HelpRouter = {
        return HelpRouter(services: self.services)
    }()
        
    // MARK: - Initialization
    init(services: Services) {
        self.services = services
        Logger.print("init:\(#file)")
    }
    
    deinit {
        Logger.print("deinit:\(#file)")
    }
    
    // MARK: - Methods
    @ViewBuilder func rootView() -> some View {
        TabRouterView(router: self)
    }
    
    @ViewBuilder func home() -> some View {
        let viewModel = HomeScreenViewModel(services: self.services)
        let view = HomeScreen(router: self, viewModel: viewModel)
        view
    }
    
    @ViewBuilder func onboarding() -> some View {
        self.onboardingRouter.rootView()
    }

    @ViewBuilder func account() -> some View {
        self.accountRouter.rootView()
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
