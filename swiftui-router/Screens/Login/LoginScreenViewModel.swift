//
//  LoginScreenViewModel.swift
//  RouterTest
//
//  Created by David Gary Wood on 1/05/21.
//

import Foundation
import Combine

class LoginScreenViewModel: BaseViewModel<Services>, ObservableObject {
    @Published var loggingIn: Bool = false
    
    override init(services: Services) {
        super.init(services: services)
        Logger.print("init:\(#file)")
    }
    
    deinit {
        Logger.print("deinit:\(#file)")
    }
    
    func logIn() {
        self.services.loginManager.logIn()
        self.loggingIn = true
    }
    
}
