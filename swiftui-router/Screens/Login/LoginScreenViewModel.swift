//
//  LoginScreenViewModel.swift
//  RouterTest
//
//  Created by David Gary Wood on 1/05/21.
//

import Foundation

class LoginScreenViewModel: ObservableObject {
    @Injected(\.loginManager) var loginManager
    
    @Published var loggingIn: Bool = false
    
    init() {
        Logger.print("init:\(#file)")
    }
    
    deinit {
        Logger.print("deinit:\(#file)")
    }
    
    func logIn() {
        self.loginManager.logIn()
        self.loggingIn = true
    }
    
}
