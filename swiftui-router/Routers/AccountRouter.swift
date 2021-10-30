//
//  AccountRouter.swift
//  RouterTest
//
//  Created by David Gary Wood on 1/05/21.
//

import Foundation
import SwiftUI

class AccountRouter {
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
    @ViewBuilder func accountView() -> some View {
        AccountScreen(router: self, viewModel: AccountScreenViewModel(services: self.services))
    }
}

struct AccountRouterView: View {
    var router: AccountRouter
    
    var body: some View {        
        NavigationView {
            self.router.accountView()
                .navigationTitle("Account")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

extension AccountRouter: AccountScreenRouter {
    @ViewBuilder func accountScreenProfileScreen() -> ProfileScreen {
        ProfileScreen(router: self, viewModel: ProfileScreenViewModel(services: self.services))
    }
}

extension AccountRouter: ProfileScreenRouter {
    
}
