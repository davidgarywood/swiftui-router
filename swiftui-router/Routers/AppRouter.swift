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

class AppRouter: ObservableObject {    
    // MARK: - Published vars
    @Published var screen: AppRouterScreen = .login
    
    // MARK: - Private vars
    private var services: Services

    private var anyCancellables = Set<AnyCancellable>()
    
    lazy private var loginRouter: LoginRouter = {
        return LoginRouter(services: self.services)
    }()

    lazy private var tabRouter: TabRouter = {
        return TabRouter(services: self.services)
    }()
    
    // MARK: - Initialization
    init(services: Services) {
        self.services = services
        Logger.print("init:\(#file)")

        self.setBindings()
    }
    
    deinit {
        Logger.print("deinit:\(#file)")
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
    @ViewBuilder func loginScreen() -> some View {
        LoginRouterView(router: LoginRouter(services: self.services))
    }
    
    @ViewBuilder func tabScreen() -> some View {
        TabRouterView(router: TabRouter(services: self.services))
    }
}

struct AppRouterView: View {
    @StateObject var router: AppRouter
    
    var body: some View {
        switch self.router.screen {
        case .login:
            self.router.loginScreen()
        case .tab:
            self.router.tabScreen()
        }
    }
}
