//
//  AccountScreenViewModel.swift
//  RouterTest
//
//  Created by David Gary Wood on 1/05/21.
//

import Foundation
import Combine

class AccountScreenViewModel: BaseViewModel<Services>, ObservableObject {
    
    func logout() {
        self.services.loginManager.logOut()
    }
    
}
