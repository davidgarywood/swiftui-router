//
//  AppRouter.swift
//  RouterTest
//
//  Created by David Gary Wood on 1/05/21.
//

import Foundation
import SwiftUI

enum AppRouterScreen {
    case login
    case tab
}

class AppRouter: ObservableObject {
    // MARK: - Injected vars
    @Injected(\.appState.loginState) var loginState
    
    // MARK: - Published vars
    @Published var screen: AppRouterScreen = .login
    
    // MARK: - Private vars
    private var cancellables = TaskCancellable()
    
    // MARK: - Initialization
    init() {
        Logger.print("init:\(#file)")

        self.setBindings()
    }
    
    deinit {
        Logger.print("deinit:\(#file)")
    }
    
    func setBindings() {
        self.cancellables.addTask {
            Task { [unowned self] in
                for await loggedIn in self.loginState.$loggedIn.values {
                    await self.updateScreen(loggedIn: loggedIn)
                }
            }
        }
    }
    
    @MainActor func updateScreen(loggedIn: Bool) async {
        if loggedIn == true {
            self.screen = .tab
        } else {
            self.screen = .login
        }
    }
    
    // MARK: - Methods
    @ViewBuilder func loginScreen() -> some View {
        LoginRouterView()
    }
    
    @ViewBuilder func tabScreen() -> some View {
        TabRouterView()
    }
}

struct AppRouterView: View {
    @StateObject var router: AppRouter = AppRouter()
    
    var body: some View {
        switch self.router.screen {
        case .login:
            self.router.loginScreen()
        case .tab:
            self.router.tabScreen()
        }
    }
}
