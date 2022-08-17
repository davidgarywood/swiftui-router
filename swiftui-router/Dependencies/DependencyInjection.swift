//
//  DependencyInjection.swift
//  Router
//
//  Created by dave on 16/08/22.
//

import Foundation

struct AppState {
    var loginState: LoginState = LoginState()
}

public final class DependencyInjection {
    
    private(set) var loginManager: any LoginManager
    private(set) var appState: AppState
    
    internal init(appState: AppState,
                  loginManager: any LoginManager) {
        self.appState = appState
        self.loginManager = loginManager
    }
}

extension DependencyInjection {
    
    static var assembly: DependencyInjection = {
        // Use mocks for previews
        if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
            return DependencyInjection.allMocks()
        } else {
            return DependencyInjection.assembleRealApp()
        }
    }()
        
    static func assembleRealApp() -> DependencyInjection {
        let appState = AppState()
        
        return .init(appState: appState,
                     loginManager: AppLoginManager(loginState: appState.loginState))
    }
    
    static func allMocks() -> DependencyInjection {
        let appState = AppState()
        
        return .init(appState: appState,
                     loginManager: MockLoginManager())
    }

}
