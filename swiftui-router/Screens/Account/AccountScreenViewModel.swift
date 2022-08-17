//
//  AccountScreenViewModel.swift
//  RouterTest
//
//  Created by David Gary Wood on 1/05/21.
//

import Foundation

class AccountScreenViewModel: ObservableObject {
    @Injected(\.loginManager) var loginManager
    
    
    init() {
        Logger.print("init:\(#file)")
    }
    
    deinit {
        Logger.print("deinit:\(#file)")
    }
    
    func logout() {
        self.loginManager.logOut()
    }
    
}
