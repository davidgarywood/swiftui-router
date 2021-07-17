//
//  HomeScreenViewModel.swift
//  RouterTest
//
//  Created by David Gary Wood on 1/05/21.
//

import Foundation
import Combine

class HomeScreenViewModel: BaseViewModel<Services>, ObservableObject {
    
    override init(services: Services) {
        super.init(services: services)
        Logger.print("init:\(#file)")
    }
    
    deinit {
        Logger.print("deinit:\(#file)")
    }

}
