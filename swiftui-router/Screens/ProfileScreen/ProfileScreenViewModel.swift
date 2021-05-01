//
//  ProfileScreenViewModel.swift
//  RouterTest
//
//  Created by David Gary Wood on 1/05/21.
//

import Foundation
import Combine

class ProfileScreenViewModel: BaseViewModel<Services>, ObservableObject {
    @Published var userName: String = ""
    
    override init(services: Services) {
        super.init(services: services)
        
        self.userName = self.services.loginManager.state.userName ?? "Unknown"
    }
}
