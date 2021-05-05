//
//  AccountRouter.swift
//  RouterTest
//
//  Created by David Gary Wood on 1/05/21.
//

import Foundation
import SwiftUI

class AccountRouter: Router {
    
    // MARK: - Published vars
    // Put published vars here
    
    // MARK: - Private vars
    
    // MARK: - Internal vars
    var services: Services
        
    // MARK: - Initialization

    init(services: Services) {
        self.services = services
    }
    
    // MARK: - Methods
    
    func rootView() -> some View {
        // Add your content here
        NavigationView {
            self.accountView()
                .navigationTitle("Account")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func accountView() -> some View {
        let viewModel = AccountScreenViewModel(services: self.services)
        let view = AccountScreen(router: self, viewModel: viewModel)
        return view
    }
    
}

extension AccountRouter: AccountScreenRouter {
    func accountScreenProfileScreen() -> ProfileScreen {
        let viewModel = ProfileScreenViewModel(services: self.services)
        let view = ProfileScreen(router: self, viewModel: viewModel)
        return view
    }
}

extension AccountRouter: ProfileScreenRouter {
    
}
