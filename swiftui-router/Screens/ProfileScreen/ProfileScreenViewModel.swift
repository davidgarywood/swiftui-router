//
//  ProfileScreenViewModel.swift
//  RouterTest
//
//  Created by David Gary Wood on 1/05/21.
//

import Foundation

class ProfileScreenViewModel: ObservableObject {
    @Injected(\.appState.loginState) var loginState
    
    @Published var userName: String = ""
    
    init() {
        Logger.print("init:\(#file)")
        
        self.setup()
    }
    
    deinit {
        Logger.print("deinit:\(#file)")
    }

    private func setup() {
        self.userName = self.loginState.userName ?? "Unknown"
    }
}
