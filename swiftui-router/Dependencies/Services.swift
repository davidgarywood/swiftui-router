//
//  Services.swift
//  RouterTest
//
//  Created by David Gary Wood on 24/04/21.
//

import Foundation

protocol Services {
    var defaultsManager: DefaultsManager { get }
    var loginManager: LoginManager { get }
}

class AppServices: Services {
    var loginManager: LoginManager
    var defaultsManager: DefaultsManager
        
    init() {
        let defaultsManager = AppDefaultsManager()
        self.defaultsManager = defaultsManager
        self.loginManager = AppLoginManager(defaultsManager: self.defaultsManager)
    }
}

class MockServices: Services {
    var defaultsManager: DefaultsManager = MockDefaultsManager()
    var loginManager: LoginManager = MockLoginManager()
}
