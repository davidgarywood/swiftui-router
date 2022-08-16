//
//  LoginRouter.swift
//  RouterTest
//
//  Created by David Gary Wood on 1/05/21.
//

import Foundation
import SwiftUI

class LoginRouter: ObservableObject {
    // MARK: - Published vars
    @Published var showOnboarding: Bool = false
    
    // MARK: - Private vars
        
    // MARK: - Initialization
    init() {
        Logger.print("init:\(#file)")
        self.showOnboarding = !AppDefaults.hasPresentedOnboarding.get()
    }
    
    deinit {
        Logger.print("deinit:\(#file)")
    }
    
    // MARK: - Methods
    @ViewBuilder func loginScreen() -> some View {
        LoginScreen(router: self)
    }
    
    @ViewBuilder func onboardingScreen() -> some View {
        HelpRouterView()
    }
}

struct LoginRouterView: View {
    @StateObject var router: LoginRouter = LoginRouter()
    
    var body: some View {
        NavigationView {
            self.router.loginScreen()
                .sheet(isPresented: self.$router.showOnboarding) {
                    self.router.onboardingScreen()
                }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

extension LoginRouter: LoginScreenViewRouter {
    
}
