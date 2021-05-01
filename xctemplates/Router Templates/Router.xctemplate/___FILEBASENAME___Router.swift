//___FILEHEADER___

import Foundation
import SwiftUI

protocol ___FILEBASENAMEASIDENTIFIER___Delegate: AnyObject {
}

class ___FILEBASENAMEASIDENTIFIER___: Router {
    
    // MARK: - Published vars
    // Put published vars here
    
    // MARK: - Private vars
    weak private var delegate: ___FILEBASENAMEASIDENTIFIER___Delegate?
    
    // MARK: - Internal vars
    var services: Services
        
    // MARK: - Initialization

    init(services: Services, delegate: ___FILEBASENAMEASIDENTIFIER___Delegate? = nil) {
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
