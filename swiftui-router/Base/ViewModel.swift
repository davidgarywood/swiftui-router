
import Foundation
import Combine

open class BaseViewModel<S> {
    
    public var services: S
    
    public init(services: S) {
        self.services = services
    }
        
}
