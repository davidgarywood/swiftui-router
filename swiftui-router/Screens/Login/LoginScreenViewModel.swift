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
    
    func logIn() {
        self.services.loginManager.logIn()
        self.loggingIn = true
    }
    
}
