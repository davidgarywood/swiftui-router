//
//  OnboardingRouterRouter.swift
//  RouterTest
//
//  Created by David Gary Wood on 1/05/21.
//

import Foundation
import SwiftUI

protocol OnboardingRouterRouterDelegate: AnyObject {
}

class OnboardingRouterRouter: Router {
    
    // MARK: - Published vars
    // Put published vars here
    
    // MARK: - Private vars
    weak private var delegate: OnboardingRouterRouterDelegate?
    
    // MARK: - Internal vars
    var services: Services
        
    // MARK: - Initialization

    init(services: Services, delegate: OnboardingRouterRouterDelegate? = nil) {
        self.services = services
        self.delegate = delegate
    }
    
    // MARK: - Methods
    
    func rootView() -> some View {
        // Add your content here
        NavigationView {
            Text("Hello Word")
        }
    }
    
}
