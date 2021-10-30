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
    lazy private var onboardingRouter: HelpRouter = {
        return HelpRouter(services: self.services)
    }()
    
    private var services: Services
        
    // MARK: - Initialization
    init(services: Services) {
        Logger.print("init:\(#file)")

        self.services = services
        self.showOnboarding = !self.services.defaultsManager.getDefault(.hasPresentedOnboarding)
    }
    
    deinit {
        Logger.print("deinit:\(#file)")
    }
    
    // MARK: - Methods
    @ViewBuilder func loginScreen() -> some View {
        LoginScreen(router: self, viewModel: LoginScreenViewModel(services: self.services))
    }
    
    @ViewBuilder func onboardingScreen() -> some View {
        HelpRouterView(router: HelpRouter(services: self.services))
    }
}

struct LoginRouterView: View {
    @StateObject var router: LoginRouter
    
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
