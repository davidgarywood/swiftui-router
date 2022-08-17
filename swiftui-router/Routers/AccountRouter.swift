//
//  AccountRouter.swift
//  RouterTest
//
//  Created by David Gary Wood on 1/05/21.
//

import Foundation
import SwiftUI

class AccountRouter: ObservableObject {
    // MARK: - Private vars
        
    // MARK: - Initialization
    init() {
        Logger.print("init:\(#file)")
    }
    
    deinit {
        Logger.print("deinit:\(#file)")
    }
    
    // MARK: - Methods    
    @ViewBuilder func accountView() -> some View {
        AccountScreen(router: self)
    }
}

struct AccountRouterView: View {
    @StateObject var router: AccountRouter = AccountRouter()
    
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
        ProfileScreen(router: self)
    }
}

extension AccountRouter: ProfileScreenRouter {
    
}
