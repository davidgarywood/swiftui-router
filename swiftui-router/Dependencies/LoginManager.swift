//
//  LoginManager.swift
//  RouterTest
//
//  Created by David Gary Wood on 1/05/21.
//

import Foundation
import Combine

public protocol LoginManager {
    var state: LoginState { get }
    func logIn()
    func logOut()
}

public class LoginState: ObservableObject {
    @Published var loggedIn: Bool = false
    @Published var userName: String?
}

class AppLoginManager: LoginManager {
    public var state: LoginState = LoginState()
    
    private var defaultsManager: DefaultsManager
    
    init(defaultsManager: DefaultsManager) {
        self.defaultsManager = defaultsManager
        
        self.setupValues()
    }
    
    private func setupValues() {
        self.state.loggedIn = self.defaultsManager.getDefault(.loggedIn)
        self.state.userName = self.defaultsManager.getDefault(.userName)
    }
    
    public func logIn() {
        // Simulate talking to an API with a 1 second delay, for the demo
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            self.state.loggedIn = true
            self.state.userName = "David"
            
            self.defaultsManager.setDefault(.loggedIn, value: true)
            self.defaultsManager.setDefault(.userName, value: "David")
        }
    }
    
    public func logOut() {
        self.state.loggedIn = false
        self.state.userName = nil
        
        self.defaultsManager.setDefault(.loggedIn, value: true)
    }
    
}

// Define the mock in the same class, so it's easier to maintain
class MockLoginManager: LoginManager {
    var state: LoginState = LoginState()
    
    var didLogin = false
    var didLogOut = false
    
    func logIn() {
        self.didLogin = true
    }

    func logOut() {
        self.didLogOut = true
    }
    
}
