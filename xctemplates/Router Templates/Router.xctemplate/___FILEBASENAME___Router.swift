//___FILEHEADER___

import Foundation
import SwiftUI

class ___FILEBASENAMEASIDENTIFIER___: Router {
    
    // MARK: - Published vars
    // Put published vars here
    
    // MARK: - Private vars
    
    // MARK: - Internal vars
    var services: Services
        
    // MARK: - Initialization

    init(services: Services) {
        self.services = services
    }
    
    // MARK: - Methods
    
    func rootView() -> some View {
        // Add your content here
        NavigationView {
            Text("Hello Word")
        }
    }
    
}
