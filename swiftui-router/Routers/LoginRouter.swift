//
//  LoginRouter.swift
//  RouterTest
//
//  Created by David Gary Wood on 1/05/21.
//

import Foundation
import SwiftUI

// We have our own LoginView that is coupled to the LoginRouter here, so that we can nicely set a sheet bool in the LoginRouter itself
// We _could_ have put this in our LoginView, with a bool in it's viewModel, and sent out a call via the LoginView's router to here, to create
// the onboarding view.
//
// This is a 6 of one, half a dozen of the other choice. I like the locality here of the Router having responsibility for the sheet,
// Incase we ever want to show other sheets, then their toggling/creation etc would all be in this one spot.

class LoginRouter: Router {
    
    // MARK: - Published vars
    // Put published vars here
    
    // MARK: - Private vars
    
    lazy private var onboardingRouter: HelpRouter = {
        return HelpRouter(services: self.services)
    }()
    
    // MARK: - Internal vars
    var services: Services
        
    // MARK: - Initialization

    init(services: Services) {
        self.services = services
    }
    
    // MARK: - Methods
    
    func rootView() -> some View {
        let showOnboarding = !self.services.defaultsManager.getDefault(.hasPresentedOnboarding)
        return LoginView(router: self, showOnboarding: showOnboarding)
    }
    
    func loginScreen() -> some View {
        let viewModel = LoginScreenViewModel(services: self.services)
        let view = LoginScreen(router: self, viewModel: viewModel)
        return view
    }
    
    func onboardingScreen() -> some View {
        // Set our default to say we've shown onboarding, here
        self.services.defaultsManager.setDefault(.hasPresentedOnboarding, value: true)
        return self.onboardingRouter.rootView()
    }
    
}

struct LoginView: View {
    @ObservedObject var router: LoginRouter
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
