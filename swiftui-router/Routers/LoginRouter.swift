//
//  LoginRouter.swift
//  RouterTest
//
//  Created by David Gary Wood on 1/05/21.
//

import Foundation
import SwiftUI

class LoginRouter: Router {
    
    // MARK: - Private vars
    lazy private var onboardingRouter: HelpRouter = {
        return HelpRouter(services: self.services)
    }()
    
    private var services: Services
        
    // MARK: - Initialization
    init(services: Services) {
        self.services = services
    }
    
    // MARK: - Methods
    @ViewBuilder func rootView() -> some View {
        let showOnboarding = !self.services.defaultsManager.getDefault(.hasPresentedOnboarding)
        LoginRouterView(router: self, showOnboarding: showOnboarding)
    }
    
    @ViewBuilder func loginScreen() -> some View {
        let viewModel = LoginScreenViewModel(services: self.services)
        let view = LoginScreen(router: self, viewModel: viewModel)
        view
    }
    
    @ViewBuilder func onboardingScreen() -> some View {
        self.onboardingRouter.rootView()
    }
    
}

struct LoginRouterView: View {
    @StateObject var router: LoginRouter
    @State var showOnboarding: Bool
    
    var body: some View {
        NavigationView {
            self.router.loginScreen()
                .sheet(isPresented: $showOnboarding) {
                    self.router.onboardingScreen()
                }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}

extension LoginRouter: LoginScreenViewRouter {
    
}
