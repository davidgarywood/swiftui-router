//
//  HelpRouter.swift
//  RouterTest
//
//  Created by David Gary Wood on 1/05/21.
//

import Foundation
import SwiftUI

protocol HelpRouterDelegate: AnyObject {
}

class HelpRouter: Router {
    
    // MARK: - Published vars
    // Put published vars here
    
    // MARK: - Private vars
    weak private var delegate: HelpRouterDelegate?
    
    // MARK: - Internal vars
    var services: Services
        
    // MARK: - Initialization

    init(services: Services, delegate: HelpRouterDelegate? = nil) {
        self.services = services
        self.delegate = delegate
    }
    
    // MARK: - Methods
    
    func rootView() -> some View {
        // Add your content here
        NavigationView {
            TabView {
                self.helpContent(text: "Some content to help the user is here")
                self.helpContent(text: "Page 2")
                self.helpContent(text: "Page 3")
                self.helpContent(text: "Page 4")
            }
            .tabViewStyle(PageTabViewStyle())
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func helpContent(text: String) -> some View {
        return Text(text)
    }
    
}

