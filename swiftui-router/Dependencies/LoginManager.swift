//
//  LoginManager.swift
//  RouterTest
//
//  Created by David Gary Wood on 1/05/21.
//

import Foundation

public protocol LoginManager {
    func logIn()
    func logOut()
}

public class LoginState: ObservableObject {
    @Published var loggedIn: Bool = false
    @Published var userName: String?
}

class AppLoginManager: LoginManager {
    private var state: LoginState
    
    init(loginState: LoginState) {
        self.state = loginState
        self.setupValues()
    }
    
    private func setupValues() {
        self.state.loggedIn = AppDefaults.loggedIn.get()
        self.state.userName = AppDefaults.userName.get()
    }

    public func logIn() {
        // Simulate talking to an API with a 1 second delay, for the demo
        
        let testUserName = "David"
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) { [weak self] in
            self?.state.loggedIn = true
            self?.state.userName = testUserName

            AppDefaults.loggedIn.set(true)
            AppDefaults.userName.set(testUserName)
        }
    }
    
    public func logOut() {
        self.state.loggedIn = false
        self.state.userName = nil
        
        AppDefaults.loggedIn.set(false)
        AppDefaults.userName.set(nil)
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
