//___FILEHEADER___

import Foundation
import SwiftUI

class ___FILEBASENAMEASIDENTIFIER___: ObservableObject {
    // MARK: - Published vars
    
    // MARK: - Private vars
    
    // MARK: - Internal vars
    var services: Services
        
    // MARK: - Initialization

    init(services: Services) {
        self.services = services
    }
    
    // MARK: - Methods
    
    @ViewBuilder func contentView() -> some View {
        Text("Your content here")
    }
}

struct ___FILEBASENAMEASIDENTIFIER___View: View {
    @StateObject var router: ___FILEBASENAMEASIDENTIFIER___ = ___FILEBASENAMEASIDENTIFIER___()
        
    var body: some View {
        NavigationView {
            self.router.contentView()
        }
    }
}
