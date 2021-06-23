//
//  AccountRouter.swift
//  RouterTest
//
//  Created by David Gary Wood on 1/05/21.
//

import Foundation
import SwiftUI

class AccountRouter: Router {
    
    // MARK: - Private vars
    private var services: Services
        
    // MARK: - Initialization
    init(services: Services) {
        self.services = services
    }
    
    // MARK: - Methods
    @ViewBuilder func rootView() -> some View {
        AccountRouterView(router: self)
    }
    
    func accountView() -> some View {
        let viewModel = AccountScreenViewModel(services: self.services)
        let view = AccountScreen(router: self, viewModel: viewModel)
        return view
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
    func accountScreenProfileScreen() -> ProfileScreen {
        let viewModel = ProfileScreenViewModel(services: self.services)
        let view = ProfileScreen(router: self, viewModel: viewModel)
        return view
    }
}

extension AccountRouter: ProfileScreenRouter {
    
}
