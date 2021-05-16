//
//  Services.swift
//  RouterTest
//
//  Created by David Gary Wood on 24/04/21.
//

import Foundation

/// Services defines a holder for our App's dependencies, each Router and ViewModel will have access to Services
protocol Services {
    var defaultsManager: DefaultsManager { get }
    var loginManager: LoginManager { get }
}

/// Defines our App's services holder, using the protocol above. This will be the 'real' holder for our dependencies
class AppServices: Services {
    var loginManager: LoginManager
    var defaultsManager: DefaultsManager
        
    init() {
        let defaultsManager = AppDefaultsManager()
        self.defaultsManager = defaultsManager
        self.loginManager = AppLoginManager(defaultsManager: self.defaultsManager)
    }
}

/// Defines a mock services holder. This can be used as a starting point for mocks for testing our View Models
/// This is also used for giving to our ViewModels when creating SwiftUI Previews
class MockServices: Services {
    var defaultsManager: DefaultsManager = MockDefaultsManager()
    var loginManager: LoginManager = MockLoginManager()
}
