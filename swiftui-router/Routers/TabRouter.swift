//
//  TabRouter.swift
//  RouterTest
//
//  Created by David Gary Wood on 1/05/21.
//

import Foundation
import SwiftUI

protocol TabRouterDelegate: AnyObject {
}

class TabRouter: Router {
    
    // MARK: - Published vars
    // Put published vars here
    
    // MARK: - Private vars
    weak private var delegate: TabRouterDelegate?
    
    lazy private var accountRouter: AccountRouter = {
        return AccountRouter(services: self.services, delegate: self)
    }()

    lazy private var onboardingRouter: HelpRouter = {
        return HelpRouter(services: self.services, delegate: self)
    }()
    
    // MARK: - Internal vars
    var services: Services
        
    // MARK: - Initialization

    init(services: Services, delegate: TabRouterDelegate? = nil) {
        self.services = services
        self.delegate = delegate
    }
    
    // MARK: - Methods
    
    func rootView() -> some View {
        // Add your content here
        TabView {
            self.onboardingRouter.rootView()
                .tabItem {
                    Label("Help", systemImage: "questionmark.circle.fill")
                }

            self.homeScreen()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            self.accountRouter.rootView()
                .tabItem {
                    Label("Account", systemImage: "person.fill")
                }            
        }
    }
    
    func homeScreen() -> some View {
        let viewModel = HomeScreenViewModel(services: self.services)
        let view = HomeScreen(router: self, viewModel: viewModel)
        return view
    }
    
}

extension TabRouter: HomeScreenRouter {
    
}

extension TabRouter: AccountRouterDelegate {
    
}

extension TabRouter: HelpRouterDelegate {
    
}
