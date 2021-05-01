//
//  AppRouter.swift
//  RouterTest
//
//  Created by David Gary Wood on 1/05/21.
//

import Foundation
import SwiftUI
import Combine

enum AppRouterScreen {
    case login
    case tab
}

class AppRouter: Router {
    
    // MARK: - Published vars
    @Published var screen: AppRouterScreen = .login
    
    // MARK: - Private vars
    private var anyCancellables = Set<AnyCancellable>()
    
    lazy private var loginRouter: LoginRouter = {
        return LoginRouter(services: self.services, delegate: self)
    }()

    lazy private var tabRouter: TabRouter = {
        return TabRouter(services: self.services, delegate: self)
    }()
    
    // MARK: - Internal vars
    var services: Services
    
    // MARK: - Initialization
    
    init(services: Services) {
        self.services = services
        
        self.setBindings()
    }
    
    func setBindings() {
        self.services.loginManager.state.$loggedIn.sink { [weak self] (value) in
            if value == true {
                self?.screen = .tab
            } else {
                self?.screen = .login
            }
        }.store(in: &self.anyCancellables)
    }
    
    // MARK: - Methods
    
    @ViewBuilder func rootView() -> some View {
        switch self.screen {
        case .login:
            self.loginScreen()
        case .tab:
            self.tabScreen()
        }
    }
    
    public func loginScreen() -> some View {
        self.loginRouter.rootView()
    }
    
    public func tabScreen() -> some View {
        self.tabRouter.rootView()
    }
    
}

extension AppRouter: LoginRouterDelegate {
    
}

extension AppRouter: TabRouterDelegate {
    
}

