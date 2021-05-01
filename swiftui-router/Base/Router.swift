//
//  Router.swift
//
//  Created by David.Wood on 25/4/21.
//

import Foundation
import SwiftUI

public protocol Router: ObservableObject {
    associatedtype ViewOutput: View
    
    func rootView() -> ViewOutput
}
